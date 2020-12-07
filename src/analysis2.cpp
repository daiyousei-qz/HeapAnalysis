#include "analysis2.h"
#include "llvm/Analysis/CFG.h"
#include <deque>
#include <unordered_set>

using namespace std;
using namespace llvm;

namespace mh
{
    AnalysisContext::AnalysisContext(const SummaryEnvironment* env, const FunctionSummary* summary)
        : smt_solver_(summary->inputs.size()), ctrl_flow_info_(summary->func)
    {
        this->env_           = env;
        this->summary_entry_ = summary;

        // add alias rejection
        const vector<const Value*>& inputs = summary->inputs;
        vector<int> ptr_nest_levels;
        for (const Value* arg : inputs)
        {
            ptr_nest_levels.push_back(GetPointerNestLevel(arg->getType()));
        }

        for (size_t i = 0; i < inputs.size(); ++i)
        {
            for (size_t j = 0; j < i; ++j)
            {
                const Value* arg_i = inputs[i];
                const Value* arg_j = inputs[j];
                const Type* type_i = arg_i->getType();
                const Type* type_j = arg_j->getType();

                if (!type_i->isPointerTy() || !type_j->isPointerTy())
                {
                    smt_solver_.RejectAlias(i, j);

#ifdef HEAP_ANALYSIS_DEBUG_MODE
                    fmt::print("[analysis] rejecting alias({}, {}), reason: non-ptr type\n", i, j);
#endif
                }

                if (ptr_nest_levels[i] != ptr_nest_levels[j])
                {
                    // TODO: exclude opaque pointer, i.e. void*
                    // TODO: add toggles for relaxed aliasing rules
                    // TODO: reject non-interfering alias, e.g. two pointers that are not written
                    smt_solver_.RejectAlias(i, j);

#ifdef HEAP_ANALYSIS_DEBUG_MODE
                    fmt::print("[analysis] rejecting alias({}, {}), reason: different ptr level\n",
                               i, j);
#endif
                }
            }
        }

        // initialize entry store for analysis
        for (int i = 0; i < inputs.size(); ++i)
        {
            const llvm::Value* arg_i = inputs[i];
            int ptr_level_i          = ptr_nest_levels[i];
            const LocationVar loc_i  = LocationVar::FromRegister(arg_i);

            // add edges when there's strictly no aliasing, i.e. vi -> *vi -> **vi
            LocationVar loc         = loc_i;
            LocationVar loc_pointed = LocationVar::FromRuntimeMemory(arg_i, 0);
            entry_store_[loc]       = {{loc_pointed, smt_solver_.MakeAliasConstraint(i, i)}};

            for (int k = 0; k < ptr_level_i; ++k)
            {
                loc               = loc_pointed;
                loc_pointed       = LocationVar::FromRuntimeMemory(arg_i, k + 1);
                entry_store_[loc] = {{loc_pointed, Constraint{true}}};
            }

            // add edges under aliased conditions
            for (int j = 0; j < i; ++j)
            {
                if (smt_solver_.TestAlias(i, j))
                {
                    LocationVar loc_alias = LocationVar::FromRuntimeMemory(inputs[j], 0);
                    entry_store_[loc_i].insert(
                        pair{loc_alias, smt_solver_.MakeAliasConstraint(i, j)});
                }
            }
        }

        // move edges from register location to regfile from entry store
        for (auto it = entry_store_.begin(); it != entry_store_.end();)
        {
            if (it->first.Tag() == LocationTag::Register)
            {
                regfile_[it->first.Definition()] = move(it->second);

                it = entry_store_.erase(it);
            }
            else
            {
                ++it;
            }
        }
    }

    std::unique_ptr<AbstractExecution>
    AnalysisContext::InitializeExecution(const llvm::BasicBlock* bb)
    {
        AbstractStore bb_init_store;
        auto merge_store = [&](const AbstractStore& store) {
            if (bb_init_store.empty())
            {
                bb_init_store = store;
            }
            else
            {
                MergeAbstractStore(bb_init_store, store);
            }
        };

        // merge
        for (const BasicBlock* pred_bb : predecessors(bb))
        {
            bool loopback = ctrl_flow_info_.IsBackEdge(pred_bb, bb);
            if (auto it = exec_store_cache_.find(pred_bb); it != exec_store_cache_.end())
            {
                merge_store(it->second);
            }
            else if (!loopback)
            {
                throw "premature initialization of execution for this block";
            }
        }

        // TODO: is this condition sufficient for detecting the first basic block?
        if (bb_init_store.empty())
        {
            // then this is the first basic block of the function
            bb_init_store = this->entry_store_;
        }

        NormalizeStore(smt_solver_, bb_init_store);
        return std::make_unique<AbstractExecution>(this, move(bb_init_store));
    }

    bool AnalysisContext::CommitExecution(const llvm::BasicBlock* bb,
                                          std::unique_ptr<AbstractExecution> exec)
    {
        // retrieve result store and normalize
        AbstractStore result_store = move(exec->store_);
        NormalizeStore(smt_solver_, result_store);

        // find iterator to the old store
        auto it = exec_store_cache_.find(bb);

        // first run, always update
        if (it == exec_store_cache_.end())
        {
            exec_store_cache_[bb] = move(result_store);
            return true;
        }

        // consequent run, update if execution state is changed
        if (!EqualAbstractStore(smt_solver_, it->second, result_store))
        {
            it->second = move(result_store);
            return true;
        }

        // no update
        return false;
    }

    AbstractStore AnalysisContext::ExportStore()
    {
        AbstractStore result = std::move(exec_store_cache_.at(&summary_entry_->func->back()));
        for (auto& [reg, pt_map] : regfile_)
        {
            result[LocationVar::FromRegister(reg)] = std::move(pt_map);
        }

        return result;
    }

    void AnalysisContext::ExportRAWDependency()
    {
        vector<const StoreInst*> stores;
        vector<const LoadInst*> loads;
        unordered_map<const Instruction*, int> inst_index_lookup;

        for (const BasicBlock& bb : *summary_entry_->func)
        {
            int index = 0;
            for (const Instruction& inst : bb)
            {
                if (auto store_inst = dyn_cast<StoreInst>(&inst))
                {
                    stores.push_back(store_inst);
                    inst_index_lookup[store_inst] = index;
                }
                else if (auto load_inst = dyn_cast<LoadInst>(&inst))
                {
                    loads.push_back(load_inst);
                    inst_index_lookup[load_inst] = index;
                }

                index += 1;
            }
        }

        auto test_may_alias = [&](const Value* store_ptr_reg, const Value* load_ptr_reg) {
            store_ptr_reg = TranslateAliasReg(store_ptr_reg);
            load_ptr_reg  = TranslateAliasReg(load_ptr_reg);

            const PointToMap& store_pt_map = regfile_.at(store_ptr_reg);
            const PointToMap& load_pt_map  = regfile_.at(load_ptr_reg);
            for (const auto& [loc, c_store_ptr] : store_pt_map)
            {
                auto iter = load_pt_map.find(loc);
                if (iter != load_pt_map.end())
                {
                    const auto& c_load_ptr = iter->second;
                    if (smt_solver_.TestSatisfiability(c_store_ptr && c_load_ptr))
                    {
                        return true;
                    }
                }
            }

            return false;
        };

        auto store_may_exec_before_load = [&](const StoreInst* store_inst,
                                              const LoadInst* load_inst) {
            const BasicBlock* bb_store = store_inst->getParent();
            const BasicBlock* bb_load  = load_inst->getParent();
            if (bb_store == bb_load)
            {
                return inst_index_lookup[load_inst] > inst_index_lookup[store_inst];
            }
            else
            {
                return ctrl_flow_info_.LookupExecAfterCondition(bb_store, bb_load) !=
                       ExecAfterCondition::Never;
            }
        };

        vector<pair<const StoreInst*, const LoadInst*>> pdg_edges;
        for (const LoadInst* load_inst : loads)
        {
            for (const StoreInst* store_inst : stores)
            {
                if (store_may_exec_before_load(store_inst, load_inst))
                {
                    const Value* store_ptr = store_inst->getPointerOperand();
                    const Value* load_ptr  = load_inst->getPointerOperand();

                    if (store_ptr == load_ptr || test_may_alias(store_ptr, load_ptr))
                    {
                        pdg_edges.push_back(pair{store_inst, load_inst});
                    }
                }
            }
        }
    }

    void PrintStore(const AbstractStore& store, const vector<LocationVar>& root_locs,
                    const AbstractRegFile* regfile           = nullptr,
                    const vector<const llvm::Value*>* inputs = nullptr,
                    bool output_graphviz                     = kHeapAnalysisPresentationPrint)
    {
        unordered_set<LocationVar> known_locs;
        deque<LocationVar> important_locs;

        for (const auto& loc : root_locs)
        {
            known_locs.insert(loc);
            important_locs.push_back(loc);
        }

        fmt::print("[Abstract Store]\n");
        auto lookup_store = [&](LocationVar loc) -> const PointToMap& {
            if (loc.Tag() == LocationTag::Register && regfile != nullptr)
            {
                return regfile->at(loc.Definition());
            }
            else if (auto it = store.find(loc); it != store.end())
            {
                return it->second;
            }
            else
            {
                static const PointToMap empty_ptmap;
                return empty_ptmap;
            }
        };

        // print graphviz header
        if (output_graphviz)
        {
            fmt::print("digraph G {{\n");

            // legend for constraint terms
            if (inputs != nullptr)
            {
                for (int i = 0; i < inputs->size(); ++i)
                {
                    fmt::print("  \"x{}: {}\" [shape=box]\n", i,
                               LocationVar::FromRegister((*inputs)[i]));
                }
            }
        }

        // point-to graph
        while (!important_locs.empty())
        {
            auto loc = important_locs.front();
            important_locs.pop_front();

            const PointToMap& pt_map = lookup_store(loc);
            if (pt_map.empty())
            {
                continue;
            }

            if (output_graphviz)
            {
                for (const auto& [target_loc, constraint] : pt_map)
                {
                    fmt::print("  \"{}\" -> \"{}\" [label=\"{}\"];\n", loc, target_loc, constraint);

                    if (known_locs.find(target_loc) == known_locs.end())
                    {
                        known_locs.insert(target_loc);
                        important_locs.push_back(target_loc);
                    }
                }
            }
            else
            {
                fmt::print("| {}\n", loc);
                for (const auto& [target_loc, constraint] : pt_map)
                {
                    fmt::print("  -> {} ? {}\n", target_loc, constraint);

                    if (known_locs.find(target_loc) == known_locs.end())
                    {
                        known_locs.insert(target_loc);
                        important_locs.push_back(target_loc);
                    }
                }
            }
        }

        // print graphviz terminator
        if (output_graphviz)
        {
            fmt::print("}}\n");
        }
    }

    void AnalysisContext::DebugPrint(const BasicBlock* bb)
    {
        vector<LocationVar> root_locs;

        // to print input pointers
        for (const Value* input_reg : summary_entry_->inputs)
        {
            root_locs.push_back(LocationVar::FromRegister(input_reg));
        }

        // to print return value
        if (const Value* ret_val = summary_entry_->return_inst->getReturnValue();
            ret_val != nullptr)
        {
            root_locs.push_back(LocationVar::FromRegister(ret_val));
        }

        const AbstractStore& store = bb != nullptr ? exec_store_cache_.at(bb) : entry_store_;
        PrintStore(store, root_locs, &regfile_, &summary_entry_->inputs);
    }

    void DebugPrint(const AbstractStore& store)
    {
        vector<LocationVar> root_locs;

        for (const auto& [loc, pt_map] : store)
        {
            root_locs.push_back(loc);
        }

        PrintStore(store, root_locs, nullptr, nullptr);
    }

    void DebugPrint(const FunctionSummary& summary)
    {
        vector<LocationVar> root_locs;

        // to print input pointers
        for (const Value* input_reg : summary.inputs)
        {
            root_locs.push_back(LocationVar::FromRegister(input_reg));
        }

        // to print return value
        if (const Value* ret_val = summary.return_inst->getReturnValue(); ret_val != nullptr)
        {
            root_locs.push_back(LocationVar::FromRegister(ret_val));
        }

        PrintStore(summary.store, root_locs, nullptr, &summary.inputs);
    }

    bool AnalysisContext::AnalyzeBlock(const llvm::BasicBlock* bb)
    {
#ifdef HEAP_ANALYSIS_DEBUG_MODE
        fmt::print("analyzing block {}...\n", bb->getName());
#endif

        auto exec = InitializeExecution(bb);
        // vector<const StoreInst*> stores_so_far;

        for (const Instruction& inst : *bb)
        {
#ifdef HEAP_ANALYSIS_DEBUG_MODE
            fmt::print("interpreting {}...\n", static_cast<const Value&>(inst));
#endif
            if (isa<AllocaInst>(inst))
            {
                exec->DoAlloc(&inst, false);
            }
            else if (IsMallocCall(&inst))
            {
                exec->DoAlloc(&inst, true);
            }
            else if (isa<BitCastInst>(&inst))
            {
                // TODO:
                AssignAliasReg(&inst, inst.getOperand(0));
            }
            else if (isa<GetElementPtrInst>(&inst))
            {
                // TODO: mark summary location
                AssignAliasReg(&inst, inst.getOperand(0));
            }
            else if (auto store_inst = dyn_cast<StoreInst>(&inst))
            {
                exec->DoStore(store_inst->getValueOperand(), store_inst->getPointerOperand());

                // stores_so_far.push_back(store_inst);
            }
            else if (auto load_inst = dyn_cast<LoadInst>(&inst))
            {
                exec->DoLoad(&inst, load_inst->getPointerOperand());

                // TODO: move PDG out of alias analysis
                // for (auto store : stores_so_far)
                // {
                //     TryAddPdgEdge(*exec, store, load_inst);
                // }
                // for (const auto& src_bb : ctx.block_src_map_[block])
                // {
                //     for (auto store : ctx.block_store_cache_[src_bb])
                //     {
                //         TryAddPdgEdge(*exec, store, load_inst);
                //     }
                // }
            }
            else if (auto call_inst = dyn_cast<CallInst>(&inst))
            {
                const Function* callee                = call_inst->getCalledFunction();
                const FunctionSummary& callee_summary = Environment()->LookupSummary(callee);

                std::vector<const llvm::Value*> reg_inputs;
                reg_inputs.reserve(callee_summary.inputs.size());
                copy(call_inst->arg_begin(), call_inst->arg_end(), back_inserter(reg_inputs));
                copy(callee_summary.globals.begin(), callee_summary.globals.end(),
                     back_inserter(reg_inputs));

                exec->DoInvoke(&inst, reg_inputs, callee_summary);
            }
            else if (isa<PHINode>(&inst))
            {
                exec->DoAssignPhi(&inst, inst.getOperand(0), inst.getOperand(1));
            }
            else
            {
                exec->DoAssign(&inst, LocationVar::FromProgramValue(&inst));
            }
        }

        return CommitExecution(bb, move(exec));
    }

    // analyze the function once, assuming summaries of all called functions ready
    void AnalyzeFunctionAux(SummaryEnvironment& env, FunctionSummary& summary,
                            bool dependencies_converged = false)
    {
        if (summary.converged)
        {
            return;
        }

#ifdef HEAP_ANALYSIS_DEBUG_MODE
        llvm::outs() << "---------\n";
        llvm::outs() << *summary.func << "\n";
#endif

        AnalysisContext ctx{&env, &summary};

        const Function* func = summary.func;
        unordered_set<const BasicBlock*> workset{&func->front()};
        deque<const BasicBlock*> worklist{&func->front()};

        while (!worklist.empty())
        {
            const BasicBlock* bb = worklist.front();
            worklist.pop_front();
            workset.erase(bb);

            if (ctx.AnalyzeBlock(bb))
            {
                for (const BasicBlock* succ_bb : successors(bb))
                {
                    if (workset.find(succ_bb) == workset.end())
                    {
                        worklist.push_back(succ_bb);
                        workset.insert(succ_bb);
                    }
                }
            }
        }

#ifdef HEAP_ANALYSIS_DEBUG_MODE
        ctx.DebugPrint(&func->back());
#endif

        // TODO: what solver to use?
        AbstractStore result_store = ctx.ExportStore();
        if (summary.store.empty() || !EqualAbstractStore(ctx.Solver(), summary.store, result_store))
        {
            summary.store = move(result_store);
            if (dependencies_converged)
            {
                summary.converged = true;
            }
        }
        else
        {
            summary.converged = true;
        }
    }

    void AnalyzeFunctionRecursive(SummaryEnvironment& env, FunctionSummary& summary,
                                  unordered_set<const Function*>& analysis_history,
                                  bool expect_converge)
    {
        if (analysis_history.find(summary.func) != analysis_history.end())
        {
            if (summary.store.empty())
            {
                // TODO: do some initialization?
            }

            return;
        }

        vector<FunctionSummary*> recursive_summaries;
        for (const Function* called_func : summary.called_functions)
        {
            FunctionSummary& called_summary = env.LookupSummary(called_func);
            if (called_summary.func->doesNotRecurse())
            {
                if (!called_summary.converged)
                {
                    AnalyzeFunctionRecursive(env, called_summary, analysis_history, true);
                }

                assert(called_summary.converged);
            }
            else
            {
                recursive_summaries.push_back(&called_summary);
            }
        }

        analysis_history.insert(summary.func);

        do
        {
            bool dep_converged = true;
            for (FunctionSummary* called_summmary : recursive_summaries)
            {
                if (!called_summmary->converged)
                {
                    AnalyzeFunctionRecursive(env, *called_summmary, analysis_history,
                                             summary.func->doesNotRecurse());
                }

                dep_converged = dep_converged && called_summmary->converged;
            }

            AnalyzeFunctionAux(env, summary, dep_converged);
        } while (expect_converge && !summary.converged);

        analysis_history.erase(summary.func);
    }

    // TODO: llvm::Function::doesNotRecurse doesn't return the correct result
    //  need an analysis to detect recursion
    void AnalyzeFunction(SummaryEnvironment& env, const Function* func)
    {
        FunctionSummary& summary = env.LookupSummary(func);
        if (summary.converged)
        {
            return;
        }

        unordered_set<const Function*> analysis_history;
        AnalyzeFunctionRecursive(env, summary, analysis_history, true);
    }

} // namespace mh
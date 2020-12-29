#include "analysis.h"
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
        this->env_             = env;
        this->current_summary_ = summary;

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
        AbstractStore result = std::move(exec_store_cache_.at(&current_summary_->func->back()));
        for (auto& [reg, pt_map] : regfile_)
        {
            result[LocationVar::FromRegister(reg)] = std::move(pt_map);
        }

        NormalizeStore(smt_solver_, result);
        return result;
    }

    void AnalysisContext::ExportRAWDependency()
    {
        // collect store and load instructions in the function
        vector<const StoreInst*> stores;
        vector<const LoadInst*> loads;

        for (const BasicBlock& bb : *current_summary_->func)
        {
            for (const Instruction& inst : bb)
            {
                if (auto store_inst = dyn_cast<StoreInst>(&inst))
                {
                    stores.push_back(store_inst);
                }
                else if (auto load_inst = dyn_cast<LoadInst>(&inst))
                {
                    loads.push_back(load_inst);
                }
            }
        }

        // compute pdge edges with constraints
        map<pair<const LoadInst*, const StoreInst*>, Constraint> pdg_edges;
        for (const LoadInst* load_inst : loads)
        {
            const PointToMap& load_ptr_pt_map =
                regfile_.at(TranslateAliasReg(load_inst->getPointerOperand()));

            for (const auto& [loc_load_ptr, c_load_ptr] : load_ptr_pt_map)
            {
                // lookup dependencies for the particular ptr location
                unordered_map<const StoreInst*, Constraint> dependencies;

                for (const StoreInst* store_inst : stores)
                {
                    if (ctrl_flow_info_.LookupExecAfterCondition(store_inst, load_inst) ==
                        ExecAfterCondition::Never)
                    {
                        // load instruction never executes after this store instruction
                        // violate control flow
                        continue;
                    }

                    const PointToMap& store_ptr_pt_map =
                        regfile_.at(TranslateAliasReg(store_inst->getPointerOperand()));

                    if (auto it_store_ptr = store_ptr_pt_map.find(loc_load_ptr);
                        it_store_ptr != store_ptr_pt_map.end())
                    {
                        const auto& [loc_store_ptr, c_store_ptr] = *it_store_ptr;

                        // pointer doesn't alias
                        if (loc_load_ptr != loc_store_ptr &&
                            !smt_solver_.TestSatisfiability(c_load_ptr && c_store_ptr))
                        {
                            continue;
                        }

                        // indicate if this store would be overwritten by a following store
                        bool store_overwritten = false;
                        for (auto it_dep_store = dependencies.begin();
                             it_dep_store != dependencies.end();)
                        {
                            const auto& [dep_store_inst, c_dep_store_ptr] = *it_dep_store;

                            if (ctrl_flow_info_.LookupExecAfterCondition(
                                    dep_store_inst, store_inst) == ExecAfterCondition::Must &&
                                smt_solver_.TestImplication(c_store_ptr, c_dep_store_ptr))
                            {
                                // this store instruction overwrite dep_store
                                it_dep_store = dependencies.erase(it_dep_store);
                                continue;
                            }

                            if (ctrl_flow_info_.LookupExecAfterCondition(
                                    store_inst, dep_store_inst) == ExecAfterCondition::Must &&
                                smt_solver_.TestImplication(c_dep_store_ptr, c_store_ptr))
                            {
                                // this store instruction is overwritten by dep_store
                                store_overwritten = true;
                                break;
                            }

                            ++it_dep_store;
                        }

                        if (!store_overwritten)
                        {
                            dependencies.insert_or_assign(store_inst, c_store_ptr);
                        }
                    }
                }

                for (const auto& [store_inst, c_store_ptr] : dependencies)
                {
                    Constraint& constraint = pdg_edges[pair{load_inst, store_inst}];

                    constraint = constraint || (c_load_ptr && c_store_ptr);
                }
            }
        }

        // test print
        if (kHeapAnalysisPresentationPrint)
        {
            fmt::print("digraph PDG {{\n");
        }
        else
        {
            fmt::print("[RAW deps]:\n");
        }
        for (auto& [loadstore, constraint] : pdg_edges)
        {
            constraint.Simplify();
            if (kHeapAnalysisPresentationPrint)
            {
                fmt::print("  \"{}\" -> \"{}\"[label=\"{}\"]\n",
                           *static_cast<const Value*>(loadstore.first),
                           *static_cast<const Value*>(loadstore.second), constraint);
            }
            else
            {
                fmt::print(" ({} -> {}) ? {}\n", *static_cast<const Value*>(loadstore.first),
                           *static_cast<const Value*>(loadstore.second), constraint);
            }
        }
        if (kHeapAnalysisPresentationPrint)
        {
            fmt::print("}}\n");
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
        for (const Value* input_reg : current_summary_->inputs)
        {
            root_locs.push_back(LocationVar::FromRegister(input_reg));
        }

        // to print registers in this block
        for (const Instruction& inst : *bb)
        {
            if (regfile_.find(&inst) != regfile_.end())
            {
                root_locs.push_back(LocationVar::FromRegister(&inst));
            }
        }

        const AbstractStore& store = bb != nullptr ? exec_store_cache_.at(bb) : entry_store_;
        PrintStore(store, root_locs, &regfile_, &current_summary_->inputs);
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

        for (const Instruction& inst : *bb)
        {
#ifdef HEAP_ANALYSIS_DEBUG_MODE
            fmt::print("interpreting {}...\n", static_cast<const Value&>(inst));
#endif
            if (isa<AllocaInst>(inst))
            {
                exec->DoAlloc(&inst);
            }
            else if (IsMallocCall(&inst))
            {
                exec->DoAlloc(&inst);
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
            }
            else if (auto load_inst = dyn_cast<LoadInst>(&inst))
            {
                exec->DoLoad(&inst, load_inst->getPointerOperand());
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

                exec->DoInvoke(&inst, callee_summary, reg_inputs);
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
        deque<const BasicBlock*> worklist;
        unordered_set<const BasicBlock*> workset;

        for (const BasicBlock& bb : *func)
        {
            worklist.push_back(&bb);
            workset.insert(&bb);
        }

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
        ctx.ExportRAWDependency();
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

#ifdef HEAP_ANALYSIS_DEBUG_MODE
        mh::DebugPrint(summary.store);
#endif
    }

    void AnalyzeFunctionRecursive(SummaryEnvironment& env, FunctionSummary& summary,
                                  unordered_set<const Function*>& analysis_history,
                                  bool expect_converge)
    {
        // function already in the call chain, omit analysis and return
        if (analysis_history.find(summary.func) != analysis_history.end())
        {
            return;
        }

        // collect recursive called functions and analyze non-recursive called functions
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

        // add the current function to the call chain
        analysis_history.insert(summary.func);

        do
        {
            // analyze the called functions
            bool dep_converged = true;
            for (FunctionSummary* called_summmary : recursive_summaries)
            {
                if (!called_summmary->converged)
                {
                    AnalyzeFunctionRecursive(env, *called_summmary, analysis_history, false);
                }

                dep_converged = dep_converged && called_summmary->converged;
            }

            // analyze the current function
            AnalyzeFunctionAux(env, summary, dep_converged);
        } while (expect_converge && !summary.converged);

        // remove the current function from the call chain
        analysis_history.erase(summary.func);
    }

    // TODO: llvm::Function::doesNotRecurse doesn't return the correct result
    //       need an analysis to detect recursion
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
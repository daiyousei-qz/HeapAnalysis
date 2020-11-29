#include "analysis2.h"
#include "llvm/Analysis/CFG.h"
#include <deque>
#include <unordered_set>

using namespace std;
using namespace llvm;

namespace mh
{
    AnalysisContext::AnalysisContext(const SummaryEnvironment* env, const FunctionSummary* summary)
        : smt_solver_(summary->inputs.size())
    {
        this->env_           = env;
        this->summary_entry_ = summary;

        // collect backward control flow edges
        {
            SmallVector<std::pair<const BasicBlock*, const BasicBlock*>, 8> buffer;
            FindFunctionBackedges(*summary->func, buffer);

            this->backedges_ = std::set<ControlFlowEdge>(buffer.begin(), buffer.end());
        }

        // add alias rejection
        const auto& inputs = summary->inputs;
        vector<int> ptr_nest_levels;
        for (const auto& arg : inputs)
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
                }

                if (ptr_nest_levels[i] != ptr_nest_levels[j])
                {
                    // TODO: exclude opaque pointer, i.e. void*
                    // TODO: add toggles for relaxed aliasing rules
                    // TODO: reject non-interfering alias, e.g. two pointers that are not written
                    smt_solver_.RejectAlias(i, j);
                }
            }
        }

        // initialize store for analysis
        for (int i = 0; i < inputs.size(); ++i)
        {
            const llvm::Value* arg_i = inputs[i];
            const LocationVar loc_i  = LocationVar::FromRegister(arg_i);

            // add edges when there's strictly no aliasing, i.e. vi -> *vi -> **vi
            LocationVar loc         = loc_i;
            LocationVar loc_pointed = LocationVar::FromRuntimeMemory(arg_i, 0);
            init_store_[loc]        = {{loc_pointed, smt_solver_.MakeAliasConstraint(i, i)}};

            int ptr_level = GetPointerNestLevel(arg_i->getType());
            for (int k = 0; k < ptr_level; ++k)
            {
                loc              = loc_pointed;
                loc_pointed      = LocationVar::FromRuntimeMemory(arg_i, k + 1);
                init_store_[loc] = {{loc_pointed, Constraint{true}}};
            }

            // add edges under aliased conditions
            for (int j = 0; j < i; ++j)
            {
                if (smt_solver_.TestAlias(i, j))
                {
                    LocationVar loc_alias = LocationVar::FromRuntimeMemory(inputs[j], 0);
                    init_store_[loc].insert(pair{loc_alias, smt_solver_.MakeAliasConstraint(i, j)});
                }
            }
        }

        // move reg edges to regfile
        for (auto it = init_store_.begin(); it != init_store_.end();)
        {
            if (it->first.Tag() == LocationTag::Register)
            {
                regfile_[it->first.Definition()] = move(it->second);

                it = init_store_.erase(it);
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
            bool loopback = backedges_.find(pair{pred_bb, bb}) != backedges_.end();
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
            bb_init_store = this->init_store_;
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

    // returns true if consequnt program state is updated
    bool AnalyzeBlock(AnalysisContext& ctx, const llvm::BasicBlock* bb)
    {
        auto exec = ctx.InitializeExecution(bb);
        // vector<const StoreInst*> stores_so_far;

        for (const Instruction& inst : *bb)
        {
#ifdef HEAP_ANALYSIS_DEBUG_MODE
            // fmt::print("interpreting {}...\n", static_cast<const Value&>(inst));
#endif
            if (isa<AllocaInst>(inst))
            {
                exec->DoAssign(&inst, LocationVar::FromStackAlloc(&inst));
            }
            else if (IsMallocCall(&inst))
            {
                exec->DoAssign(&inst, LocationVar::FromHeapAlloc(&inst));
            }
            else if (isa<BitCastInst>(&inst))
            {
                // TODO:
                ctx.AssignAliasReg(&inst, inst.getOperand(0));
            }
            else if (isa<GetElementPtrInst>(&inst))
            {
                // TODO: mark summary location
                ctx.AssignAliasReg(&inst, inst.getOperand(0));
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
                const FunctionSummary& callee_summary = ctx.Environment()->LookupSummary(callee);

                std::vector<const llvm::Value*> reg_inputs;
                reg_inputs.reserve(callee_summary.inputs.size());
                copy(call_inst->arg_begin(), call_inst->arg_end(), back_inserter(reg_inputs));
                copy(callee_summary.globals.begin(), callee_summary.globals.end(),
                     back_inserter(reg_inputs));

                exec->DoInvoke(call_inst, reg_inputs, callee_summary, ctx.GetCallPoint(call_inst));
            }
            else
            {
                exec->DoAssign(&inst, LocationVar::FromProgramValue(&inst));
            }
        }

        return ctx.CommitExecution(bb, move(exec));
    }

    void AnalyzeFunction(SummaryEnvironment& env, const llvm::Function* func)
    {
#ifdef HEAP_ANALYSIS_DEBUG_MODE
        llvm::outs() << "---------\n";
        llvm::outs() << *func << "\n";
#endif

        // InitializePdgAnalysis();

        FunctionSummary& summary = env.LookupSummary(func);
        AnalysisContext ctx{&env, &summary};

        unordered_set<const BasicBlock*> workset{&func->front()};
        deque<const BasicBlock*> worklist{&func->front()};

        while (!worklist.empty())
        {
            const BasicBlock* bb = worklist.front();
            worklist.pop_front();
            workset.erase(bb);

            if (AnalyzeBlock(ctx, bb))
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
        // auto term_exec = ctx.RetrieveExecution(&func->back());
        // DebugPrint(*term_exec, true);
        // PrintPdgEdge();
#endif

        // TODO: update summary
        // TODO: what solver to use?
        AbstractStore result_store = ctx.ExportStore();
        if (summary.store.empty() || !EqualAbstractStore(ctx.Solver(), summary.store, result_store))
        {
            summary.store = move(result_store);
        }
    }

} // namespace mh
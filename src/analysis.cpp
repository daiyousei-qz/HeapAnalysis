#include "analysis.h"
#include "execution.h"
#include "llvm-utils.h"
#include "fmt-utils.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstVisitor.h"
#include "llvm/Analysis/CFG.h"

#include <memory>
#include <vector>
#include <unordered_map>
#include <set>
#include <queue>

using namespace std;
using namespace llvm;

const Value* CollectReturnValue(const Function& F)
{
    // TODO: is return
    const ReturnInst* lastInst = dyn_cast<ReturnInst>(&F.back().back());
    assert(lastInst != nullptr);

    return lastInst->getReturnValue();
}

set<ControlFlowEdge> CollectBackwardEdge(const Function& F)
{
    SmallVector<pair<const BasicBlock*, const BasicBlock*>, 8> buffer;
    FindFunctionBackedges(F, buffer);

    return set<ControlFlowEdge>(buffer.begin(), buffer.end());
}

// TODO: do we need binary search?
AnalysisContext::AnalysisContext(const SummaryEnvironment* env, const Function* func)
    : smt_solver_(env->SmtEngine())
{
    env_  = env;
    func_ = func;

    // collect parameters
    for (const Argument& arg : func->args())
    {
        inputs_.push_back(&arg);
    }

    // collect called functions and used global variables
    for (const BasicBlock& bb : *func)
    {
        for (const Instruction& inst : bb)
        {
            if (const CallInst* call_inst = dyn_cast<CallInst>(&inst))
            {
                const Function* callee = call_inst->getCalledFunction();
                if (find(called_functions_.begin(), called_functions_.end(), callee) ==
                    called_functions_.end())
                {
                    called_functions_.push_back(callee);
                }
            }

            for (const Value* val : inst.operands())
            {
                const GlobalVariable* global_var = dyn_cast<GlobalVariable>(val);
                if (global_var != nullptr &&
                    find(globals_.begin(), globals_.end(), global_var) == globals_.end())
                {
                    globals_.push_back(global_var);
                    inputs_.push_back(global_var);
                }
            }
        }
    }

    // collect global variable used by called functions
    for (const Function* callee : called_functions_)
    {
        const FunctionSummary& callee_summary = env->LookupSummary(callee);
        for (const GlobalVariable* global_var : callee_summary.globals)
        {
            if (find(globals_.begin(), globals_.end(), global_var) == globals_.end())
            {
                globals_.push_back(global_var);
                inputs_.push_back(global_var);
            }
        }
    }

    return_val_ = CollectReturnValue(*func);
    backedges_  = CollectBackwardEdge(*func);

    // construct alias group
    for (int i = 0; i < inputs_.size(); ++i)
    {
        // because LLVM IR is in SSA form
        // non-ptr argument cannot be updated so alias analysis is inrelevant
        if (inputs_[i]->getType()->isPointerTy())
        {
            alias_group_.push_back(IndexedInputValue{i, inputs_[i]});
        }
    }

    smt_solver_.Initialize(inputs_.size());
}

// TODO: may use index of the instruction
int AnalysisContext::GetCallPoint(const llvm::Instruction* inst)
{
    auto iter = call_point_cache_.find(inst);
    if (iter != call_point_cache_.end())
    {
        return iter->second;
    }

    int next_call_pt = call_point_cache_.size() + 1;
    call_point_cache_.insert({inst, next_call_pt});
    return next_call_pt;
}

std::shared_ptr<AbstractExecution> AnalysisContext::InitializeExecution(const llvm::BasicBlock* bb)
{
    std::shared_ptr<AbstractExecution> result = nullptr;

    auto merge_exec = [&](const AbstractExecution& exec) {
        if (result == nullptr)
        {
            result = std::make_shared<AbstractExecution>(exec);
        }
        else
        {
            result->MergeWith(exec);
        }
    };

    // merge result of predecessor's consequent executions
    for (const BasicBlock* pred_bb : llvm::predecessors(bb))
    {
        bool loopback = backedges_.find(pair{pred_bb, bb}) != backedges_.end();
        if (auto it = exec_results_.find(pred_bb); it != exec_results_.end())
        {
            merge_exec(*it->second);
        }
        else if (!loopback)
        {
            throw "premature initialization of execution for this block";
        }
    }

    if (result == nullptr)
    {
        // then this is the first basic block of the function
        result = make_shared<AbstractExecution>(this, CreateBootstrapStore());
    }

    result->NormalizeStore();
    return result;
}

std::shared_ptr<AbstractExecution> AnalysisContext::RetrieveExecution(const llvm::BasicBlock* bb)
{
    if (auto it = exec_results_.find(bb); it != exec_results_.end())
    {
        return it->second;
    }
    else
    {
        return nullptr;
    }
}

bool AnalysisContext::UpdateExecution(const llvm::BasicBlock* bb,
                                      std::shared_ptr<AbstractExecution> new_exec)
{
    auto& stored_exec = exec_results_[bb];

    // first run
    if (stored_exec == nullptr)
    {
        stored_exec = new_exec;
        return true;
    }

    // consequent run
    if (!EqualAbstractStore(smt_solver_, stored_exec->GetStore(), new_exec->GetStore()))
    {
        stored_exec = new_exec;
        return true;
    }
    return false;
}

std::unique_ptr<FunctionSummary> AnalysisContext::YieldSummary()
{
    auto result      = std::make_unique<FunctionSummary>();
    result->function = func_;

    result->globals    = globals_;
    result->inputs     = inputs_;
    result->return_val = return_val_;
    result->result     = exec_results_.at(&func_->back());
    result->smt_engine = smt_solver_.Provider();
    return result;
}

AbstractStore AnalysisContext::CreateBootstrapStore()
{
    AbstractStore result;
    for (int i = 0; i < inputs_.size(); ++i)
    {
        const llvm::Value* val_i = inputs_[i];
        const LocationVar loc_i  = LocationVar::FromRegister(val_i);

        if (val_i->getType()->isPointerTy())
        {
            // add edge when there's strictly no alias, i.e. vi -> *vi -> **vi
            LocationVar loc         = loc_i;
            LocationVar loc_pointed = LocationVar::FromRuntimeMemory(val_i, 0);
            result[loc]             = {{loc_pointed, smt_solver_.MakeAliasConstraint(i, i)}};

            int ptr_level = GetPointerNestLevel(val_i->getType());
            for (int k = 0; k < ptr_level; ++k)
            {
                loc         = loc_pointed;
                loc_pointed = LocationVar::FromRuntimeMemory(val_i, k + 1);
                result[loc] = {{loc_pointed, smt_solver_.MakeTop()}};
            }

            // add edges representing alias
            for (int k = 0; k < alias_group_.size() && alias_group_[k].index < i; ++k)
            {
                auto [j, val_j] = alias_group_[k];

                // TODO: make typing consideration an togglable option
                if (inputs_[i]->getType() != inputs_[j]->getType())
                {
                    smt_solver_.RejectAlias(i, j);
                }

                LocationVar loc_alias = LocationVar::FromRuntimeMemory(val_j, 0);
                result[loc_i].insert(pair{loc_alias, smt_solver_.MakeAliasConstraint(i, j)});
            }
        }
        else
        {
            // with non-pointer type, no alias edges apply
            // so the pointer always points to the same location
            result[loc_i] = {{LocationVar::FromRuntimeMemory(val_i, 0), smt_solver_.MakeTop()}};
        }
    }

    return result;
}

// Analysis
//

// returns true if consequnt program state is updated
bool AnalyzeBlock(AnalysisContext& ctx, const llvm::BasicBlock* block)
{
    auto exec = ctx.InitializeExecution(block);

#ifdef HEAP_ANALYSIS_DEBUG_MODE
    // llvm::outs() << "===========================================\n";
    // llvm::outs() << ToString(*exec);
#endif

    for (const Instruction& inst : *block)
    {
        if (isa<AllocaInst>(inst))
        {
            exec->AssignRegister(&inst, LocationVar::FromStackAlloc(&inst));
        }
        else if (IsMallocCall(&inst))
        {
            exec->AssignRegister(&inst, LocationVar::FromHeapAlloc(&inst));
        }
        else if (isa<BitCastInst>(&inst))
        {
            // TODO:
            exec->AliasRegister(&inst, inst.getOperand(0));
        }
        else if (isa<GetElementPtrInst>(&inst))
        {
            // TODO: mark summary location
            exec->AliasRegister(&inst, inst.getOperand(0));
        }
        else if (auto store_inst = dyn_cast<StoreInst>(&inst))
        {
            exec->WriteStore(store_inst->getOperand(0), store_inst->getOperand(1));
        }
        else if (auto load_inst = dyn_cast<LoadInst>(&inst))
        {
            exec->ReadStore(&inst, load_inst->getOperand(0));
        }
        else if (auto call_inst = dyn_cast<CallInst>(&inst))
        {
            const Function* callee                = call_inst->getCalledFunction();
            const FunctionSummary& callee_summary = ctx.Environment().LookupSummary(callee);

            std::vector<const llvm::Value*> reg_inputs;
            reg_inputs.reserve(callee_summary.inputs.size());
            copy(call_inst->arg_begin(), call_inst->arg_end(), back_inserter(reg_inputs));
            copy(callee_summary.globals.begin(), callee_summary.globals.end(),
                 back_inserter(reg_inputs));

            exec->Invoke(call_inst, reg_inputs, callee_summary, ctx.GetCallPoint(call_inst));
        }
        else
        {
            exec->AssignRegister(&inst, LocationVar::FromProgramValue(&inst));
        }
    }

    exec->NormalizeStore();

#ifdef HEAP_ANALYSIS_DEBUG_MODE
    // llvm::outs() << "---------\n";
    // llvm::outs() << ToString(*exec);
#endif

    return ctx.UpdateExecution(block, exec);
}

std::unique_ptr<FunctionSummary>
AnalyzeFunction(const SummaryEnvironment& env,
                const std::unordered_set<const Function*>& call_history, const Function* func)
{
#ifdef HEAP_ANALYSIS_DEBUG_MODE
    llvm::outs() << "---------\n";
    llvm::outs() << *func << "\n";
#endif

    // TODO: should be retrieved from env?
    AnalysisContext ctx{&env, func};

    // TODO: should there be a workset?
    std::queue<const BasicBlock*> worklist;
    worklist.push(&func->front());

    while (!worklist.empty())
    {
        const BasicBlock* block = worklist.front();
        worklist.pop();

        if (AnalyzeBlock(ctx, block))
        {
            for (auto succ_block : successors(block))
            {
                worklist.push(succ_block);
            }
        }
    }

#ifdef HEAP_ANALYSIS_DEBUG_MODE
    auto term_exec = ctx.RetrieveExecution(&func->back());
    // llvm::outs() << ToString(*term_exec);
    DebugPrint(*term_exec, true);
#endif

    return ctx.YieldSummary();
}
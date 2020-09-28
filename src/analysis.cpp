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

vector<const Value*> CollectInputPtr(const Function& F)
{
    vector<const Value*> result;

    // collect parameters
    for (const Argument& arg : F.args())
    {
        // because LLVM IR is in SSA form
        // non-ptr argument cannot be updated so alias analysis is inrelevant
        if (arg.getType()->isPointerTy())
        {
            result.push_back(&arg);
        }
    }

    // collect global variables
    for (const BasicBlock& B : F)
    {
        for (const Instruction& I : B)
        {
            for (const Value* val : I.operands())
            {
                if (isa<GlobalVariable>(val) &&
                    find(result.begin(), result.end(), val) == result.end())
                {
                    result.push_back(val);
                }
            }
        }
    }

    return result;
}

const Value* CollectOutput(const Function& F)
{
    // TODO: is return
    const ReturnInst* lastInst = dyn_cast<ReturnInst>(&F.back().back());
    assert(lastInst != nullptr);

    return lastInst->getReturnValue();
}

AbstractStore CreateBootstrapStore(ConstraintSolver& smt_engine,
                                   const vector<const llvm::Value*>& inputs)
{
    AbstractStore result;

    for (int i = 0; i < inputs.size(); ++i)
    {
        auto val_i = inputs[i];
        auto loc_i = LocationVar::FromProgramValue(val_i);

        // edges when strictly no alias
        auto loc         = loc_i;
        auto pointed_loc = LocationVar{LocationTag::Dynamic, val_i, 0};
        result[loc] = {{pointed_loc, smt_engine.MakeAliasConstraint(i, i)}};

        auto ptr_level = GetPointerNestLevel(val_i->getType());
        for (int k = 0; k < ptr_level; ++k)
        {
            loc         = pointed_loc;
            pointed_loc = LocationVar{LocationTag::Dynamic, val_i, k + 1};
            result[loc] = {{pointed_loc, smt_engine.MakeTop()}};
        }

        // edges of alias
        for (int j = 0; j < i; ++j)
        {
            // TODO: add constraint term to take typing input alias
            // consideration?
            // TODO: make this an togglable option
            if (inputs[i]->getType() != inputs[j]->getType())
            {
                smt_engine.RejectAlias(i, j);
            }

            auto alias_loc = LocationVar{LocationTag::Dynamic, inputs[j], 0};
            result[loc_i].insert_or_assign(
                alias_loc, smt_engine.MakeAliasConstraint(i, j));
        }
    }

    return result;
}

set<ControlFlowEdge> CollectBackwardEdge(const Function& F)
{
    SmallVector<ControlFlowEdge, 0> buffer;
    FindFunctionBackedges(F, buffer);

    return set<ControlFlowEdge>(buffer.begin(), buffer.end());
}

AnalysisContext::AnalysisContext(shared_ptr<SummaryEnvironment> env,
                                 const Function* func)
    : smt_solver_(env->smt_engind)
{
    this->env       = std::move(env);
    this->func      = func;
    this->inputs    = CollectInputPtr(*func);
    this->output    = CollectOutput(*func);
    this->backedges = CollectBackwardEdge(*func);

    this->smt_solver_.Initialize(this->inputs.size());
}

AnalysisContext::AnalysisContext(const shared_ptr<SmtProvider>& smt_engine,
                                 const Function* fun)
    : smt_solver_(smt_engine)
{
    this->func      = fun;
    this->inputs    = CollectInputPtr(*fun);
    this->output    = CollectOutput(*fun);
    this->backedges = CollectBackwardEdge(*fun);

    this->smt_solver_.Initialize(this->inputs.size());
}

std::shared_ptr<AbstractExecution>
AnalysisContext::InitializeExecution(const llvm::BasicBlock* bb)
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
    for (auto pred_bb : llvm::predecessors(bb))
    {
        bool loopback =
            backedges.find(make_pair(pred_bb, bb)) != backedges.end();
        if (auto it = exec_results.find(pred_bb); it != exec_results.end())
        {
            merge_exec(*it->second);
        }
        else if (!loopback)
        {
            throw "premature initialization of execution for this block";
        }
    }

    // then this is the first basic block of the function
    if (result == nullptr)
    {
        result = std::make_shared<AbstractExecution>(
            this, CreateBootstrapStore(smt_solver_, inputs));
    }

    result->NormalizeStore();
    return result;
}

std::shared_ptr<AbstractExecution>
AnalysisContext::RetrieveExecution(const llvm::BasicBlock* bb)
{
    if (auto it = exec_results.find(bb); it != exec_results.end())
    {
        return it->second;
    }
    else
    {
        return nullptr;
    }
}

bool AnalysisContext::UpdateExecution(
    const llvm::BasicBlock* bb, std::shared_ptr<AbstractExecution> new_exec)
{
    auto& stored_exec = exec_results[bb];

    // first run
    if (stored_exec == nullptr)
    {
        stored_exec = new_exec;
        return true;
    }

    // consequent run
    if (!EqualAbstractStore(smt_solver_, stored_exec->GetStore(),
                            new_exec->GetStore()))
    {
        stored_exec = new_exec;
        return true;
    }

    return false;
}

std::unique_ptr<FunctionSummary> AnalysisContext::YieldSummary()
{
    auto result        = std::make_unique<FunctionSummary>();
    result->function   = func;
    result->inputs     = inputs;
    result->output     = output;
    result->result     = exec_results.at(&func->back());
    result->smt_engine = smt_solver_.Provider();
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

    for (const auto& I : *block)
    {
        if (isa<AllocaInst>(I))
        {
            exec->AssignRegister(&I, LocationVar{LocationTag::StackAlloc, &I});
        }
        else if (IsMallocCall(&I))
        {
            exec->AssignRegister(&I, LocationVar{LocationTag::HeapAlloc, &I});
        }
        else if (isa<BitCastInst>(&I))
        {
            // TODO:
            exec->AliasRegister(&I, I.getOperand(0));
        }
        else if (isa<GetElementPtrInst>(&I))
        {
            // TODO: mark summary location
            exec->AliasRegister(&I, I.getOperand(0));
        }
        else if (auto storeInst = dyn_cast<StoreInst>(&I))
        {
            exec->WriteStore(storeInst->getOperand(0),
                             storeInst->getOperand(1));
        }
        else if (auto loadInst = dyn_cast<LoadInst>(&I))
        {
            exec->ReadStore(&I, loadInst->getOperand(0));
        }
        else if (auto callInst = dyn_cast<CallInst>(&I))
        {
            const Function* callee         = callInst->getCalledFunction();
            std::vector<const Value*> args = std::vector<const Value*>(
                callInst->arg_begin(), callInst->arg_end());
            exec->Invoke(callInst, args.data(), *env.analysis_cache.at(callee));
        }
        else
        {
            exec->AssignRegister(&I, LocationVar{LocationTag::Value, &I});
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
                std::stack<const Function*>& call_chain, const Function* func)
{
#ifdef HEAP_ANALYSIS_DEBUG_MODE
    llvm::outs() << "---------\n";
    llvm::outs() << *fun << "\n";
#endif

    // TODO: should be retrieved from env?
    AnalysisContext ctx{&env, func};

    // TODO: should there be a workset?
    std::queue<const BasicBlock*> worklist;
    worklist.push(&fun->front());

    while (!worklist.empty())
    {
        auto block = worklist.front();
        worklist.pop();

        if (AnalyzeBlock(*this, ctx, block))
        {
            for (auto succ_block : successors(block))
            {
                worklist.push(succ_block);
            }
        }
    }

#ifdef HEAP_ANALYSIS_DEBUG_MODE
    auto term_exec = ctx->RetrieveExecution(&fun->back());
    // llvm::outs() << ToString(*term_exec);
    DebugPrint(*term_exec, false);
#endif

    return ctx.YieldSummary();
}
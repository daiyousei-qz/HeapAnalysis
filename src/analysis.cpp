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
    for (auto& arg : F.args())
    {
        // TODO: could we omit non-ptr variables?
        // because LLVM IR is in SSA form
        // non-ptr argument cannot be updated so alias analysis is inrelevant
        // if (arg.getType()->isPointerTy())
        // {
        //     result.push_back(&arg);
        // }
     
        result.push_back(&arg);
    }

    // collect global variables
    for (auto& B : F)
    {
        for (auto& I : B)
        {
            for (Value* val : I.operands())
            {
                if (isa<GlobalVariable>(val) && find(result.begin(), result.end(), val) == result.end())
                {
                    result.push_back(val);
                }
            }
        }
    }

    return result;
}

AbstractStore CreateBootstrapStore(ConstraintEngine& smt_engine, const vector<const llvm::Value*>& inputs)
{
    AbstractStore result;

    for (int i = 0; i < inputs.size(); ++i)
    {
        auto val_i = inputs[i];
        auto loc_i = LocationVar::FromProgramValue(val_i);

        // edges when strictly no alias
        auto loc = loc_i;
        auto pointed_loc = LocationVar{LocationTag::Dynamic, val_i, 0};
        result[loc] = { {pointed_loc, smt_engine.MakeAliasConstraint(i, i)} };

        auto ptr_level = GetPointerNestLevel(val_i->getType());
        for (int k = 0; k < ptr_level; ++k)
        {
            loc = pointed_loc;
            pointed_loc = LocationVar{LocationTag::Dynamic, val_i, k+1};
            result[loc] = { {pointed_loc, smt_engine.MakeTop()} };
        }

        // edges of alias
        for (int j = 0; j < i; ++j)
        {
            // TODO: add constraint term to take typing input alias consideration?
            // TODO: make this an togglable option
            if (inputs[i]->getType() != inputs[j]->getType())
            {
                smt_engine.RejectAlias(i, j);
            }

            auto alias_loc = LocationVar{LocationTag::Dynamic, inputs[j], 0};
            result[loc_i].insert_or_assign(alias_loc, smt_engine.MakeAliasConstraint(i, j));
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

AnalysisContext::AnalysisContext(const Function* func)
{
    this->func      = func;
    this->inputs    = CollectInputPtr(*func);
    this->backedges = CollectBackwardEdge(*func);

    this->smt_engine_.InitializeInput(this->inputs.size());
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
    for (auto pred_bb : llvm::predecessors(bb))
    {
        bool loopback = backedges.find(std::make_pair(pred_bb, bb)) != backedges.end();
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
        result = std::make_shared<AbstractExecution>(this, CreateBootstrapStore(smt_engine_, inputs));
    }

    result->NormalizeStore();
    return result;
}

std::shared_ptr<AbstractExecution> AnalysisContext::RetrieveExecution(const llvm::BasicBlock* bb)
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

bool AnalysisContext::UpdateExecution(const llvm::BasicBlock* bb, std::shared_ptr<AbstractExecution> new_exec)
{
    auto& stored_exec = exec_results[bb];
    
    // first run
    if (stored_exec == nullptr)
    {
        stored_exec = new_exec;
        return true;
    }

    // consequent run
    if (!EqualAbstractStore(smt_engine_, stored_exec->GetStore(), new_exec->GetStore()))
    {
        stored_exec = new_exec;
        return true;
    }

    return false;
}

// Analysis
//

// returns true if consequnt program state is updated
bool AnalyzeBlock(AnalysisContext& ctx, const llvm::BasicBlock* block)
{
    auto exec = ctx.InitializeExecution(block);

#ifdef MODULE_DEBUG_MODE
    // llvm::outs() << "===========================================\n";
    // llvm::outs() << ToString(*exec);
#endif

    for (const auto& I : *block)
    {
        LocationVar this_reg{LocationTag::Register, &I};

        if (isa<AllocaInst>(I))
        {
            exec->AssignRegister(this_reg, LocationVar{LocationTag::StackAlloc, &I});
        }
        else if (IsMallocCall(&I))
        {
            exec->AssignRegister(this_reg, LocationVar{LocationTag::HeapAlloc, &I});
        }
        else if (isa<BitCastInst>(&I))
        {
            // TODO:
            exec->AliasRegister(this_reg, LocationVar::FromProgramValue(I.getOperand(0)));
        }
        else if (isa<GetElementPtrInst>(&I))
        {
            // TODO: mark summary location
            exec->AliasRegister(this_reg, LocationVar::FromProgramValue(I.getOperand(0)));
        }
        else if (auto storeInst = dyn_cast<StoreInst>(&I))
        {
            auto loc_to_val = LocationVar::FromProgramValue(storeInst->getOperand(0));
            auto loc_to_ptr = LocationVar::FromProgramValue(storeInst->getOperand(1));

            exec->WriteStore(loc_to_val, loc_to_ptr);
        }
        else if (auto loadInst = dyn_cast<LoadInst>(&I))
        {
            auto loc_to_ptr = LocationVar::FromProgramValue(loadInst->getOperand(0));

            exec->ReadStore(this_reg, loc_to_ptr);
        }
        else if (auto callInst = dyn_cast<CallInst>(&I))
        {
            throw "no impl";
        }
        else
        {
            exec->AssignRegister(this_reg, LocationVar{LocationTag::Value, &I});
        }
        
    }

    exec->NormalizeStore();

#ifdef MODULE_DEBUG_MODE
    // llvm::outs() << "---------\n";
    // llvm::outs() << ToString(*exec);
#endif

    return ctx.UpdateExecution(block, exec);
}

void AnalyzeFunction(SummaryEnvironment& env, const llvm::Function* func)
{
    // TODO: should be retrieved from env?
    auto ctx = std::make_unique<AnalysisContext>(func);

    // TODO: should there be a workset?
    queue<const BasicBlock*> worklist;
    worklist.push(&func->front());

    while (!worklist.empty())
    {
        auto block = worklist.front();
        worklist.pop();

        if (AnalyzeBlock(*ctx, block))
        {
            for (auto succ_block : successors(block))
            {
                worklist.push(succ_block);
            }
        }
    }

#ifdef MODULE_DEBUG_MODE
    auto term_exec = ctx->RetrieveExecution(&func->back());
    llvm::outs() << "---------\n";
    llvm::outs() << *func << "\n";
    //llvm::outs() << ToString(*term_exec);
    DebugPrint(*term_exec);
#endif
}

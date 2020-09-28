#pragma once
#include "llvm/IR/InstVisitor.h"
#include <vector>

inline int GetPointerNestLevel(const llvm::Type* ty)
{
    int result = 0;
    for (auto t = ty; t->isPointerTy(); t = t->getPointerElementType())
    {
        result += 1;
    }

    return result;
}

// TODO: find a more robust way
inline bool IsMallocCall(const llvm::Value* val)
{
    if (auto inst = llvm::dyn_cast<llvm::CallInst>(val))
    {
        if (inst->getCalledFunction()->getName() == "malloc")
        {
            return true;
        }
    }

    return false;
}

// assuming number of called function is generally small
inline void CollectCalledFunction(const llvm::Function* func, std::vector<const llvm::Function*>& vec_out)
{
    for (const llvm::BasicBlock& bb : *func)
    {
        for (const llvm::Instruction& inst : bb)
        {
            if (auto call_inst = llvm::dyn_cast<const llvm::CallInst*>(inst))
            {
                const llvm::Function* called_func = call_inst->getCalledFunction();
                if (std::find(vec_out.begin(), vec_out.end(), called_func) != vec_out.end())
                {
                    continue;
                }

                vec_out.push_back(called_func);
            }
        }
    }
}

// assuming number of used global variable is generally small
inline void CollectUsedGlobalVar(const llvm::Function* func, std::vector<const llvm::GlobalVariable*>& vec_out)
{
    for (const llvm::BasicBlock& bb : *func)
    {
        for (const llvm::Instruction& inst : bb)
        {
            for (const llvm::Value* val : inst.operands())
            {
                if (auto global_var = llvm::dyn_cast<const llvm::GlobalVariable*>(inst))
                {
                    if (std::find(vec_out.begin(), vec_out.end(), global_var) != vec_out.end())
                    {
                        continue;
                    }

                    vec_out.push_back(global_var);
                }
            }
        }
    }
}
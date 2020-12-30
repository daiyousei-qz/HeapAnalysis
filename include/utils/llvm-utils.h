#pragma once
#include "llvm/IR/InstVisitor.h"
#include "llvm/Analysis/MemoryBuiltins.h"
#include <vector>

using OpRange      = llvm::User::op_range;
using ConstOpRange = llvm::User::const_op_range;

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
        const llvm::Function* called_func = inst->getCalledFunction();
        if (called_func != nullptr && called_func->getName() == "malloc")
        {
            return true;
        }
    }

    return false;
}

// assuming number of called function is generally small
inline std::vector<const llvm::Function*> CollectCalledFunction(const llvm::Function* func)
{
    std::vector<const llvm::Function*> result;

    for (const llvm::BasicBlock& bb : *func)
    {
        for (const llvm::Instruction& inst : bb)
        {
            if (auto call_inst = llvm::dyn_cast<llvm::CallInst>(&inst))
            {
                const llvm::Function* called_func = call_inst->getCalledFunction();
                if (std::find(result.begin(), result.end(), called_func) != result.end())
                {
                    continue;
                }

                result.push_back(called_func);
            }
        }
    }

    return result;
}
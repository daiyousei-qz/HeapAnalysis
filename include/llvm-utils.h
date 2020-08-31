#pragma once
#include "llvm/IR/InstVisitor.h"

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
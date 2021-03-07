#pragma once
#include "llvm/IR/Type.h"
#include "llvm/IR/InstVisitor.h"
#include "llvm/Analysis/MemoryBuiltins.h"
#include <vector>
#include <unordered_map>

using OpRange      = llvm::User::op_range;
using ConstOpRange = llvm::User::const_op_range;

inline int GetPointerNestLevel(const llvm::Type* type)
{
    static std::unordered_map<const llvm::Type*, int> level_cache;

    if (auto it = level_cache.find(type); it != level_cache.end())
    {
        return it->second;
    }

    int result           = 0;
    const llvm::Type* ty = type;
    while (ty->isPointerTy())
    {
        ty = ty->getPointerElementType();
        result += 1;
    }

    // if (auto s_type = llvm::dyn_cast<llvm::StructType>(ty); s_type != nullptr)
    // {
    //     int n_member = s_type->getNumContainedTypes();
    //     for (int i = 0; i < n_member; ++i)
    //     {
    //         if (s_type->getContainedType(i)->isPointerTy() ||
    //             s_type->getContainedType(i)->isArrayTy())
    //         {
    //             result += 1;
    //             break;
    //         }
    //     }
    // }

    level_cache[type] = result;
    return result;
}

// TODO: find a more robust way
inline bool IsMallocCall(const llvm::Value* val)
{
    static const char* alloc_funcs[] = {"malloc", "calloc", "realloc"};

    if (auto inst = llvm::dyn_cast<llvm::CallInst>(val))
    {
        const llvm::Function* called_func = inst->getCalledFunction();
        if (called_func != nullptr)
        {
            auto name = called_func->getName();
            for (auto meta_name : alloc_funcs)
            {
                if (name == meta_name)
                {
                    return true;
                }
            }
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
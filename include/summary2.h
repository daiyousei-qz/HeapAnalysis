#pragma once

#include "constraint2.h"
#include "execution2.h"
#include "location2.h"
#include "llvm-utils.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/InstVisitor.h"
#include "llvm/Analysis/CFG.h"
#include <vector>
#include <set>

namespace mh
{
    class FunctionSummary;
    class SummaryEnvironment;

    class FunctionSummary
    {
    public:
        const llvm::Function* func;

        // called functions
        std::vector<const llvm::Function*> called_functions;

        // global/static variables used in the function and the functions it calls
        std::vector<const llvm::GlobalVariable*> globals;

        // globals + parameters
        std::vector<const llvm::Value*> inputs;

        // return instruction of the function
        // NOTE we assume the last instruction of the function is the only exit point
        const llvm::ReturnInst* return_inst;

        // abstract store at the exit point of the function
        AbstractStore store = {};

        bool computed = false;

    public:
        FunctionSummary(SummaryEnvironment& env, const llvm::Function* func);
    };

    class SummaryEnvironment
    {
    private:
        std::unordered_map<const llvm::Function*, std::unique_ptr<FunctionSummary>> analysis_memory;

    public:
        SummaryEnvironment() = default;

        FunctionSummary& LookupSummary(const llvm::Function* func)
        {
            if (auto it = analysis_memory.find(func); it != analysis_memory.end())
            {
                return *it->second;
            }
            else
            {
                const auto& [kv, is_insert] = analysis_memory.insert_or_assign(
                    func, std::make_unique<FunctionSummary>(*this, func));

                return *kv->second;
            }
        }

        const FunctionSummary& LookupSummary(const llvm::Function* func) const
        {
            return *analysis_memory.at(func);
        }
    };
} // namespace mh

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
#include <unordered_set>

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
        // Note while locations with tag Register are stored in a specialized container regfile,
        // they are in the same store when written in summary
        AbstractStore store = {};

        // a summary is converged iff it's computed after all its called function is converged
        bool converged = false;
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
                auto& summary = *(analysis_memory[func] = std::make_unique<FunctionSummary>());
                InitializeSummary(summary, func);

                return summary;
            }
        }

        const FunctionSummary& LookupSummary(const llvm::Function* func) const
        {
            return *analysis_memory.at(func);
        }

    private:
        void InitializeSummary(FunctionSummary& summary, const llvm::Function* func);
    };
} // namespace mh

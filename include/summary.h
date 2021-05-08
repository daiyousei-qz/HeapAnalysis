#pragma once

#include "constraint.h"
#include "execution.h"
#include "location.h"
#include "utils.h"
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

    struct RWConstraint
    {
        Constraint read    = Constraint{false};
        Constraint written = Constraint{false};
    };

    class FunctionSummary
    {
    public:
        // First analysis
        //
        mutable std::unordered_map<AbstractLocation, RWConstraint> rw_lookup;

        // Actual analysis
        //

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

        // number of caller of this function commited
        int use_counter = 0;
    };

    class SummaryEnvironment
    {
    private:
        std::unordered_map<const llvm::Function*, std::unique_ptr<FunctionSummary>> analysis_memory;

        mutable std::vector<CallPointData> call_point_cache;
        mutable std::unordered_map<std::pair<const llvm::Instruction*, int>, int> call_point_lookup;

    public:
        SummaryEnvironment() = default;

        FunctionSummary& LookupSummary(const llvm::Function* func);

        const FunctionSummary& LookupSummary(const llvm::Function* func) const;

        int ComputeCallPoint(const llvm::Instruction* inst, int prev_call_point) const;

        void NotifyUse(const llvm::Function* func)
        {
            if (func == nullptr || func->isDeclaration())
            {
                return;
            }

            if (auto it = analysis_memory.find(func); it != analysis_memory.end())
            {
                FunctionSummary& summary = *it->second;
                summary.use_counter += 1;
                if (summary.use_counter >= func->getNumUses())
                {
                    analysis_memory.erase(func);
                }
            }
        }

    private:
        void InitializeSummary(FunctionSummary& summary, const llvm::Function* func);
    };
} // namespace mh

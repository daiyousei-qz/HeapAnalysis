#pragma once
#include "constraint2.h"
#include "execution2.h"
#include "location2.h"
#include "summary2.h"
#include "llvm-utils.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/InstVisitor.h"
#include <vector>
#include <set>

namespace mh
{
    class AnalysisContext
    {
    private:
        const SummaryEnvironment* env_;

        const FunctionSummary* summary_entry_;

        ConstraintSolver smt_solver_;

        // (source, target)
        // cache for quickly determing if a control edge is jumping backward
        using ControlFlowEdge = std::pair<const llvm::BasicBlock*, const llvm::BasicBlock*>;
        std::set<ControlFlowEdge> backedges_;

        //
        std::unordered_map<const llvm::Instruction*, int> call_point_cache_;

        // abstract store at the entry point of the function
        AbstractStore init_store_;

        // consequent register file up to the point of the analysis
        AbstractRegisterFile regfile_;

        // consequent store after a specific basic block up to the point of the analysis
        std::unordered_map<const llvm::BasicBlock*, AbstractStore> exec_store_cache_;

        // alias mapping for cast/ptr operations
        std::unordered_map<const llvm::Value*, const llvm::Value*> alias_map_;

    public:
        auto Environment() const noexcept { return env_; }

        auto& Solver() noexcept { return smt_solver_; }

    public:
        AnalysisContext(const SummaryEnvironment* env, const FunctionSummary* summary);

        PointToMap& LookupRegFile(const llvm::Value* reg)
        {
            PointToMap& pt_map = regfile_[reg];

            if (pt_map.empty() && llvm::isa<llvm::Constant>(reg))
            {
                pt_map.insert(std::pair{LocationVar::FromProgramValue(reg), Constraint{true}});
            }

            return pt_map;
        }

        void AssignAliasReg(const llvm::Value* reg, const llvm::Value* alias_target)
        {
            alias_map_[reg] = alias_target;
        }
        const llvm::Value* TranslateAliasReg(const llvm::Value* reg)
        {
            if (auto it = alias_map_.find(reg); it != alias_map_.end())
            {
                return it->second;
            }
            else
            {
                return reg;
            }
        }

        int GetCallPoint(const llvm::Instruction* inst)
        {
            auto it = call_point_cache_.find(inst);
            if (it != call_point_cache_.end())
            {
                return it->second;
            }

            int next_call_pt = static_cast<int>(call_point_cache_.size()) + 1;
            call_point_cache_.insert({inst, next_call_pt});
            return next_call_pt;
        }

        /**
         * Create an new execution state of which represents the start of the specified basic block
         */
        std::unique_ptr<AbstractExecution> InitializeExecution(const llvm::BasicBlock* bb);

        /**
         * Try to update the execution result. Returns true if the program state of `exec` differs
         * from the previous run
         */
        bool CommitExecution(const llvm::BasicBlock* bb, std::unique_ptr<AbstractExecution> exec);

        AbstractStore ExportStore()
        {
            AbstractStore result = std::move(exec_store_cache_.at(&summary_entry_->func->back()));
            for (auto& [reg, pt_map] : regfile_)
            {
                result[LocationVar::FromRegister(reg)] = std::move(pt_map);
            }

            return result;
        }
    };

    void AnalyzeFunction(SummaryEnvironment& env, const llvm::Function* func);
} // namespace mh

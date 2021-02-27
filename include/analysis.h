#pragma once
#include "constraint.h"
#include "execution.h"
#include "location.h"
#include "summary.h"
#include "controlflow.h"
#include "utils.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/InstVisitor.h"
#include <vector>
#include <set>

namespace mh
{
    // A specialized AbstractStore that stores point-to maps from locations with
    // tag register, i.e. llvm::Value*
    // Such practice reduce memory consumption and redundent computation during analysis because of
    // SSA form
    using AbstractRegFile = std::unordered_map<const llvm::Value*, PointToMap>;

    class AnalysisContext
    {
    private:
        const SummaryEnvironment* env_;

        const FunctionSummary* current_summary_;

        ConstraintSolver smt_solver_;

        FunctionControlFlowInfo ctrl_flow_info_;

        // abstract store at the entry point of the function
        AbstractStore entry_store_;

        // consequent register file up to the point of the analysis
        AbstractRegFile regfile_;

        // consequent store after a specific basic block up to the point of the analysis
        std::unordered_map<const llvm::BasicBlock*, AbstractStore> exec_store_cache_;

        // alias mapping for cast/ptr operations
        std::unordered_map<const llvm::Value*, const llvm::Value*> alias_map_;

        //
        std::unordered_map<const llvm::Instruction*,
                           std::unordered_map<AbstractLocation, Constraint>>
            update_hitory_;

        std::unordered_map<const llvm::BasicBlock*, ConstrainedDataDependencyGraph> data_dep_cache_;

    public:
        // (read, write) -> constraint
        std::map<std::pair<const llvm::Instruction*, const llvm::Value*>, Constraint>
            data_dep_result_;

        friend class AbstractExecution;

    public:
        auto Func() const noexcept { return current_summary_->func; }

        auto Environment() const noexcept { return env_; }

        auto CurrentSummary() const noexcept { return current_summary_; }

        auto& Solver() noexcept { return smt_solver_; }

    public:
        AnalysisContext(const SummaryEnvironment* env, const FunctionSummary* summary);

        PointToMap& LookupRegFile(const llvm::Value* reg)
        {
            PointToMap& pt_map = regfile_[reg];

            if (pt_map.empty() && llvm::isa<llvm::Constant>(reg))
            {
                pt_map.insert(std::pair{AbstractLocation::FromProgramValue(reg), Constraint{true}});
            }

            return pt_map;
        }

        bool UpdateRegFile(const llvm::Value* reg, PointToMap pt_map, bool force_update = false)
        {
            PointToMap& cell = LookupRegFile(reg);

            if (force_update || !EqualPointToMap(Solver(), cell, pt_map))
            {
                cell = std::move(pt_map);
                return true;
            }

            return false;
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

        AbstractLocation RelabelLocation(AbstractLocation loc, const llvm::Instruction* inst)
        {
            int call_pt = env_->ComputeCallPoint(inst, loc.CallPoint());
            return loc.Relabel(call_pt);
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

        /**
         * Update abstract store with analysis of the basic block given. Returns true if consequnt
         * program state is updated
         */
        bool AnalyzeBlock(const llvm::BasicBlock* bb);

        bool AnalyzeBlock_DataDep(const llvm::BasicBlock* bb);

        /**
         * Export the abstract store after completion of analysis. Note the context object will
         * enter an invalid state after calling this function and should not be used later.
         */
        AbstractStore ExportStore();

        void ExportRAWDependency();

        void DebugPrint(const llvm::BasicBlock* bb);
    };

    void AnalyzeFunction(SummaryEnvironment& env, const llvm::Function* func);
} // namespace mh

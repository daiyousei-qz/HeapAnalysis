#pragma once

#include "constraint.h"
#include "location.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Instruction.h"
#include "fmt/format.h"
#include <vector>
#include <map>
#include <set>
#include <unordered_map>
#include <unordered_set>

class AnalysisContext;
class AbstractExecution;

class SummaryEnvironment
{
    std::unordered_map<const llvm::Function*, std::unique_ptr<AnalysisContext>> analysis_cache;

public:
};

// (source, target) pair
using ControlFlowEdge = std::pair<const llvm::BasicBlock*, const llvm::BasicBlock*>;

class AnalysisContext
{
    const llvm::Function* func;

    // contains either llvm::Argument or llvm::GlobalVariable
    std::vector<const llvm::Value*> inputs;

    // cached backward edges for analysis
    std::set<ControlFlowEdge> backedges;

    // computed consequent heaps
    std::unordered_map<const llvm::BasicBlock*, std::shared_ptr<AbstractExecution>> exec_results;

    ConstraintEngine smt_engine_;

public:
    AnalysisContext(const llvm::Function* func);


    // returns an execution that represents start of specified basic block
    std::shared_ptr<AbstractExecution> InitializeExecution(const llvm::BasicBlock* bb);

    // returns an execution that represents end of specified basic block, if any
    std::shared_ptr<AbstractExecution> RetrieveExecution(const llvm::BasicBlock* bb);

    // returns true if program state of new_exec differs from the previous run
    bool UpdateExecution(const llvm::BasicBlock* bb, std::shared_ptr<AbstractExecution> new_exec);

    const llvm::Function* GetFunction() const noexcept
    {
        return func;
    }

    std::vector<const llvm::Value*> GetInputs() const noexcept
    {
        return inputs;
    }

    auto& GetConstraintEngine() noexcept
    {
        return smt_engine_;
    }
};

void AnalyzeFunction(SummaryEnvironment& env, const llvm::Function* func);
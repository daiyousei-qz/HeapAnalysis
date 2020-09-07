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

struct FunctionSummary
{
    const llvm::Function* function;

    std::vector<const llvm::Value*> inputs;

    const llvm::Value* output;

    std::shared_ptr<AbstractExecution> result;

    std::shared_ptr<SmtProvider> smt_engine;
};

// (source, target) pair
using ControlFlowEdge = std::pair<const llvm::BasicBlock*, const llvm::BasicBlock*>;

// context in which a function is analyzed
class AnalysisContext
{
    const llvm::Function* func;

    // contains either llvm::Argument or llvm::GlobalVariable
    std::vector<const llvm::Value*> inputs;

    const llvm::Value* output;

    // cached backward edges for analysis
    std::set<ControlFlowEdge> backedges;

    // computed consequent heaps
    std::unordered_map<const llvm::BasicBlock*, std::shared_ptr<AbstractExecution>> exec_results;

    ConstraintSolver smt_solver_;

public:
    AnalysisContext(const std::shared_ptr<SmtProvider>& smt_engine, const llvm::Function* func);

    // returns an execution that represents start of specified basic block
    std::shared_ptr<AbstractExecution> InitializeExecution(const llvm::BasicBlock* bb);

    // returns an execution that represents end of specified basic block, if any
    std::shared_ptr<AbstractExecution> RetrieveExecution(const llvm::BasicBlock* bb);

    // returns true if program state of new_exec differs from the previous run
    bool UpdateExecution(const llvm::BasicBlock* bb, std::shared_ptr<AbstractExecution> new_exec);

    std::unique_ptr<FunctionSummary> YieldSummary();

    const llvm::Function* GetFunction() const noexcept
    {
        return func;
    }

    std::vector<const llvm::Value*> GetInputs() const noexcept
    {
        return inputs;
    }

    const llvm::Value* GetOutput() const noexcept
    {
        return output;
    }

    auto& GetSmtSolver() noexcept
    {
        return smt_solver_;
    }
};

class SummaryEnvironment
{
public:
    std::shared_ptr<SmtProvider> smt_engine = std::make_shared<SmtProvider>();
    std::unordered_map<const llvm::Function*, std::unique_ptr<FunctionSummary>> analysis_cache;

    bool IsAnalyzed(const llvm::Function* fun) const
    {
        return analysis_cache.find(fun) != analysis_cache.end();
    }

    void Analyze(const llvm::Function* fun);
};
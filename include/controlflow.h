#pragma once
#include "llvm/IR/Function.h"
#include <set>
#include <unordered_map>
#include <unordered_set>

namespace mh
{
    enum class ExecAfterCondition
    {
        Never = 0, // default value with zero-initilization
        May,
        Must,
    };

    class FunctionControlFlowInfo
    {
    private:
        // (source, target)
        // cache for quickly determing if a control edge is jumping backward
        using ControlFlowEdge = std::pair<const llvm::BasicBlock*, const llvm::BasicBlock*>;
        std::set<ControlFlowEdge> backedges_;

        using ExecAfterConditionMap =
            std::unordered_map<const llvm::BasicBlock*, ExecAfterCondition>;
        std::unordered_map<const llvm::BasicBlock*, ExecAfterConditionMap> exec_after_lookup_;

    public:
        FunctionControlFlowInfo(const llvm::Function* func);

        /**
         * Test if the control edge (src -> dst) is a back edge(loop back)
         */
        bool IsBackEdge(const llvm::BasicBlock* src, const llvm::BasicBlock* dst)
        {
            return backedges_.find(std::pair{src, dst}) != backedges_.end();
        }

        /**
         * Lookup execution order between src and dst.
         */
        ExecAfterCondition LookupExecAfterCondition(const llvm::BasicBlock* src,
                                                    const llvm::BasicBlock* dst)
        {
            const auto& lookup = exec_after_lookup_.at(src);
            if (auto it = lookup.find(dst); it != lookup.end())
            {
                return it->second;
            }
            else
            {
                return ExecAfterCondition::Never;
            }
        }

    private:
        void ComputeBackEdges(const llvm::Function* func);

        void ComputeExecAfterLookup(const llvm::Function* func);
    };
}; // namespace mh
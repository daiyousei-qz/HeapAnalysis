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

        // for two instruction inst1, inst2 in the same basic block
        // guranteed that inst1 comes before inst2 if f(inst1) < f(inst2)
        std::unordered_map<const llvm::Instruction*, int> inst_index_lookup_;

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
         * Lookup execution order between basic blocks src and dst, if dst could execute after src
         */
        ExecAfterCondition LookupExecAfterCondition(const llvm::BasicBlock* src,
                                                    const llvm::BasicBlock* dst) const
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

        /**
         * Lookup execution order between instructions src and dst, if dst could execute after src
         */
        ExecAfterCondition LookupExecAfterCondition(const llvm::Instruction* src,
                                                    const llvm::Instruction* dst) const
        {
            const llvm::BasicBlock* bb_src = src->getParent();
            const llvm::BasicBlock* bb_dst = dst->getParent();

            if (bb_src == bb_dst)
            {
                return inst_index_lookup_.at(src) < inst_index_lookup_.at(dst)
                           ? ExecAfterCondition::Must
                           : LookupExecAfterCondition(bb_src, bb_dst);
            }
            else
            {
                return LookupExecAfterCondition(bb_src, bb_dst);
            }
        }

    private:
        void ComputeBackEdges(const llvm::Function* func);

        void ComputeExecAfterLookup(const llvm::Function* func);

        void ComputeInstructionIndexLookup(const llvm::Function* func);
    };
}; // namespace mh
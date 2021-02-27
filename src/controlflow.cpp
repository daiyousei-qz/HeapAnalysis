#include "controlflow.h"
#include "llvm/IR/CFG.h"
#include "llvm/Analysis/CFG.h"
#include <deque>

using namespace std;
using namespace llvm;

namespace mh
{
    FunctionControlFlowInfo::FunctionControlFlowInfo(const llvm::Function* func)
    {
        ComputeBackEdges(func);
        ComputeExecAfterLookup(func);
        ComputeInstructionIndexLookup(func);
    }

    void FunctionControlFlowInfo::ComputeBackEdges(const llvm::Function* func)
    {
        // collect backward control flow edges
        SmallVector<pair<const BasicBlock*, const BasicBlock*>, 8> buffer;
        FindFunctionBackedges(*func, buffer);

        this->backedges_ = set<ControlFlowEdge>(buffer.begin(), buffer.end());
    }

    void FunctionControlFlowInfo::ComputeExecAfterLookup(const llvm::Function* func)
    {
        unordered_map<const BasicBlock*, ExecAfterConditionMap> result;
        unordered_set<const BasicBlock*> workset;
        deque<const BasicBlock*> worklist;

        for (const BasicBlock& bb : *func)
        {
            auto& condition_map     = result[&bb];
            bool has_single_succ_bb = succ_size(&bb) == 1;
            for (const BasicBlock* succ_bb : successors(&bb))
            {
                condition_map[succ_bb] =
                    has_single_succ_bb ? ExecAfterCondition::Must : ExecAfterCondition::May;
            }

            workset.insert(&bb);
            worklist.push_front(&bb);
        }

        while (!worklist.empty())
        {
            const BasicBlock* this_bb = worklist.front();
            workset.erase(this_bb);
            worklist.pop_front();

            unordered_map<const BasicBlock*, int> must_exec_after_counters;
            for (const BasicBlock* succ_bb : successors(this_bb))
            {
                for (const auto& [bb, condition] : result[succ_bb])
                {
                    assert(condition != ExecAfterCondition::Never);

                    if (condition == ExecAfterCondition::Must)
                    {
                        must_exec_after_counters[bb] += 1;
                    }
                    else // condition == ExecAfterCondition::May
                    {
                        must_exec_after_counters[bb] = 0;
                    }
                }
            }

            bool updated                         = false;
            ExecAfterConditionMap& condition_map = result[this_bb];
            for (const auto& [bb, counter] : must_exec_after_counters)
            {
                ExecAfterCondition& conditon_val = condition_map[bb];
                ExecAfterCondition new_condition = counter < succ_size(this_bb)
                                                       ? ExecAfterCondition::May
                                                       : ExecAfterCondition::Must;

                if (conditon_val != new_condition)
                {
                    updated      = true;
                    conditon_val = new_condition;
                }
            }

            if (updated)
            {
                for (const BasicBlock* pred_bb : predecessors(this_bb))
                {
                    if (workset.find(pred_bb) == workset.end())
                    {
                        workset.insert(pred_bb);
                        worklist.push_back(pred_bb);
                    }
                }
            }
        }

        this->exec_after_lookup_ = move(result);
    }

    void FunctionControlFlowInfo::ComputeInstructionIndexLookup(const llvm::Function* func)
    {
        int counter = 0;

        for (const BasicBlock& bb : *func)
        {
            for (const Instruction& inst : bb)
            {
                this->inst_index_lookup_[&inst] = counter++;
            }
        }
    }

} // namespace mh
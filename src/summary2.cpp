#include "summary2.h"

using namespace std;
using namespace llvm;

namespace mh
{
    FunctionSummary& SummaryEnvironment::LookupSummary(const llvm::Function* func)
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

    const FunctionSummary& SummaryEnvironment::LookupSummary(const llvm::Function* func) const
    {
        return *analysis_memory.at(func);
    }

    int SummaryEnvironment::ComputeCallPoint(const llvm::Instruction* inst,
                                             int prev_call_point) const
    {
        assert(inst != nullptr && prev_call_point >= 0);

        if (auto it = call_point_lookup.find(CallPointData{inst, prev_call_point});
            it != call_point_lookup.end())
        {
            return it->second;
        }
        else
        {
            int result = call_point_cache.size() + 1;
            call_point_cache.push_back(CallPointData{inst, prev_call_point});
            call_point_lookup[CallPointData{inst, prev_call_point}] = result;

            return result;
        }
    }

    void SummaryEnvironment::InitializeSummary(FunctionSummary& summary, const llvm::Function* func)
    {
        summary.func = func;

        // collect parameters
        for (const Argument& arg : func->args())
        {
            summary.inputs.push_back(&arg);
        }

        // collect called functions and used globals
        for (const BasicBlock& bb : *func)
        {
            for (const Instruction& inst : bb)
            {
                if (const CallInst* call_inst = dyn_cast<CallInst>(&inst))
                {
                    const Function* callee = call_inst->getCalledFunction();
                    if (find(summary.called_functions.begin(), summary.called_functions.end(),
                             callee) == summary.called_functions.end())
                    {
                        // TODO: remove this nasty workaround
                        if (IsMallocCall(call_inst))
                        {
                            break;
                        }
                        summary.called_functions.push_back(callee);
                    }
                }

                for (const Value* val : inst.operands())
                {
                    const GlobalVariable* global_var = dyn_cast<GlobalVariable>(val);
                    if (global_var != nullptr &&
                        find(summary.globals.begin(), summary.globals.end(), global_var) ==
                            summary.globals.end())
                    {
                        summary.globals.push_back(global_var);
                        summary.inputs.push_back(global_var);
                    }
                }
            }
        }

        // collect global variables used by called functions
        for (const Function* callee : summary.called_functions)
        {
            const FunctionSummary& callee_summary = LookupSummary(callee);
            for (const GlobalVariable* global_var : callee_summary.globals)
            {
                if (find(summary.globals.begin(), summary.globals.end(), global_var) ==
                    summary.globals.end())
                {
                    summary.globals.push_back(global_var);
                    summary.inputs.push_back(global_var);
                }
            }
        }

        // collect return instruction
        // NOTE we assume the last instruction of the function is the only exit point
        summary.return_inst = dyn_cast<ReturnInst>(&func->back().back());
        assert(summary.return_inst != nullptr);
    }

} // namespace mh

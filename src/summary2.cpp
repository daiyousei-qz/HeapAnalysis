#include "summary2.h"

using namespace std;
using namespace llvm;

namespace mh
{
    FunctionSummary::FunctionSummary(SummaryEnvironment& env, const llvm::Function* func)
    {
        this->func = func;

        // collect parameters
        for (const Argument& arg : func->args())
        {
            inputs.push_back(&arg);
        }

        // collect called functions and used globals
        for (const BasicBlock& bb : *func)
        {
            for (const Instruction& inst : bb)
            {
                if (const CallInst* call_inst = dyn_cast<CallInst>(&inst))
                {
                    const Function* callee = call_inst->getCalledFunction();
                    if (std::find(called_functions.begin(), called_functions.end(), callee) ==
                        called_functions.end())
                    {
                        // TODO: remove this nasty workaround
                        if (IsMallocCall(call_inst))
                        {
                            break;
                        }
                        called_functions.push_back(callee);
                    }
                }

                for (const Value* val : inst.operands())
                {
                    const GlobalVariable* global_var = dyn_cast<GlobalVariable>(val);
                    if (global_var != nullptr &&
                        std::find(globals.begin(), globals.end(), global_var) == globals.end())
                    {
                        globals.push_back(global_var);
                        inputs.push_back(global_var);
                    }
                }
            }
        }

        // collect global variables used by called functions
        for (const Function* callee : called_functions)
        {
            const FunctionSummary& callee_summary = env.LookupSummary(callee);
            for (const GlobalVariable* global_var : callee_summary.globals)
            {
                if (std::find(globals.begin(), globals.end(), global_var) == globals.end())
                {
                    globals.push_back(global_var);
                    inputs.push_back(global_var);
                }
            }
        }

        // collect return instruction
        // NOTE we assume the last instruction of the function is the only exit point
        return_inst = dyn_cast<ReturnInst>(&func->back().back());
        assert(return_inst != nullptr);
    }
} // namespace mh

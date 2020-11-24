#include "analysis.h"
#include "llvm-utils.h"

#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Analysis/CFG.h"
#include <string>
#include <stack>
#include <unordered_set>

using namespace std;
using namespace llvm;

namespace
{
    template <typename EF> class ScopeExit
    {
    private:
        EF exit_;

    public:
        template <typename Fn> ScopeExit(Fn&& f) : exit_(std::forward<Fn>(f)) {}
        ~ScopeExit() { exit_(); }

        ScopeExit(const ScopeExit&) = delete;
        ScopeExit& operator=(const ScopeExit&) = delete;
    };

    template <typename EF> ScopeExit(EF) -> ScopeExit<EF>;

    class HeapAnalysis : public ModulePass
    {
    public:
        static char ID;
        HeapAnalysis() : ModulePass(ID) {}

        void getAnalysisUsage(AnalysisUsage& AU) const override { AU.setPreservesAll(); }

        bool doInitialization(Module& M) override { return false; }

        bool runOnModule(Module& M) override
        {
            SummaryEnvironment env;
            std::unordered_set<const Function*> call_history;
            for (const Function& func : M)
            {
                ProcessFunctionAnalysis(env, call_history, &func);
            }

            return false;
        }

    private:
        // TODO: support recursive function
        void ProcessFunctionAnalysis(SummaryEnvironment& env,
                                     std::unordered_set<const llvm::Function*>& call_history,
                                     const Function* func)
        {
            if (func->empty() || env.IsAnalyzed(func))
            {
                return;
            }

            call_history.insert(func);
            ScopeExit pop_func_([&] { call_history.erase(func); });

            std::vector<const Function*> called_funcs = CollectCalledFunction(func);

            for (const Function* callee : called_funcs)
            {
                if (!env.IsAnalyzed(callee))
                {
                    ProcessFunctionAnalysis(env, call_history, callee);
                }
            }

            env.RegisterSummary(func, AnalyzeFunction(env, call_history, func));
        }
    };
} // namespace

char HeapAnalysis::ID = 0;
static RegisterPass<HeapAnalysis> X("heap-analysis", "point-to analysis", false, true);
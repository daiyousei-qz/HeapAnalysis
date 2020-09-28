#include "analysis.h"
#include "llvm-utils.h"

#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Analysis/CallGraph.h"
#include <llvm/ADT/DepthFirstIterator.h>
#include <string>
#include <stack>

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

    template <typename EF> ScopeExit(EF)->ScopeExit<EF>;

    class HeapAnalysis : public ModulePass
    {
    public:
        static char ID;
        HeapAnalysis() : ModulePass(ID) {}

        void getAnalysisUsage(AnalysisUsage& AU) const override
        {
            AU.setPreservesAll();
        }

        bool doInitialization(Module& M) override { return false; }

        bool runOnModule(Module& M) override
        {
            SummaryEnvironment env;
            std::stack<const Function*> call_chain;
            for (const Function& func : M)
            {
                if (!func.empty())
                {
                    ProcessFunctionAnalysis(env, call_chain, &func);
                }
            }

            return false;
        }

    private:
        // TODO: support recursive function
        void ProcessFunctionAnalysis(SummaryEnvironment& env,
                                     std::stack<const Function*>& call_chain,
                                     const Function* func)
        {
            if (env.IsAnalyzed(func))
            {
                return;
            }

            call_chain.push(func);
            ScopeExit pop_func_([&] { call_chain.pop(); });

            std::vector<const Function*> called_funcs;
            CollectCalledFunction(func, called_funcs);

            for (const Function* callee : called_funcs)
            {
                if (!env.IsAnalyzed(func))
                {
                    ProcessFunctionAnalysis(env, call_chain, callee);
                }
            }

            env.RegisterSummary(func, AnalyzeFunction(env, call_chain, func));
        }
    };
} // namespace

char HeapAnalysis::ID = 0;
static RegisterPass<HeapAnalysis> X("heap-analysis", "point-to analysis", false,
                                    true);
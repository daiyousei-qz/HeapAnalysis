#include "analysis2.h"
#include "llvm-utils.h"

#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Analysis/CFG.h"
#include "llvm/Analysis/CallGraph.h"
#include <string>
#include <stack>
#include <unordered_set>

using namespace mh;
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
            for (const Function& func : M)
            {
                if (func.empty())
                {
                    continue;
                }

                AnalyzeFunction(env, &func);
            }

            return false;
        }
    };
} // namespace

char HeapAnalysis::ID = 0;
static RegisterPass<HeapAnalysis> X("heap-analysis", "point-to analysis", false, true);
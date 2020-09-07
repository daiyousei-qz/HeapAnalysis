#include "analysis.h"

#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Analysis/CallGraph.h"
#include <llvm/ADT/DepthFirstIterator.h>
#include <string>

using namespace std;
using namespace llvm;

namespace
{
    class HeapAnalysis : public ModulePass
    {
    public:
        static char ID;
        HeapAnalysis() : ModulePass(ID) {}

        void getAnalysisUsage(AnalysisUsage& AU) const override
        {
            AU.setPreservesAll();
        }

        bool doInitialization(Module& M) override
        {
            return false;
        }

        bool runOnModule(Module& M) override
        {
            SummaryEnvironment env;

            // TODO: how to traversal call graph from bottom up?
            // CallGraph CG{M};
            // for (auto iter = df_begin(&CG), end_iter = df_end(&CG); iter != end_iter; ++iter)
            // {
            //     Function* fun = iter->getFunction();
            //     if (fun && fun->getParent() == &M && !env.IsAnalyzed(fun))
            //     {
            //         env.Analyze(fun);
            //     }
            // }

            for (const Function& fun : M)
            {
                if (!fun.empty())
                {
                    env.Analyze(&fun);
                }
            }

            return false;
        }
    };
} // namespace

char HeapAnalysis::ID = 0;
static RegisterPass<HeapAnalysis> X("heap-analysis", "point-to analysis", false, true);
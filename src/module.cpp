#include "analysis.h"

#include "llvm/Pass.h"
#include <string>

using namespace std;
using namespace llvm;

namespace
{
    class HeapAnalysis : public FunctionPass
    {
    public:
        static char ID;
        HeapAnalysis() : FunctionPass(ID) {}

        void getAnalysisUsage(AnalysisUsage& AU) const override
        {
            AU.setPreservesAll();
        }

        bool doInitialization(Module& M) override
        {
            return false;
        }

        bool runOnFunction(Function& F) override
        {
            SummaryEnvironment env;
            AnalyzeFunction(env, &F);
            return false;
        }
    };
} // namespace

char HeapAnalysis::ID = 0;
static RegisterPass<HeapAnalysis> X("heap-analysis", "point-to analysis", false, true);
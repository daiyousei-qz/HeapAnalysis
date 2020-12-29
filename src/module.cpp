#include "analysis.h"
#include "utils.h"

#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Analysis/CFG.h"
#include "llvm/Analysis/CallGraph.h"
#include "llvm/Analysis/CallGraphSCCPass.h"
#include <string>
#include <stack>
#include <unordered_set>

using namespace mh;
using namespace std;
using namespace llvm;

namespace
{
    class HeapAnalysis : public CallGraphSCCPass
    {
    private:
        SummaryEnvironment env;

    public:
        static char ID;
        HeapAnalysis() : CallGraphSCCPass(ID) {}

        bool runOnSCC(CallGraphSCC& SCC) override
        {
            for (const CallGraphNode* node : SCC)
            {
                auto func = node->getFunction();
                if (func == nullptr || func->isDeclaration())
                {
                    continue;
                }

                // detect recursion
                // TODO: use external flag as doesNotRecurse modifies the Function object
                if (SCC.size() == 1)
                {
                    bool recurse = false;
                    for (auto rec : *node)
                    {
                        if (rec.second == node)
                        {
                            recurse = true;
                            break;
                        }
                    }

                    if (!recurse)
                    {
                        func->setDoesNotRecurse();
                    }
                }

                // perform analysis
                AnalyzeFunction(env, func);
            }

            return false;
        }
    };
} // namespace

char HeapAnalysis::ID = 0;
static RegisterPass<HeapAnalysis> X("heap-analysis", "point-to analysis", false, true);
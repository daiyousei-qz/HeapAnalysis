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
#include <chrono>

using namespace mh;
using namespace std;
using namespace llvm;

int GLOBAL_NUM_RAW_STORE = 0;
int GLOBAL_NUM_RAW_CALL  = 0;
int GLOBAL_NUM_RAW_ARG   = 0;

namespace
{
    class HeapAnalysis : public CallGraphSCCPass
    {
    private:
        SummaryEnvironment env;

        using time_point = chrono::high_resolution_clock::time_point;
        time_point t_start;
        time_point t_stop;

    public:
        static char ID;
        HeapAnalysis() : CallGraphSCCPass(ID) {}

        bool doInitialization(CallGraph& M) override
        {
            t_start = chrono::high_resolution_clock::now();
            return false;
        }

        bool doFinalization(CallGraph& M) override
        {
            t_stop = chrono::high_resolution_clock::now();

            using FpMilliseconds = std::chrono::duration<float, std::chrono::milliseconds::period>;
            using FpSecond       = std::chrono::duration<float, std::chrono::seconds::period>;
            using FpMinute       = std::chrono::duration<float, std::chrono::minutes::period>;

            auto dur  = FpMilliseconds(t_stop - t_start).count();
            auto unit = "ms";

            if (dur > 1000.f)
            {
                dur  = FpSecond(t_stop - t_start).count();
                unit = "s";

                if (dur > 600.f)
                {
                    dur  = FpMinute(t_stop - t_start).count();
                    unit = "min";
                }
            }

            fmt::print("Total Run Time: {} {}\n", dur, unit);
            return false;
        }

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

namespace
{
    class InstNumAnalysis : public FunctionPass
    {
    public:
        static char ID;
        InstNumAnalysis() : FunctionPass(ID) {}

        bool runOnFunction(Function& F) override
        {
            int i = 0;
            for (const auto& B : F)
            {
                i += B.size();
            }
            fmt::print("{}:{}:{}\n", F.getName().str(), F.size(), i);

            return false;
        }
    };
} // namespace

char InstNumAnalysis::ID = 0;
static RegisterPass<InstNumAnalysis> Y("inst-num", "instruction number printer", false, true);
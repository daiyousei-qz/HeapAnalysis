#pragma once
#include "llvm/IR/Instruction.h"
#include "constraint.h"
#include "location.h"
#include "store.h"

namespace mh
{
    struct FunctionSummary;
    class AnalysisContext;

    class AbstractExecution
    {
    private:
        AnalysisContext* ctx_;

        AbstractStore store_;

        friend class AnalysisContext;

    public:
        AbstractExecution(AnalysisContext* ctx, AbstractStore init_store)
            : ctx_(ctx), store_(std::move(init_store))
        {
        }

        // deprecated
        void DoAssign(const llvm::Instruction* reg, LocationVar loc);

        // %x = alloca/malloc
        void DoAlloc(const llvm::Instruction* reg, bool heap_alloc);

        // %x = phi(v1, v2)
        void DoAssignPhi(const llvm::Instruction* reg, const llvm::Value* val1,
                         const llvm::Value* val2);

        // %x = f(?)
        void DoInvoke(const llvm::Instruction* reg, const FunctionSummary& called_summary,
                      const std::vector<const llvm::Value*>& inputs);

        // %x = *p
        void DoLoad(const llvm::Instruction* reg, const llvm::Value* reg_ptr);

        // *p = %?
        void DoStore(const llvm::Value* reg_val, const llvm::Value* reg_ptr);

    private:
        AbstractStore ExtractStoreToCurrentContext(const FunctionSummary& called_summary,
                                                   const std::vector<const llvm::Value*>& inputs);

        struct ArgParamMappingLookup
        {
            std::unordered_map<LocationVar, PointToMap> pa;
            std::unordered_map<LocationVar, PointToMap> ap;
        };

        ArgParamMappingLookup
        ConstructArgParamMappingLookup(const FunctionSummary& called_summary,
                                       const std::vector<const llvm::Value*>& inputs);

        void MergeInvocationStore(const llvm::Instruction* reg,
                                  const FunctionSummary& called_summary, AbstractStore result_store,
                                  ArgParamMappingLookup loc_mapping);
    };

} // namespace mh

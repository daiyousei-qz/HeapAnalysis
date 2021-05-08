#pragma once
#include "llvm/IR/Instruction.h"
#include "constraint.h"
#include "location.h"
#include "store.h"
#include <unordered_set>

namespace mh
{
    struct FunctionSummary;
    class AnalysisContext;

    struct ReadWrittenRecord;

    class AbstractExecution
    {
    private:
        ReadWrittenRecord* record_;

        AnalysisContext* ctx_;

        AbstractStore store_;

        // track if any register is updated in this execution
        bool reg_update_ = false;

        // track locations point-to map of which may be altered in this execution
        std::unordered_set<AbstractLocation> important_loc_;

        friend class AnalysisContext;

    public:
        AbstractExecution(AnalysisContext* ctx, AbstractStore init_store)
            : ctx_(ctx), store_(std::move(init_store))
        {
        }

        // deprecated
        void DoAssign(const llvm::Instruction* reg, AbstractLocation loc);

        // %x = alloca/malloc
        void DoAlloc(const llvm::Instruction* reg, bool summary);

        // %x = phi(v1, v2)
        void DoAssignPhi(const llvm::Instruction* reg, const llvm::Value* val1,
                         const llvm::Value* val2);

        // %x = phi(v1, v2, ...)
        void DoAssignPhi(const llvm::Instruction* reg, const llvm::User::const_op_range vals);

        // %x = f(?)
        void DoInvoke(const llvm::Instruction* reg, const FunctionSummary& called_summary,
                      const std::vector<const llvm::Value*>& inputs);

        // %x = *p
        void DoLoad(const llvm::Instruction* reg, const llvm::Value* reg_ptr);

        // *p = %?
        void DoStore(const llvm::Value* reg_val, const llvm::Value* reg_ptr);

        // test if this execution updates abstract stores(including registers)
        bool TestStoreUpdate(const AbstractStore& store_old);

    private:
        // mark a location that it may be updated in this execution
        void MarkLocationUpdate(AbstractLocation loc) { important_loc_.insert(loc); }

        void UpdateRegFile(const llvm::Value* reg, PointToMap pt_map);

        AbstractStore ExtractStoreToCurrentContext(const FunctionSummary& called_summary,
                                                   const std::vector<const llvm::Value*>& inputs);

        struct ArgParamMappingLookup
        {
            std::unordered_map<AbstractLocation, PointToMap> pa;
            std::unordered_map<AbstractLocation, PointToMap> ap;
        };

        ArgParamMappingLookup
        ConstructArgParamMappingLookup(const FunctionSummary& called_summary,
                                       const std::vector<const llvm::Value*>& inputs);

        void MergeInvocationStore(const llvm::Instruction* reg,
                                  const FunctionSummary& called_summary, AbstractStore result_store,
                                  ArgParamMappingLookup loc_mapping);
    };

} // namespace mh

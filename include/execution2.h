#pragma once
#include "llvm/IR/Instruction.h"
#include "constraint2.h"
#include "location2.h"

namespace mh
{
    struct FunctionSummary;
    class AnalysisContext;

    using PointToMap = std::unordered_map<LocationVar, Constraint>;

    // loc -> {point-to edge}
    using AbstractStore = std::unordered_map<LocationVar, PointToMap>;

    // reg-loc -> {point-to edge}
    // because of SSA form, specialize this from AbstractStore to reduce memory consumption
    using AbstractRegisterFile = std::unordered_map<const llvm::Value*, PointToMap>;

    void AddPointToEdge(PointToMap& edges, const LocationVar& loc, const Constraint& c);

    // simpilify constraint terms and filter unsatisfiable point-to edges from the store
    void NormalizeStore(ConstraintSolver& solver, AbstractStore& store);

    // assuming all constraints in PointToMap are satisfiable
    // compare if s1 === s2
    // 1. same topology
    // 2. all constraints are equivalent
    bool EqualAbstractStore(ConstraintSolver& solver, const AbstractStore& s1,
                            const AbstractStore& s2);

    // merge s2 into s1
    void MergeAbstractStore(AbstractStore& s1, const AbstractStore& s2);

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

        // %x = alloca/malloc
        void DoAssign(const llvm::Instruction* reg, LocationVar loc);

        // %x = f(?)
        void DoInvoke(const llvm::Instruction* reg, const std::vector<const llvm::Value*>& inputs,
                      const FunctionSummary& summary, int call_point);

        // %x = *p
        void DoLoad(const llvm::Instruction* reg, const llvm::Value* reg_ptr);

        // *p = %?
        void DoStore(const llvm::Value* reg_val, const llvm::Value* reg_ptr);
    };

} // namespace mh

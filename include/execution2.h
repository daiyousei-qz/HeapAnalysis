#pragma once
#include "llvm/IR/Instruction.h"
#include "constraint2.h"
#include "location2.h"

namespace mh
{
    struct FunctionSummary;
    class AnalysisContext;

    // { point-to edge = (target-loc, constraint) }
    using PointToMap = std::unordered_map<LocationVar, Constraint>;

    // loc -> {point-to edge}
    using AbstractStore = std::unordered_map<LocationVar, PointToMap>;

    // add a new point-to edge into a PointToMap, if target location already exist, constraint
    // will be merged with disjunction
    void AddPointToEdge(PointToMap& edges, const LocationVar& loc, const Constraint& c);

    // simpilify constraint terms and erase unsatisfiable point-to edges from the store
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

        // deprecated
        void DoAssign(const llvm::Instruction* reg, LocationVar loc);

        // %x = alloca/malloc
        void DoAlloc(const llvm::Instruction* reg, bool heap_alloc);

        // %x = phi(v1, v2)
        void DoAssignPhi(const llvm::Instruction* reg, const llvm::Value* val1,
                         const llvm::Value* val2);

        // %x = f(?)
        void DoInvoke(const llvm::Instruction* reg, const std::vector<const llvm::Value*>& inputs,
                      const FunctionSummary& summary);

        // %x = *p
        void DoLoad(const llvm::Instruction* reg, const llvm::Value* reg_ptr);

        // *p = %?
        void DoStore(const llvm::Value* reg_val, const llvm::Value* reg_ptr);
    };

} // namespace mh

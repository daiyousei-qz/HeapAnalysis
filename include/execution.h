#pragma once
#include "location.h"
#include "constraint.h"

struct FunctionSummary;
class AnalysisContext;

using PointToMap    = std::unordered_map<LocationVar, Constraint>;
using AbstractStore = std::unordered_map<LocationVar, PointToMap>;

void AddPointToEdge(PointToMap& edges, LocationVar loc, Constraint c);

// compare
// both stores are assumed to be normalized
// i.e. every constrainted edge is satisfiable
bool EqualAbstractStore(ConstraintSolver& smt_engine, const AbstractStore& s1, const AbstractStore& s2);

// merge point-to graphs into s1
void MergeAbstractStore(AbstractStore& s1, const AbstractStore& s2);

class AbstractExecution
{
public:
    AbstractExecution(AnalysisContext* ctx, AbstractStore store)
        : ctx_(ctx), alias_map_(), store_(store)
    {
    }

    const AnalysisContext& GetContext() const noexcept
    {
        return *ctx_;
    }

    const AbstractStore& GetStore() const noexcept
    {
        return store_;
    }

    void MergeWith(const AbstractExecution& other)
    {
        // merge alias map
        // TODO: this could be generated ahead of analysis to avoid redundent computation
        for (const auto& [loc, canonical_loc] : other.alias_map_)
        {
            alias_map_.insert_or_assign(loc, canonical_loc);
        }

        // merge abstract store
        MergeAbstractStore(store_, other.store_);
    }

    // remove point-to edges with unsatisfiable constraint
    void NormalizeStore();

    // let alias_ptr ~= ptr
    void AliasRegister(const llvm::Value* reg, const llvm::Value* alias_target);

    // unroll alias
    const llvm::Value* GetCanonicalRegister(const llvm::Value* reg);

    // x = alloc(?)
    void AssignRegister(const llvm::Value* reg, LocationVar val);

    // x = f(...)
    void Invoke(const llvm::Value* reg_assign, const llvm::Value** reg_args, const FunctionSummary& summary);

    // x = *p
    void ReadStore(const llvm::Value* reg, const llvm::Value* reg_ptr);

    // *p = x
    void WriteStore(const llvm::Value* reg_val, const llvm::Value* reg_ptr);

private:
    PointToMap& LookupRegister(const llvm::Value* reg);

    AnalysisContext* ctx_;

    std::unordered_map<const llvm::Value*, const llvm::Value*> alias_map_;
    AbstractStore store_;
};
#pragma once
#include "location.h"
#include "constraint.h"

class AnalysisContext;

using PointToMap = std::unordered_map<LocationVar, Constraint>;
using AbstractStore = std::unordered_map<LocationVar, PointToMap>;

void AddPointToEdge(PointToMap& edges, LocationVar loc, Constraint c);

// compare
// both stores are assumed to be normalized
// i.e. every constrainted edge is satisfiable
bool EqualAbstractStore(ConstraintEngine& smt_engine, const AbstractStore& s1, const AbstractStore& s2);

// merge point-to graphs into s1
void MergeAbstractStore(AbstractStore& s1, const AbstractStore& s2);

class AbstractExecution
{
public:
    AbstractExecution(AnalysisContext* ctx, AbstractStore store)
        : ctx_(ctx), alias_map_(), store_(store)
    {}

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
    void AliasRegister(LocationVar reg, LocationVar alias_target);

    // unroll alias
    LocationVar GetCanonicalLoc(LocationVar loc);

    // x = alloc(?)
    void AssignRegister(LocationVar reg, LocationVar val);

    // x = *p
    void ReadStore(LocationVar reg, LocationVar loc_to_ptr);

    // *p = x
    void WriteStore(LocationVar loc_to_val, LocationVar loc_to_ptr);

private:
    AnalysisContext* ctx_;

    std::unordered_map<LocationVar, LocationVar> alias_map_;
    AbstractStore store_;
};
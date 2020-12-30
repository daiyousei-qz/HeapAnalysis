#pragma once
#include "constraint.h"
#include "location.h"

namespace mh
{
    // { point-to edge = (target-loc, constraint) }
    using PointToMap = std::unordered_map<AbstractLocation, Constraint>;

    // loc -> {point-to edge}
    using AbstractStore = std::unordered_map<AbstractLocation, PointToMap>;

    // add a new point-to edge into a PointToMap, if target location already exist, constraint
    // will be merged with disjunction
    void AddPointToEdge(PointToMap& edges, const AbstractLocation& loc, const Constraint& c);

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
} // namespace mh
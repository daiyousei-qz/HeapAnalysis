#pragma once
#include "constraint.h"
#include "location.h"
#include <utility>

namespace mh
{
    template <typename T> using EdgeConstraintMap = std::unordered_map<T, Constraint>;

    // compare if edge_map_old === edge_map_new
    template <typename T>
    static bool EqualEdgeConstraintMap(ConstraintSolver& solver,
                                       const EdgeConstraintMap<T>& edge_map_old,
                                       const EdgeConstraintMap<T>& edge_map_new)
    {
        if (edge_map_old.size() != edge_map_old.size())
        {
            for (const auto& [target, c_new] : edge_map_new)
            {
                if (auto it = edge_map_old.find(target); it == edge_map_old.end())
                {
                    if (solver.TestSatisfiability(c_new))
                    {
                        return false;
                    }
                }
            }

            for (const auto& [target, c_old] : edge_map_old)
            {
                if (auto it = edge_map_new.find(target); it != edge_map_new.end())
                {
                    if (!solver.TestEquivalence(it->second, c_old))
                    {
                        return false;
                    }
                }
                else
                {
                    if (solver.TestSatisfiability(c_old))
                    {
                        return false;
                    }
                }
            }
        }
        else
        {
            for (const auto& [target, c_new] : edge_map_new)
            {
                if (auto it = edge_map_old.find(target); it != edge_map_old.end())
                {
                    if (!solver.TestEquivalence(c_new, it->second))
                    {
                        return false;
                    }
                }
                else
                {
                    if (solver.TestSatisfiability(c_new))
                    {
                        return false;
                    }
                }
            }

            for (const auto& [target, c_old] : edge_map_old)
            {
                if (auto it = edge_map_new.find(target); it == edge_map_new.end())
                {
                    if (solver.TestSatisfiability(c_old))
                    {
                        return false;
                    }
                }
            }
        }

        return true;
    }

    // { point-to edge = (target-loc, constraint) }
    using PointToMap = EdgeConstraintMap<AbstractLocation>;

    // loc -> {point-to edge}
    using AbstractStore = std::unordered_map<AbstractLocation, PointToMap>;

    // add a new point-to edge into a PointToMap, if target location already exist, constraint
    // will be merged with disjunction
    void AddPointToEdge(PointToMap& edges, const AbstractLocation& loc, const Constraint& c);

    // simpilify constraint terms and erase unsatisfiable point-to edges from the store
    void NormalizeStore(ConstraintSolver& solver, AbstractStore& store);

    // compare if pt_map_old === pt_map_new
    bool EqualPointToMap(ConstraintSolver& solver, const PointToMap& pt_map_old,
                         const PointToMap& pt_map_new);

    // assuming all constraints in PointToMap are satisfiable
    // compare if s1 === s2
    // 1. same topology
    // 2. all constraints are equivalent
    // NOTE heuristic optimize for [s1: new, s2: old]
    bool EqualAbstractStore(ConstraintSolver& solver, const AbstractStore& s1,
                            const AbstractStore& s2);

    // merge s2 into s1
    void MergeAbstractStore(AbstractStore& s1, const AbstractStore& s2);

    template <typename T> class ConstrainedRelationGraph
    {
    public:
        class EdgeCollection
        {
        private:
            EdgeConstraintMap<T> data_;

            friend class ConstrainedRelationGraph;

        public:
            auto begin() noexcept { return data_.begin(); }
            auto end() noexcept { return data_.end(); }

            auto begin() const noexcept { return data_.begin(); }
            auto end() const noexcept { return data_.end(); }

            size_t size() const noexcept { return data_.size(); }

            Constraint& operator[](const T& x) { return data_[x]; }
            const Constraint& operator[](const T& x) const
            {
                if (auto it = data_.find(x); it != data_.end())
                {
                    return it->second;
                }
                else
                {
                    static Constraint empty{false};
                    return empty;
                }
            }

            const auto& Container() const noexcept { return data_; }

            void Clear() { data_.clear(); }

            void AddRelationEdge(const T& src, const Constraint& c)
            {
                if (auto it = data_.find(src); it == data_.end())
                {
                    data_.insert(std::pair{src, c});
                }
                else
                {
                    it->second = c || it->second;
                }
            }
            void OverwriteRelationEdge(const T& src, const Constraint& c)
            {
                bool written = false;
                for (auto& [node, constraint] : data_)
                {
                    if (node == src)
                    {
                        constraint = c || constraint;
                        written    = true;
                    }
                    else
                    {
                        constraint = !c && constraint;
                    }
                }

                if (!written)
                {
                    data_.insert(std::pair{src, c});
                }
            }
        };

    private:
        int num_edge_ = 0;
        std::unordered_map<AbstractLocation, EdgeCollection> data_;

    public:
        auto begin() noexcept { return data_.begin(); }
        auto end() noexcept { return data_.end(); }

        auto begin() const noexcept { return data_.begin(); }
        auto end() const noexcept { return data_.end(); }

        size_t size() const noexcept { return data_.size(); }

        EdgeCollection& operator[](const AbstractLocation& loc) { return data_[loc]; }
        const EdgeCollection& operator[](const AbstractLocation& loc) const
        {
            if (auto it = data_.find(loc); it != data_.end())
            {
                return it->second;
            }
            else
            {
                static EdgeCollection empty;
                return empty;
            }
        }

        // NOTE users has to track if number of edges is changed and call `UpdateCachedNumEdge`
        int CachedNumEdge() { return num_edge_; }

        void UpdateCachedNumEdge()
        {
            num_edge_ = 0;
            for (const auto& [loc, edges] : data_)
            {
                num_edge_ += edges.size();
            }
        }

        void AddRelationEdge(const AbstractLocation& loc, const T& src, const Constraint& c)
        {
            data_[loc].AddRelationEdge(src, c);
        }
        void OverwriteRelationEdge(const AbstractLocation& loc, const T& src, const Constraint& c)
        {
            data_[loc].OverwriteRelationEdge(src, c);
        }

        void Normalize(ConstraintSolver& solver)
        {
            for (auto& [loc, edges_collection] : data_)
            {
                for (auto it = edges_collection.begin(); it != edges_collection.end();)
                {
                    it->second.Simplify();

                    if (!solver.TestSatisfiability(it->second))
                    {
                        it = edges_collection.data_.erase(it);
                    }
                    else if (solver.TestValidity(it->second))
                    {
                        it->second = Constraint{true};
                        ++it;
                    }
                    else
                    {
                        ++it;
                    }
                }
            }
        }

        // NOTE heuristic optimize for [this: new, other: old]
        bool Equals(ConstraintSolver& solver, const ConstrainedRelationGraph& other)
        {
            const auto& g1 = data_;
            const auto& g2 = other.data_;

            for (const auto& [loc, edge_collection_1] : g1)
            {
                if (auto it_edge_collection_2 = g2.find(loc); it_edge_collection_2 != g2.end())
                {
                    const auto& edge_collection_2 = it_edge_collection_2->second;

                    // only compare edge collections with different sizes in the first iteration
                    // heuristic that they are more probable to differ
                    if (edge_collection_1.size() != edge_collection_2.size())
                    {
                        if (!EqualEdgeConstraintMap(solver, edge_collection_1.Container(),
                                                    edge_collection_2.Container()))
                        {
                            return false;
                        }
                    }
                }
                else
                {
                    for (const auto& [target, c] : edge_collection_1)
                    {
                        if (solver.TestSatisfiability(c))
                        {
                            return false;
                        }
                    }
                }
            }

            for (const auto& [loc, edge_collection_2] : g2)
            {
                if (auto it_edge_collection_1 = g1.find(loc); it_edge_collection_1 != g1.end())
                {
                    const auto& edge_collection_1 = it_edge_collection_1->second;

                    // edge collections with different sizes are inspected in the first iteration
                    if (edge_collection_1.size() == edge_collection_2.size())
                    {
                        if (!EqualEdgeConstraintMap(solver, edge_collection_1.Container(),
                                                    edge_collection_2.Container()))
                        {
                            return false;
                        }
                    }
                }
                else
                {
                    for (const auto& [target, c] : edge_collection_2)
                    {
                        if (solver.TestSatisfiability(c))
                        {
                            return false;
                        }
                    }
                }
            }

            return true;
        }

        void Merge(ConstraintSolver& solver, const ConstrainedRelationGraph& other)
        {
            auto& g1       = data_;
            const auto& g2 = other.data_;

            // weaken edges exclusively in g1
            for (auto& [loc, edge_collection_1] : g1)
            {
                if (auto it = g2.find(loc); it != g2.end())
                {
                    const auto& edge_collection_2 = it->second;
                    for (auto& [target, c1] : edge_collection_1)
                    {
                        if (edge_collection_2.data_.find(target) == edge_collection_2.end())
                        {
                            c1 = c1.Weaken();
                        }
                    }
                }
                else
                {
                    for (auto& [target, c1] : edge_collection_1)
                    {
                        c1 = c1.Weaken();
                    }
                }
            }

            // weaken edges exclusively in s2 and add them to s1
            // combine constraints of shared edges between s1 and s3
            for (const auto& [loc, edge_collection_2] : g2)
            {
                if (auto it_relations = g1.find(loc); it_relations != g1.end())
                {
                    auto& edge_collection_1 = it_relations->second;
                    for (const auto& [target, c2] : edge_collection_2)
                    {
                        if (auto it = edge_collection_1.data_.find(target);
                            it != edge_collection_1.end())
                        {
                            it->second = it->second.Combine(c2);
                        }
                        else
                        {
                            edge_collection_1.data_.insert(std::pair{target, c2.Weaken()});
                        }
                    }
                }
                else
                {
                    auto& edge_collection_1 = g1[loc];
                    for (const auto& [target, c2] : edge_collection_2)
                    {
                        edge_collection_1.data_.insert(std::pair{target, c2.Weaken()});
                    }
                }
            }
        }

        void Print()
        {
            for (const auto& [loc, edges] : data_)
            {
                fmt::print("+ {}\n", loc);
                for (const auto& [target, c] : edges)
                {
                    fmt::print("-> {} ? {}\n", *target, c);
                }
            }
        }
    };

    using ConstrainedDataDependencyGraph = ConstrainedRelationGraph<const llvm::Value*>;

    bool EqualDataDepEdgeCollection(ConstraintSolver& solver,
                                    const ConstrainedDataDependencyGraph::EdgeCollection& col_old,
                                    const ConstrainedDataDependencyGraph::EdgeCollection& col_new);
} // namespace mh
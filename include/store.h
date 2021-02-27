#pragma once
#include "constraint.h"
#include "location.h"
#include <utility>

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

    // compare if pt_map_old === pt_map_new
    bool EqualPointToMap(ConstraintSolver& solver, const PointToMap& pt_map_old,
                         const PointToMap& pt_map_new);

    // assuming all constraints in PointToMap are satisfiable
    // compare if s1 === s2
    // 1. same topology
    // 2. all constraints are equivalent
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
            std::unordered_map<T, Constraint> data_;

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

        bool Equals(ConstraintSolver& solver, const ConstrainedRelationGraph& other)
        {
            const auto& g1 = data_;
            const auto& g2 = other.data_;

            if (g1.size() != g2.size())
            {
                return false;
            }

            for (const auto& [loc, edge_collection_1] : g1)
            {
                auto it_edge_collection_2 = g2.find(loc);
                if (it_edge_collection_2 == g2.end())
                {
                    // different topology, loc not in g2
                    return false;
                }

                const auto& edge_collection_2 = it_edge_collection_2->second;
                if (edge_collection_1.size() != edge_collection_2.size())
                {
                    // different topology, num of target differs
                    return false;
                }

                for (const auto& [target, c1] : edge_collection_1)
                {
                    auto it = edge_collection_2.data_.find(target);
                    if (it == edge_collection_2.end())
                    {
                        // different topology, target not in g2[loc]
                        return false;
                    }

                    const Constraint& c2 = it->second;
                    if (!solver.TestEquivalence(c1, c2))
                    {
                        // different constraint
                        return false;
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
    };

    using ConstrainedDataDependencyGraph = ConstrainedRelationGraph<const llvm::Value*>;
} // namespace mh
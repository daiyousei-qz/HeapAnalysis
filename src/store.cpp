#include "store.h"
#include <utility>

using namespace std;
using namespace llvm;

namespace mh
{
    void AddPointToEdge(PointToMap& edges, const AbstractLocation& loc, const Constraint& c)
    {
        if (auto it = edges.find(loc); it == edges.end())
        {
            edges.insert(std::pair{loc, c});
        }
        else
        {
            it->second = c || it->second;
        }
    }

    void NormalizeStore(ConstraintSolver& solver, AbstractStore& store)
    {
        for (auto& [src_loc, pt_map] : store)
        {
            for (auto it = pt_map.begin(); it != pt_map.end();)
            {
                it->second.Simplify();

                if (!solver.TestSatisfiability(it->second))
                {
                    it = pt_map.erase(it);
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

    bool EqualPointToMap(ConstraintSolver& solver, const PointToMap& pt_map_old,
                         const PointToMap& pt_map_new)
    {
        for (const auto& [loc, c_new] : pt_map_new)
        {
            if (auto it = pt_map_old.find(loc); it != pt_map_old.end())
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

        for (const auto& [loc, c_old] : pt_map_old)
        {
            if (auto it = pt_map_new.find(loc); it == pt_map_new.end())
            {
                if (solver.TestSatisfiability(c_old))
                {
                    return false;
                }
            }
        }

        return true;
    }

    bool EqualAbstractStore(ConstraintSolver& solver, const AbstractStore& s1,
                            const AbstractStore& s2)
    {
        if (s1.size() != s2.size())
        {
            return false;
        }

        for (const auto& [src_loc, pt_map_1] : s1)
        {
            auto it_pt_map_2 = s2.find(src_loc);
            if (it_pt_map_2 == s2.end())
            {

                // different topology, src loc not in s2
                return false;
            }

            const PointToMap& pt_map_2 = it_pt_map_2->second;
            if (pt_map_1.size() != pt_map_2.size())
            {
                // different topology, num target loc differs
                return false;
            }

            for (const auto& [target_loc, c1] : pt_map_1)
            {
                auto it = pt_map_2.find(target_loc);
                if (it == pt_map_2.end())
                {
                    // different topology, target loc not in s2[src_loc]
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

    void MergeAbstractStore(AbstractStore& s1, const AbstractStore& s2)
    {
        // weaken edges exclusively in s1
        for (auto& [src_loc, pt_map_1] : s1)
        {
            if (auto it = s2.find(src_loc); it != s2.end())
            {
                const PointToMap& pt_map_2 = it->second;
                for (auto& [target_loc, c1] : pt_map_1)
                {
                    if (pt_map_2.find(target_loc) == pt_map_2.end())
                    {
                        c1 = c1.Weaken();
                    }
                }
            }
            else
            {
                for (auto& [target_loc, c1] : pt_map_1)
                {
                    c1 = c1.Weaken();
                }
            }
        }

        // weaken edges exclusively in s2 and add them to s1
        // combine constraints of shared edges between s1 and s3
        for (const auto& [src_loc, pt_map_2] : s2)
        {
            if (auto it_pt_map_1 = s1.find(src_loc); it_pt_map_1 != s1.end())
            {
                PointToMap& pt_map_1 = it_pt_map_1->second;
                for (const auto& [target_loc, c2] : pt_map_2)
                {
                    if (auto it = pt_map_1.find(target_loc); it != pt_map_1.end())
                    {
                        it->second = it->second.Combine(c2);
                    }
                    else
                    {
                        pt_map_1.insert(pair{target_loc, c2.Weaken()});
                    }
                }
            }
            else
            {
                PointToMap& pt_map_1 = s1[src_loc];
                for (const auto& [target_loc, c2] : pt_map_2)
                {
                    pt_map_1.insert(pair{target_loc, c2.Weaken()});
                }
            }
        }
    }
} // namespace mh

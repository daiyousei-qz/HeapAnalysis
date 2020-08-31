#include "execution.h"
#include "analysis.h"

void AddPointToEdge(PointToMap& edges, LocationVar loc, Constraint c)
{
    auto it = edges.find(loc);
    if (it == edges.end())
    {
        edges.emplace(std::make_pair(loc, std::move(c)));
    }
    else
    {
        it->second = c || it->second;
    }
}

bool EqualAbstractStore(ConstraintEngine& smt_engine, const AbstractStore& s1, const AbstractStore& s2)
{
    if (s1.size() != s2.size())
    {
        // different topology(num source location)
        return false;
    }

    for (const auto& [src_loc, pt_map_1] : s1)
    {
        // TODO: does src location always exist in s2?
        const auto& pt_map_2 = s2.at(src_loc);
        if (pt_map_1.size() != pt_map_2.size())
        {
            // different topology(num target location)
            return false;
        }

        for (const auto& [target_loc, c1] : pt_map_1)
        {
            auto it = pt_map_2.find(target_loc);
            if (it == pt_map_2.end())
            {
                // different topology(target location)
                return false;
            }

            const auto& c2 = it->second;
            if (!smt_engine.TestEquivalence(c1, c2))
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
    for (const auto& [src_loc, pt_map_2] : s2)
    {
        if (auto it1 = s1.find(src_loc); it1 != s1.end())
        {
            auto& pt_map_1 = it1->second;

            for (const auto& [target_loc, c2] : pt_map_2)
            {
                if (auto it2 = pt_map_1.find(target_loc); it2 != pt_map_1.end())
                {
                    it2->second = it2->second || c2;
                }
                else
                {
                    pt_map_1.emplace(std::make_pair(target_loc, c2));
                }
            }
        }
    }

    for (auto it = s1.begin(); it != s1.end();)
    {
        if (s2.find(it->first) == s2.end())
        {
            it = s1.erase(it);
        }
        else
        {
            ++it;
        }
    }
}

void AbstractExecution::NormalizeStore()
{
    for (auto& [src_loc, pt_map] : store_)
    {
        for (auto it = pt_map.begin(); it != pt_map.end();)
        {
            it->second.Simplify();
            
            if (ctx_->GetConstraintEngine().TestValidity(it->second))
            {
                it->second = ctx_->GetConstraintEngine().MakeTop();
                ++it;
            }
            else if (!ctx_->GetConstraintEngine().TestSatisfiability(it->second))
            {
                it = pt_map.erase(it);
            }
            else
            {
                ++it;
            }
        }
    }
}

void AbstractExecution::AliasRegister(LocationVar reg, LocationVar alias_target)
{
    alias_map_.insert_or_assign(reg, alias_target);
}

LocationVar AbstractExecution::GetCanonicalLoc(LocationVar loc)
{
    if (auto it = alias_map_.find(loc); it != alias_map_.end())
    {
        return it->second;
    }
    else
    {
        return loc;
    }
}
void AbstractExecution::AssignRegister(LocationVar reg, LocationVar val)
{
    store_[reg] = PointToMap{ {val, ctx_->GetConstraintEngine().MakeTop()} };
}
void AbstractExecution::ReadStore(LocationVar reg, LocationVar loc_to_ptr)
{
    // unroll alias
    loc_to_ptr = GetCanonicalLoc(loc_to_ptr);

    //
    auto& point_to_map = store_[reg];
    point_to_map.clear();
    for (const auto& [ptr, ptr_constraint] : store_[loc_to_ptr])
    {
        for (const auto& [val, val_constraint] : store_[ptr])
        {
            // TODO: filter unsatisfiable edges?
            AddPointToEdge(point_to_map, val, ptr_constraint && val_constraint);
        }
    }
}
void AbstractExecution::WriteStore(LocationVar loc_to_val, LocationVar loc_to_ptr)
{
    // unroll alias
    loc_to_val = GetCanonicalLoc(loc_to_val);
    loc_to_ptr = GetCanonicalLoc(loc_to_ptr);

    //
    // TODO: eliminate this branch, could be unified?
    if (loc_to_val.GetTag() == LocationTag::Value)
    {
        for (const auto& [ptr, ptr_constraint] : store_[loc_to_ptr])
        {
            auto& ptr_pt_map = store_[ptr];
            for (auto& [old_val, old_val_constraint] : ptr_pt_map)
            {
                old_val_constraint = !ptr_constraint && old_val_constraint;
            }

            AddPointToEdge(ptr_pt_map, loc_to_val, ptr_constraint);
        }
    }
    else
    {
        const auto& value_pt_map = store_.at(loc_to_val);
        for (const auto& [ptr, ptr_constraint] : store_[loc_to_ptr])
        {
            auto& ptr_pt_map = store_[ptr];
            for (auto& [old_val, old_val_constraint] : ptr_pt_map)
            {
                old_val_constraint = !ptr_constraint && old_val_constraint;
            }

            for (const auto& [val, val_constraint] : value_pt_map)
            {
                AddPointToEdge(ptr_pt_map, val, ptr_constraint && val_constraint);
            }
        }
    }
}
#include "execution.h"
#include "analysis.h"
#include "constraint.h"
#include "llvm/IR/Argument.h"
#include "llvm/IR/Function.h"
#include <map>

using namespace std;
using namespace llvm;

void AddPointToEdge(PointToMap& edges, LocationVar loc, Constraint c)
{
    auto it = edges.find(loc);
    if (it == edges.end())
    {
        edges.insert(make_pair(loc, move(c)));
    }
    else
    {
        it->second = c || it->second;
    }
}

bool EqualAbstractStore(ConstraintSolver& smt_engine, const AbstractStore& s1, const AbstractStore& s2)
{
    if (s1.size() != s2.size())
    {
        // different topology(num source location)
        return false;
    }

    for (const auto& [src_loc, pt_map_1] : s1)
    {
        // TODO: does src location always exist in s2?
        const PointToMap& pt_map_2 = s2.at(src_loc);
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

            const Constraint& c2 = it->second;
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

            if (ctx_->GetSmtSolver().TestValidity(it->second))
            {
                it->second = ctx_->GetSmtSolver().MakeTop();
                ++it;
            }
            else if (!ctx_->GetSmtSolver().TestSatisfiability(it->second))
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

void AbstractExecution::AliasRegister(const llvm::Value* reg, const llvm::Value* alias_target)
{
    alias_map_.insert_or_assign(reg, alias_target);
}

const llvm::Value* AbstractExecution::GetCanonicalRegister(const llvm::Value* reg)
{
    if (auto it = alias_map_.find(reg); it != alias_map_.end())
    {
        return it->second;
    }
    else
    {
        return reg;
    }
}

void AbstractExecution::AssignRegister(const llvm::Value* reg, LocationVar val)
{
    LocationVar loc_reg = LocationVar::FromProgramValue(reg);
    store_[loc_reg]     = PointToMap{{val, ctx_->GetSmtSolver().MakeTop()}};
}

void AbstractExecution::Invoke(const llvm::Value* reg_assign, const llvm::Value** reg_args, const FunctionSummary& summary)
{
    // TODO: filter out non-ptr argument to be consistant with analysis input collection
    int num_args = summary.function->arg_size();
    map<pair<int, int>, Constraint> contraint_map;
    for (int i = 1; i < num_args; ++i)
    {
        for (int j = 0; j < i; ++j)
        {
            PointToMap& pt_map_i = LookupRegister(reg_args[i]);
            PointToMap& pt_map_j = LookupRegister(reg_args[j]);

            Constraint c = ctx_->GetSmtSolver().MakeBottom();
            for (const auto& [target_loc, c_i] : pt_map_i)
            {
                if (auto iter = pt_map_j.find(target_loc); iter != pt_map_j.end())
                {
                    const Constraint& c_j = iter->second;
                    c                     = c || (c_i && c_j);
                }
            }

            constraint_map[make_pair(i, j)] = c;
        }
    }
}

void AbstractExecution::ReadStore(const llvm::Value* reg, const llvm::Value* reg_ptr)
{
    // unroll alias
    reg_ptr = GetCanonicalRegister(reg_ptr);

    // update point-to map
    PointToMap& pt_map = store_[LocationVar::FromProgramValue(reg)];
    pt_map.clear();

    PointToMap& ptr_loc_pt_map = LookupRegister(reg_ptr);
    for (const auto& [ptr, ptr_constraint] : ptr_loc_pt_map)
    {
        for (const auto& [val, val_constraint] : store_[ptr])
        {
            // TODO: filter unsatisfiable edges?
            AddPointToEdge(pt_map, val, ptr_constraint && val_constraint);
        }
    }
}

void AbstractExecution::WriteStore(const Value* reg_val, const Value* reg_ptr)
{
    // unroll alias
    reg_val = GetCanonicalRegister(reg_val);
    reg_ptr = GetCanonicalRegister(reg_ptr);

    // update point-to map
    const PointToMap& val_loc_pt_map = LookupRegister(reg_val);
    const PointToMap& ptr_loc_pt_map = LookupRegister(reg_ptr);
    for (const auto& [ptr, ptr_constraint] : ptr_loc_pt_map)
    {
        auto& ptr_pt_map = store_[ptr];
        for (auto& [old_val, old_val_constraint] : ptr_pt_map)
        {
            old_val_constraint = !ptr_constraint && old_val_constraint;
        }

        for (const auto& [val, val_constraint] : val_loc_pt_map)
        {
            AddPointToEdge(ptr_pt_map, val, ptr_constraint && val_constraint);
        }
    }
}

PointToMap& AbstractExecution::LookupRegister(const llvm::Value* reg)
{
    assert(reg != nullptr);
    LocationVar loc = LocationVar::FromProgramValue(reg);

    auto iter = store_.find(loc);
    if (iter != store_.end())
    {
        return iter->second;
    }

    PointToMap& pt_map = store_[loc];
    if (isa<Constant>(reg))
    {
        pt_map.insert_or_assign(LocationVar{LocationTag::Value, reg}, ctx_->GetSmtSolver().MakeTop());
    }
    else if (const Argument* arg_reg = dyn_cast<const Argument>(reg); arg_reg)
    {
        assert(!arg_reg->getType()->isPointerTy());
        pt_map.insert_or_assign(LocationVar{LocationTag::Dynamic, reg}, ctx_->GetSmtSolver().MakeTop());
    }
    else
    {
        throw "invalid register";
    }

    return pt_map;
}
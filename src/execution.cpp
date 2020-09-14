#include "execution.h"
#include "analysis.h"
#include "constraint.h"
#include "llvm-utils.h"
#include "fmt-utils.h"
#include "llvm/IR/Argument.h"
#include "llvm/IR/Function.h"
#include <map>
#include <deque>

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
    // step 1: rewrite constraint terms
    //

    // TODO: filter out non-ptr argument to be consistant with analysis input collection
    // TODO: move explicit z3 calls into constraint module?
    int num_args = summary.function->arg_size();
    z3::expr_vector zsrc{ctx_->GetSmtSolver().Context()};
    z3::expr_vector zdst{ctx_->GetSmtSolver().Context()};
    for (int i = 1; i < num_args; ++i)
    {
        for (int j = 0; j < i; ++j)
        {
            PointToMap& pt_map_i = LookupRegister(reg_args[i]);
            PointToMap& pt_map_j = LookupRegister(reg_args[j]);

            Constraint c = ctx_->GetSmtSolver().MakeBottom();
            for (const auto& [loc_dst_i, c_i] : pt_map_i)
            {
                if (auto iter = pt_map_j.find(loc_dst_i); iter != pt_map_j.end())
                {
                    const Constraint& c_j = iter->second;

                    c = c || (c_i && c_j);
                }
            }

            c.Simplify();
            zsrc.push_back(ctx_->GetSmtSolver().MakeAliasLocationExpr(i, j));
            zdst.push_back(c.body);
        }
    }

#ifdef MODULE_DEBUG_MODE
    fmt::print("[Constraint mapping]\n");
    for (int i = 0; i < zsrc.size(); ++i)
    {
        fmt::print("{} <-> {}\n", zsrc[i].to_string(), zdst[i].to_string());
    }
#endif

    // TODO: deal with ast distinct?
    AbstractExecution exec_callee = *summary.result;
    for (auto& [loc_src, pt_map] : exec_callee.store_)
    {
        for (auto& [loc_dst, constraint] : pt_map)
        {
            constraint.body.substitute(zsrc, zdst);
        }
    }

    // step 2: compute mappings of dynamic location variables
    //
    std::unordered_map<LocationVar, PointToMap> loc_mappings_pa;
    std::unordered_map<LocationVar, PointToMap> loc_mappings_ap;
    std::deque<std::pair<LocationVar, Constraint>> loc_args;
    std::deque<std::pair<LocationVar, Constraint>> loc_arg_pointees;
    for (int i = 0; i < num_args; ++i)
    {
        const llvm::Value* input_param = summary.inputs[i];
        int ptr_level                  = GetPointerNestLevel(input_param->getType());

        // TODO: should we add register location variable mapping?
        //       i.e. REG_P ->(T) REG_A
        loc_args.clear();
        loc_arg_pointees.clear();
        for (const auto& [loc_a_pointee, loc_a_constraint] : store_.at(LocationVar::FromProgramValue(reg_args[i])))
        {
            loc_args.emplace_back(loc_a_pointee, loc_a_constraint);
        }

        for (int deref_level = 0; deref_level <= ptr_level; ++deref_level)
        {
            LocationVar loc_p  = LocationVar{LocationTag::Dynamic, input_param, deref_level};
            PointToMap& pt_map = loc_mappings_pa[loc_p];

            assert(loc_arg_pointees.empty());
            while (!loc_args.empty())
            {
                auto [loc_a, constraint] = std::move(loc_args.front());
                loc_args.pop_front();

#ifdef MODULE_DEBUG_MODE
                constraint.Simplify();
#endif

                auto iter_pt_map_a = store_.find(loc_a);
                if (iter_pt_map_a != store_.end())
                {
                    for (const auto& [loc_a_pointee, loc_a_constraint] : iter_pt_map_a->second)
                    {
                        loc_arg_pointees.emplace_back(loc_a_pointee, constraint && loc_a_constraint);
                    }
                }

                pt_map.insert_or_assign(loc_a, constraint);
                loc_mappings_ap[loc_a].insert_or_assign(loc_p, constraint);
            }

            std::swap(loc_args, loc_arg_pointees);
        }
    }

#ifdef MODULE_DEBUG_MODE
    fmt::print("[Location mapping]\n");
    for (const auto& [loc_p, eq_map] : loc_mappings_pa)
    {
        for (const auto& [loc_a, eq_constraint] : eq_map)
        {
            fmt::print("{} <-> {} | {}\n", loc_p, loc_a, eq_constraint);
        }
    }
#endif

    // step 3: merge callee's heap into this execution
    //
    for (const auto& [loc_a, eq_map] : loc_mappings_ap)
    {
        Constraint pass_in_constraint = ctx_->GetSmtSolver().MakeBottom();
        PointToMap new_pt_map;

        for (const auto& [loc_p, eq_constraint] : eq_map)
        {
            pass_in_constraint = pass_in_constraint || eq_constraint;

            for (const auto& [val_p, val_p_constraint] : exec_callee.store_[loc_p])
            {
                if (val_p.GetTag() == LocationTag::Dynamic)
                {
                    auto iter_pa_mapping = loc_mappings_pa.find(val_p);
                    if (iter_pa_mapping != loc_mappings_pa.end())
                    {
                        for (const auto& [val_a, mapping_constraint] : iter_pa_mapping->second)
                        {
                            // fmt::print("+++{} <-> {}\n", loc_a, loc_p);
                            // fmt::print("  => {} <-> {}\n", val_a, val_p);
                            // fmt::print("eq {}\n", eq_constraint);
                            // fmt::print("p {}\n", val_p_constraint);
                            // fmt::print("a {}\n", mapping_constraint);
                            // fmt::print("---\n", loc_a);

                            AddPointToEdge(new_pt_map, val_a, eq_constraint && val_p_constraint && mapping_constraint);
                        }
                    }
                }
                else
                {
                    // TODO: add a tag to differentiate
                    AddPointToEdge(new_pt_map, val_p, eq_constraint && val_p_constraint);
                }
            }
        }

        for (const auto& [val_a, val_a_constraint] : store_[loc_a])
        {
            AddPointToEdge(new_pt_map, val_a, !pass_in_constraint && val_a_constraint);
        }

#ifdef MODULE_DEBUG_MODE
        fmt::print("rewriting ptmap of {}\n", loc_a);
        for (auto& [loc_target, constraint] : new_pt_map)
        {
            constraint.Simplify();
            fmt::print("  -> {} ? {}\n", loc_target, constraint);
        }
#endif
        store_[loc_a] = std::move(new_pt_map);
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
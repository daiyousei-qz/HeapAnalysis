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
        edges.insert(pair{loc, move(c)});
    }
    else
    {
        it->second = c || it->second;
    }
}

bool EqualAbstractStore(ConstraintSolver& smt_engine, const AbstractStore& s1,
                        const AbstractStore& s2)
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
    LocationVar loc_reg = LocationVar::FromRegister(reg);
    store_[loc_reg]     = PointToMap{{val, ctx_->GetSmtSolver().MakeTop()}};
}

void AbstractExecution::Invoke(const llvm::Value* reg_assign,
                               const std::vector<const llvm::Value*>& reg_inputs,
                               const FunctionSummary& summary, int call_point)
{
    // step 1: rewrite constraint terms
    //

    // TODO: filter out non-ptr argument to be consistant with analysis input
    // collection
    // TODO: move explicit z3 calls into constraint module?
    assert(reg_inputs.size() == summary.inputs.size());

    z3::expr_vector zsrc{ctx_->GetSmtSolver().Context()};
    z3::expr_vector zdst{ctx_->GetSmtSolver().Context()};
    for (int i = 1; i < summary.inputs.size(); ++i)
    {
        for (int j = 0; j < i; ++j)
        {
            // we want to convert alias constraint from callee's context into call sites'
            // i.e. term (xi, xj) -> c(i, j)

            // input point-to map in argument-space
            PointToMap& input_pt_map_i = LookupRegister(reg_inputs[i]);
            PointToMap& input_pt_map_j = LookupRegister(reg_inputs[j]);

            Constraint c = ctx_->GetSmtSolver().MakeBottom();
            for (const auto& [loc_dst_i, c_i] : input_pt_map_i)
            {
                if (auto iter = input_pt_map_j.find(loc_dst_i); iter != input_pt_map_j.end())
                {
                    const Constraint& c_j = iter->second;

                    // under c_i, reg_inputs[i] points to loc_dst_i
                    // under c_j, reg_inputs[j] points to loc_dst_i, too
                    // so under c_i && c_j may reg_inputs[i] and reg_inputs[j] alias
                    c = c || (c_i && c_j);
                }
            }

            c.Simplify();

            auto& smt_engine = *ctx_->Environment().SmtEngine();
            zsrc.push_back(smt_engine.AliasLocation(i) == smt_engine.AliasLocation(j));
            zdst.push_back(c.body);
        }
    }

    // TODO: deal with ast distinct?
    AbstractExecution exec_callee = *summary.result;
    for (auto& [loc_src, pt_map] : exec_callee.store_)
    {
        for (auto& [loc_dst, constraint] : pt_map)
        {
            constraint = constraint.body.substitute(zsrc, zdst);
        }
    }

#ifdef HEAP_ANALYSIS_DEBUG_MODE
    fmt::print("[Constraint mapping]\n");
    for (int i = 0; i < zsrc.size(); ++i)
    {
        fmt::print("{} <-> {}\n", zsrc[i].to_string(), zdst[i].to_string());
    }
#endif

    // step 2: compute mappings of dynamic location variables
    //

    // parameter-space -> argument-space
    std::unordered_map<LocationVar, PointToMap> loc_mappings_pa;
    // argument-space -> parameter-space
    std::unordered_map<LocationVar, PointToMap> loc_mappings_ap;
    // buffer of argument-space locations to be mapped
    // constraint should be an accumulation of constraint in the path from reg to loc
    std::deque<std::pair<LocationVar, Constraint>> loc_buffer_a;
    // buffer of pointed locations of current location under analysis
    // constraint should be an accumulation of constraint in the path from reg to loc
    std::deque<std::pair<LocationVar, Constraint>> loc_pointed_buffer_a;
    for (int i = 0; i < summary.inputs.size(); ++i)
    {
        // build two-way mapping
        // for each pi --> *pi --> ... --> **pi
        //          |c      |c               |c
        //          ai --> *ai --> ... --> **ai
        const llvm::Value* input_param = summary.inputs[i];
        const llvm::Value* input_arg   = reg_inputs[i];

        int ptr_level = GetPointerNestLevel(input_param->getType());

        // initialize buffer

        loc_buffer_a.clear();
        loc_pointed_buffer_a.clear();
        for (const auto& [loc_pointed_a, constraint] : LookupRegister(input_arg))
        {
            loc_buffer_a.push_back(pair{loc_pointed_a, constraint});
        }

        // breadth first traversal to construct mappings
        for (int deref_level = 0; deref_level <= ptr_level; ++deref_level)
        {
            LocationVar loc_p = LocationVar::FromRuntimeMemory(input_param, deref_level);

            assert(loc_pointed_buffer_a.empty());
            while (!loc_buffer_a.empty())
            {
                auto [loc_a, constraint] = std::move(loc_buffer_a.front());
                loc_buffer_a.pop_front();

#ifdef HEAP_ANALYSIS_DEBUG_MODE
                constraint.Simplify();
#endif

                // collect pointed locations of loc_a
                auto iter_pt_map_a = store_.find(loc_a);
                if (iter_pt_map_a != store_.end())
                {
                    for (const auto& [loc_pointed_a, pointed_constraint] : iter_pt_map_a->second)
                    {
                        loc_pointed_buffer_a.push_back(
                            pair{loc_pointed_a, constraint && pointed_constraint});
                    }
                }

                // save mappings
                loc_mappings_pa[loc_p].insert(pair{loc_a, constraint});
                loc_mappings_ap[loc_a].insert(pair{loc_p, constraint});
            }

            // reuse buffer
            std::swap(loc_buffer_a, loc_pointed_buffer_a);
        }
    }

#ifdef HEAP_ANALYSIS_DEBUG_MODE
    fmt::print("[Location mapping]\n");
    for (const auto& [loc_p, eq_map] : loc_mappings_pa)
    {
        for (const auto& [loc_a, eq_constraint] : eq_map)
        {
            fmt::print("{} <-> {} | {}\n", loc_p, loc_a, eq_constraint);
        }
    }
#endif

    // step 3: merge callee's heap into current execution
    //
    for (const auto& [loc_a, eq_map] : loc_mappings_ap)
    {
        Constraint pass_in_constraint = ctx_->GetSmtSolver().MakeBottom();
        PointToMap new_pt_map;

        // case 1: location is passed into callee
        for (const auto& [loc_p, eq_constraint] : eq_map)
        {
            pass_in_constraint = pass_in_constraint || eq_constraint;

            for (const auto& [loc_pointed_p, pt_constraint] : exec_callee.store_[loc_p])
            {
                assert(loc_pointed_p.Tag() != LocationTag::Register);

                // under eq_constraint, loc_a <=> loc_p
                // under pt_constraint, loc_p -> loc_pointed_p
                if (loc_pointed_p.Tag() == LocationTag::Dynamic)
                {
                    // having tag Dynamic
                    // actual location defined in caller's context
                    auto iter_pa_mapping = loc_mappings_pa.find(loc_pointed_p);
                    if (iter_pa_mapping != loc_mappings_pa.end())
                    {
                        for (const auto& [loc_pointed_a, mapping_constraint] :
                             iter_pa_mapping->second)
                        {
                            // under mapping_constraint, loc_pointed_p <=> loc_pointed_a
                            AddPointToEdge(new_pt_map, loc_pointed_a,
                                           eq_constraint && pt_constraint && mapping_constraint);
                        }
                    }
                }
                else
                {
                    // having tag Value/StackAlloc/HeapAlloc
                    // actual location defined in callee's context
                    AddPointToEdge(new_pt_map, loc_pointed_p.Rebrand(call_point),
                                   eq_constraint && pt_constraint);
                }
            }
        }

        // case2: location isn't passed into callee
        for (const auto& [loc_pointed_a, constraint] : store_[loc_a])
        {
            AddPointToEdge(new_pt_map, loc_pointed_a, !pass_in_constraint && constraint);
        }

#ifdef HEAP_ANALYSIS_DEBUG_MODE
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
    PointToMap& pt_map = store_[LocationVar::FromRegister(reg)];
    pt_map.clear();

    PointToMap& ptr_loc_pt_map = LookupRegister(reg_ptr);
    for (const auto& [ptr, ptr_constraint] : ptr_loc_pt_map)
    {
        for (const auto& [val, val_constraint] : store_[ptr])
        {
            // TODO: filter unsatisfiable edges?
            AddPointToEdge(pt_map, val, ptr_constraint && val_constraint);
            fmt::print("  add edge {} ? [ptr:{}; val: {}]\n", val, ptr_constraint, val_constraint);
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
    LocationVar loc = LocationVar::FromRegister(reg);

    auto iter = store_.find(loc);
    if (iter != store_.end())
    {
        return iter->second;
    }

    PointToMap& pt_map = store_[loc];
    if (isa<Constant>(reg))
    {
        pt_map.insert(pair{LocationVar::FromProgramValue(reg), ctx_->GetSmtSolver().MakeTop()});
    }
    else
    {
        throw "invalid register";
    }

    return pt_map;
}
#include "execution.h"
#include "analysis.h"
#include <deque>

using namespace std;
using namespace llvm;

namespace mh
{
    void AbstractExecution::DoAssign(const llvm::Instruction* reg, LocationVar loc)
    {
        ctx_->LookupRegFile(reg) = PointToMap{{loc, Constraint{true}}};
    }

    void AbstractExecution::DoAlloc(const llvm::Instruction* reg)
    {
        LocationVar loc          = LocationVar::FromAllocation(reg);
        ctx_->LookupRegFile(reg) = PointToMap{{loc, Constraint{true}}};

        // assign null on allocation
        PointToMap& ptr_pt_map = store_[loc];
        if (ptr_pt_map.empty())
        {
            ptr_pt_map.insert(pair{LocationVar::FromProgramValue(nullptr), Constraint{true}});
        }
    }

    void AbstractExecution::DoAssignPhi(const llvm::Instruction* reg, const llvm::Value* val1,
                                        const llvm::Value* val2)
    {
        const PointToMap& pt_map_1 = ctx_->LookupRegFile(val1);
        const PointToMap& pt_map_2 = ctx_->LookupRegFile(val2);

        PointToMap& pt_map_update = ctx_->LookupRegFile(reg);
        pt_map_update.clear();

        for (const auto& [loc, constraint_1] : pt_map_1)
        {
            if (auto it = pt_map_2.find(loc); it != pt_map_2.end())
            {
                pt_map_update.insert(pair{loc, constraint_1.Combine(it->second)});
            }
            else
            {
                pt_map_update.insert(pair{loc, constraint_1.Weaken()});
            }
        }

        for (const auto& [loc, constraint_2] : pt_map_2)
        {
            if (pt_map_1.find(loc) == pt_map_1.end())
            {
                pt_map_update.insert(pair{loc, constraint_2.Weaken()});
            }
        }
    }

    AbstractStore
    AbstractExecution::ExtractStoreToCurrentContext(const FunctionSummary& called_summary,
                                                    const std::vector<const llvm::Value*>& inputs)
    {
        z3::expr_vector zsrc{SmtProvider::Current().Context()};
        z3::expr_vector zdst_may{SmtProvider::Current().Context()};
        z3::expr_vector zdst_must{SmtProvider::Current().Context()};
        for (int i = 1; i < called_summary.inputs.size(); ++i)
        {
            for (int j = 0; j < i; ++j)
            {
                // input point-to map in argument-space
                PointToMap& input_pt_map_i = ctx_->LookupRegFile(inputs[i]);
                PointToMap& input_pt_map_j = ctx_->LookupRegFile(inputs[j]);

                // here, we want to compute constraint under which ai and aj alias
                Constraint c_alias_ij{false};
                for (const auto& [loc_target_i, c_i] : input_pt_map_i)
                {
                    if (auto it = input_pt_map_j.find(loc_target_i); it != input_pt_map_j.end())
                    {
                        const Constraint& c_j = it->second;

                        // under c_i, reg_inputs[i] points to loc_target_i
                        // under c_j, reg_inputs[j] points to loc_target_i
                        // so under c_i && c_j may reg_inputs[i] and reg_inputs[j] alias
                        c_alias_ij = c_alias_ij || (c_i && c_j);
                    }
                }

                c_alias_ij.Simplify();

                SmtProvider& smt_provider = SmtProvider::Current();
                zsrc.push_back(smt_provider.CreateAliasExpr(i, j));
                zdst_may.push_back(c_alias_ij.GetMayExpr());
                zdst_must.push_back(c_alias_ij.GetMustExpr());
            }
        }

        // TODO: avoid substitution of unimportant locations like average instructions
        AbstractStore result_store = called_summary.store;
        for (auto& [loc_src, pt_map] : result_store)
        {
            for (auto& [loc_target, constraint] : pt_map)
            {
                // skip literal constraints
                if (!constraint.IsTopLiteral() && !constraint.IsBottomLiteral())
                {
                    z3::expr new_may  = constraint.GetMayExpr().substitute(zsrc, zdst_may);
                    z3::expr new_must = constraint.GetMustExpr().substitute(zsrc, zdst_must);
                    constraint        = Constraint{new_may, new_must};
                }
            }
        }

#ifdef HEAP_ANALYSIS_DEBUG_MODE
        fmt::print("[Constraint mapping]\n");
        for (int i = 0; i < zsrc.size(); ++i)
        {
            if (zdst_may == zdst_must)
            {
                fmt::print("{} <-> {{{}}}\n", zsrc[i].to_string(), zdst_must[i].to_string());
            }
            else
            {
                fmt::print("{}: {{{}, {}}}\n", zsrc[i].to_string(), zdst_may[i].to_string(),
                           zdst_must[i].to_string());
            }
        }
#endif

        return result_store;
    }

    AbstractExecution::ArgParamMappingLookup
    AbstractExecution::ConstructArgParamMappingLookup(const FunctionSummary& called_summary,
                                                      const std::vector<const llvm::Value*>& inputs)
    {
        // parameter-space -> argument-space
        unordered_map<LocationVar, PointToMap> loc_mapping_pa;
        // argument-space -> parameter-space
        unordered_map<LocationVar, PointToMap> loc_mapping_ap;

        // buffer of argument-space locations to be mapped
        // constraint should be an accumulation of constraint in the path from reg to loc
        deque<pair<LocationVar, Constraint>> loc_buffer_a;
        // buffer of pointed locations of current location under analysis
        // constraint should be an accumulation of constraint in the path from reg to loc
        deque<pair<LocationVar, Constraint>> loc_pointed_buffer_a;

        for (int i = 0; i < called_summary.inputs.size(); ++i)
        {
            const Value* input_param = called_summary.inputs[i];
            const Value* input_arg   = inputs[i];

            // initialize buffer
            loc_buffer_a.clear();
            loc_pointed_buffer_a.clear();
            for (const auto& [loc_pointed_a, constraint] : ctx_->LookupRegFile(input_arg))
            {
                loc_buffer_a.push_back(pair{loc_pointed_a, constraint});
            }

            // bfs to construct mappings
            int ptr_level = GetPointerNestLevel(input_param->getType());
            for (int deref_level = 0; deref_level <= ptr_level; ++deref_level)
            {
                LocationVar loc_p = LocationVar::FromRuntimeMemory(input_param, deref_level);

                assert(loc_pointed_buffer_a.empty());
                while (!loc_buffer_a.empty())
                {
                    auto [loc_a, constraint] = move(loc_buffer_a.front());
                    loc_buffer_a.pop_front();

                    // collect pointed locations of loc_a
                    auto it_pt_map_a = store_.find(loc_a);
                    if (it_pt_map_a != store_.end())
                    {
                        for (const auto& [loc_pointed_a, pointed_constraint] : it_pt_map_a->second)
                        {
                            loc_pointed_buffer_a.push_back(
                                pair{loc_pointed_a, constraint && pointed_constraint});
                        }
                    }

                    // save mappings
                    Constraint& c_pa = loc_mapping_pa[loc_p][loc_a];
                    Constraint& c_ap = loc_mapping_ap[loc_a][loc_p];
                    c_pa             = c_pa || constraint;
                    c_ap             = c_ap || constraint;
                }

                // reuse buffer
                swap(loc_buffer_a, loc_pointed_buffer_a);
            }
        }

#ifdef HEAP_ANALYSIS_DEBUG_MODE
        fmt::print("[Location mapping]\n");
        for (const auto& [loc_p, eq_map] : loc_mapping_pa)
        {
            fmt::print("| {}\n", loc_p);
            for (const auto& [loc_a, eq_constraint] : eq_map)
            {
                fmt::print("  => {} ? {}\n", loc_a, eq_constraint);
            }
        }
#endif

        return ArgParamMappingLookup{.pa = move(loc_mapping_pa), .ap = move(loc_mapping_ap)};
    }

    void AbstractExecution::MergeInvocationStore(const llvm::Instruction* reg,
                                                 const FunctionSummary& called_summary,
                                                 AbstractStore result_store,
                                                 ArgParamMappingLookup loc_mapping)
    {
        // merge locations passed in as arguments
        //
        for (const auto& [loc_a, eq_map] : loc_mapping.ap)
        {
            Constraint pass_in_constraint{false};
            PointToMap new_pt_map;

            // case 1: location is passed into callee
            for (const auto& [loc_p, eq_constraint] : eq_map)
            {
                pass_in_constraint = pass_in_constraint || eq_constraint;

                for (const auto& [loc_pointed_p, pt_constraint] : result_store[loc_p])
                {
                    assert(loc_pointed_p.Tag() != LocationTag::Register);

                    // under eq_constraint, loc_a <=> loc_p
                    // under pt_constraint, loc_p -> loc_pointed_p
                    if (loc_pointed_p.Tag() == LocationTag::Dynamic)
                    {
                        // having tag Dynamic
                        // actual location defined in caller's context, and passed into callee

                        // find the original location defined in caller
                        for (const auto& [loc_pointed_a, mapping_constraint] :
                             loc_mapping.pa.at(loc_pointed_p))
                        {
                            // under mapping_constraint, loc_pointed_p <=> loc_pointed_a
                            AddPointToEdge(new_pt_map, loc_pointed_a,
                                           eq_constraint && pt_constraint && mapping_constraint);
                        }
                    }
                    else
                    {
                        // having tag Alloc/Value
                        // actual location defined in callee's context
                        LocationVar new_loc = ctx_->RelabelLocation(loc_pointed_p, reg);
                        if (loc_pointed_p.CallPoint() != new_loc.CallPoint())
                        {
                            AddPointToEdge(new_pt_map, new_loc, eq_constraint && pt_constraint);
                        }
                        else
                        {
                            // TODO: also to weaken edges from new_loc, bugfix!!!
                            AddPointToEdge(new_pt_map, new_loc,
                                           (eq_constraint && pt_constraint).Weaken());
                        }
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
            store_[loc_a] = move(new_pt_map);
        }

        // merge return value
        //
        const Value* ret_val   = called_summary.return_inst->getReturnValue();
        PointToMap& new_pt_map = ctx_->LookupRegFile(reg);
        new_pt_map.clear();
        if (ret_val != nullptr)
        {
            LocationVar loc_ret = LocationVar::FromRegister(ret_val);

            for (const auto& [loc_pointed_p, pt_constraint] : result_store[loc_ret])
            {
                assert(loc_pointed_p.Tag() != LocationTag::Register);

                if (loc_pointed_p.Tag() == LocationTag::Dynamic)
                {
                    // having tag Dynamic
                    // actual location defined in caller's context, and passed into callee

                    // find the original location defined in caller
                    for (const auto& [loc_pointed_a, mapping_constraint] :
                         loc_mapping.pa.at(loc_pointed_p))
                    {
                        // under mapping_constraint, loc_pointed_p <=> loc_pointed_a
                        AddPointToEdge(new_pt_map, loc_pointed_a,
                                       pt_constraint && mapping_constraint);
                    }
                }
                else
                {
                    // having tag Alloc/Value
                    // actual location defined in callee's context
                    LocationVar new_loc = ctx_->RelabelLocation(loc_pointed_p, reg);
                    if (loc_pointed_p.CallPoint() != new_loc.CallPoint())
                    {
                        AddPointToEdge(new_pt_map, new_loc, pt_constraint);
                    }
                    else
                    {
                        // TODO: also to weaken edges from new_loc, bugfix!!!
                        AddPointToEdge(new_pt_map, new_loc, pt_constraint.Weaken());
                    }
                }
            }
        }
    }

    // TODO: move explicit z3 calls into constraint module?
    // TODO: copy some value location into caller's context as well
    void AbstractExecution::DoInvoke(const llvm::Instruction* reg,
                                     const FunctionSummary& called_summary,
                                     const std::vector<const llvm::Value*>& inputs)
    {
        // step 1: rewrite constraint terms
        //
        // we want to convert alias constraint from callee's context into call sites'
        // say in invocation f(a1, a2, ...), constraint variables are x1, x2, ...
        // term alias(xi, xj) should be translated into alias(ai, aj)
        AbstractStore result_store = ExtractStoreToCurrentContext(called_summary, inputs);

        // step 2: compute mappings of location variables
        //
        // build two-way mapping
        // for each pi --> *pi --> ... --> **pi
        //          |c      |c'              |c''
        //          ai --> *ai --> ... --> **ai
        ArgParamMappingLookup loc_mapping = ConstructArgParamMappingLookup(called_summary, inputs);

        // step 3: merge callee's heap into current execution
        //
        MergeInvocationStore(reg, called_summary, move(result_store), move(loc_mapping));
    }

    void AbstractExecution::DoLoad(const llvm::Instruction* reg, const llvm::Value* reg_ptr)
    {
        // translate alias
        reg_ptr = ctx_->TranslateAliasReg(reg_ptr);

        // find register to update
        PointToMap& pt_map = ctx_->LookupRegFile(reg);
        pt_map.clear();

        const PointToMap& ptr_loc_pt_map = ctx_->LookupRegFile(reg_ptr);
        for (const auto& [ptr, ptr_constraint] : ptr_loc_pt_map)
        {
            if (auto it = store_.find(ptr); it != store_.end())
            {
                for (const auto& [val, val_constraint] : it->second)
                {
                    AddPointToEdge(pt_map, val, ptr_constraint && val_constraint);
                    // fmt::print("  add edge {} ? [ptr:{}; val: {}]\n", val, ptr_constraint,
                    // val_constraint);
                }
            }
        }
    }

    void AbstractExecution::DoStore(const llvm::Value* reg_val, const llvm::Value* reg_ptr)
    {
        // translate alias
        reg_val = ctx_->TranslateAliasReg(reg_val);
        reg_ptr = ctx_->TranslateAliasReg(reg_ptr);

        // find register to update
        const PointToMap& val_loc_pt_map = ctx_->LookupRegFile(reg_val);
        const PointToMap& ptr_loc_pt_map = ctx_->LookupRegFile(reg_ptr);
        for (const auto& [ptr, ptr_constraint] : ptr_loc_pt_map)
        {
            PointToMap& ptr_pt_map = store_[ptr];

            // update edges before store: case value not overwritten
            for (auto& [old_val, old_val_constraint] : ptr_pt_map)
            {
                old_val_constraint = !ptr_constraint && old_val_constraint;
            }

            // add edges after store: case value written
            for (const auto& [val, val_constraint] : val_loc_pt_map)
            {
                AddPointToEdge(ptr_pt_map, val, ptr_constraint && val_constraint);
            }
        }
    }
} // namespace mh
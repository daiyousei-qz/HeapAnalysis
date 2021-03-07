#include "execution.h"
#include "analysis.h"
#include <deque>

using namespace std;
using namespace llvm;

namespace mh
{
    void AbstractExecution::DoAssign(const llvm::Instruction* reg, AbstractLocation loc)
    {
        UpdateRegFile(reg, PointToMap{{loc, Constraint{true}}});
    }

    void AbstractExecution::DoAlloc(const llvm::Instruction* reg, bool summary)
    {
        AbstractLocation loc = AbstractLocation::FromAllocation(reg);
        if (summary)
        {
            UpdateRegFile(reg, PointToMap{{loc, Constraint{true}.Weaken()}});
        }
        else
        {
            UpdateRegFile(reg, PointToMap{{loc, Constraint{true}}});
        }

        // assign null on allocation
        PointToMap& ptr_pt_map = store_[loc];
        if (ptr_pt_map.empty())
        {
            ptr_pt_map.insert(pair{AbstractLocation::FromProgramValue(nullptr), Constraint{true}});
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

    void AbstractExecution::DoAssignPhi(const llvm::Instruction* reg,
                                        const llvm::User::const_op_range val_range)
    {
        PointToMap pt_map_reg;

        int num_vals = 0;
        unordered_map<AbstractLocation, int> num_insert;
        for (const llvm::Value* val : val_range)
        {
            num_vals += 1;

            const PointToMap& pt_map_val = ctx_->LookupRegFile(val);
            for (const auto& [loc, c] : pt_map_val)
            {
                num_insert[loc] += 1;
                if (auto it = pt_map_reg.find(loc); it != pt_map_reg.end())
                {
                    it->second = it->second.Combine(c);
                }
                else
                {
                    pt_map_reg.insert_or_assign(loc, c);
                }
            }
        }

        for (const auto& [loc, n] : num_insert)
        {
            if (n < num_vals)
            {
                Constraint& c = pt_map_reg[loc];

                c = c.Weaken();
            }
        }

        UpdateRegFile(reg, move(pt_map_reg));
    }

    // TODO: move explicit z3 calls into constraint module?
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
                for (const auto& [loc_target, c_i] : input_pt_map_i)
                {
                    if (auto it = input_pt_map_j.find(loc_target); it != input_pt_map_j.end())
                    {
                        const Constraint& c_j = it->second;

                        // under c_i, reg_inputs[i] points to loc_target_i
                        // under c_j, reg_inputs[j] points to loc_target_i
                        // so under c_i && c_j may reg_inputs[i] and reg_inputs[j] alias
                        c_alias_ij = c_alias_ij || (c_i && c_j);
                    }
                }

                c_alias_ij.Simplify();

                zsrc.push_back(SmtProvider::Current().CreateAliasExpr(i, j));
                zdst_may.push_back(c_alias_ij.GetMayExpr());
                zdst_must.push_back(c_alias_ij.GetMustExpr());
            }
        }

#ifdef HEAP_ANALYSIS_DEBUG_MODE
        // fmt::print("[Constraint mapping]\n");
        // for (int i = 0; i < zsrc.size(); ++i)
        // {
        //     fmt::print("{} <-> {}\n", zsrc[i].to_string(), Constraint{zdst_may[i],
        //     zdst_must[i]});
        // }
#endif

        AbstractStore result_store;
        if (called_summary.return_inst != nullptr)
        {
            const Value* ret_val = called_summary.return_inst->getReturnValue();
            for (const auto& [loc_src, pt_map] : called_summary.store)
            {
                if (loc_src.Tag() == LocationTag::Register && loc_src.Definition() != ret_val)
                {
                    // don't copy non-return registers as they are not exposed anyway
                    continue;
                }

                PointToMap& new_pt_map = result_store[loc_src];
                new_pt_map.reserve(pt_map.size());
                for (const auto& [loc_target, constraint] : pt_map)
                {
                    z3::expr new_may       = constraint.GetMayExpr().substitute(zsrc, zdst_may);
                    z3::expr new_must      = constraint.GetMustExpr().substitute(zsrc, zdst_must);
                    new_pt_map[loc_target] = Constraint{new_may, new_must};
                }
            }
        }

        return result_store;
    }

    AbstractExecution::ArgParamMappingLookup
    AbstractExecution::ConstructArgParamMappingLookup(const FunctionSummary& called_summary,
                                                      const std::vector<const llvm::Value*>& inputs)
    {
        // parameter-space -> argument-space
        unordered_map<AbstractLocation, PointToMap> loc_mapping_pa;
        // argument-space -> parameter-space
        unordered_map<AbstractLocation, PointToMap> loc_mapping_ap;

        // buffer of argument-space locations to be mapped
        // constraint should be an accumulation of constraint in the path from reg to loc
        deque<pair<AbstractLocation, Constraint>> loc_buffer_a;
        // buffer of pointed locations of current location under analysis
        // constraint should be an accumulation of constraint in the path from reg to loc
        deque<pair<AbstractLocation, Constraint>> loc_pointed_buffer_a;

        for (int i = 0; i < called_summary.inputs.size(); ++i)
        {
            const Value* input_param = called_summary.inputs[i];
            const Value* input_arg   = inputs[i];

            // initialize buffer
            loc_buffer_a.clear();
            loc_pointed_buffer_a.clear();
            for (const auto& [loc_a, constraint] : ctx_->LookupRegFile(input_arg))
            {
                loc_buffer_a.push_back(pair{loc_a, constraint});
            }

            // bfs to construct mappings
            int ptr_level = GetPointerNestLevel(input_param->getType());
            for (int deref_level = 0; deref_level <= ptr_level; ++deref_level)
            {
                AbstractLocation loc_p =
                    AbstractLocation::FromRuntimeMemory(input_param, deref_level);

                assert(loc_pointed_buffer_a.empty());
                while (!loc_buffer_a.empty())
                {
                    auto [loc_a, constraint] = move(loc_buffer_a.front());
                    loc_buffer_a.pop_front();

                    // collect pointed locations of loc_a
                    if (auto it_pt_map_a = store_.find(loc_a); it_pt_map_a != store_.end())
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
        // fmt::print("[Location mapping]\n");
        // for (auto& [loc_p, eq_map] : loc_mapping_pa)
        // {
        //     fmt::print("| {}\n", loc_p);
        //     for (auto& [loc_a, eq_constraint] : eq_map)
        //     {
        //         eq_constraint.Simplify();
        //         fmt::print("  => {} ? {}\n", loc_a, eq_constraint);
        //     }
        // }
#endif

        return ArgParamMappingLookup{.pa = move(loc_mapping_pa), .ap = move(loc_mapping_ap)};
    }

    void AbstractExecution::MergeInvocationStore(const llvm::Instruction* reg,
                                                 const FunctionSummary& called_summary,
                                                 AbstractStore result_store,
                                                 ArgParamMappingLookup loc_mapping)
    {
        // [ (loc_a, loc_p, weaken_to_summary) ]
        deque<tuple<AbstractLocation, AbstractLocation, bool>> loc_import_worklist;
        unordered_set<AbstractLocation> loc_import_workset;

        auto merge_param_pt_map = [&](PointToMap& target_pt_map, AbstractLocation loc_p,
                                      Constraint c_mapping_ptr) {
            for (const auto& [loc_pointed_p, c_point_to] : result_store[loc_p])
            {
                assert(loc_pointed_p.Tag() != LocationTag::Register);

                // under c_mapping_ptr, loc_a <=> loc_p
                // under c_point_to, loc_p -> loc_pointed_p
                if (loc_pointed_p.Tag() == LocationTag::Dynamic)
                {
                    // having tag Dynamic
                    // actual location defined in caller's context, and passed into callee

                    // find the original location defined in caller if any

                    auto it = loc_mapping.pa.find(loc_pointed_p);
                    if (it == loc_mapping.pa.end())
                    {
                        // loc_pointed_p not provided, typically null is passed in
                        continue;
                    }

                    for (const auto& [loc_pointed_a, c_mapping_val] : it->second)
                    {
                        // under c_mapping_val, loc_pointed_p <=> loc_pointed_a
                        AddPointToEdge(target_pt_map, loc_pointed_a,
                                       c_mapping_ptr && c_point_to && c_mapping_val);
                    }
                }
                else if (loc_pointed_p.Tag() == LocationTag::Value)
                {
                    // having tag Value

                    // we copy the location to overapproximate the terms
                    AddPointToEdge(target_pt_map, loc_pointed_p, c_mapping_ptr && c_point_to);
                }
                else
                {
                    // having tag Alloc
                    // actual location defined in callee's context

                    AbstractLocation new_loc = ctx_->RelabelLocation(loc_pointed_p, reg);
                    bool weaken_to_summary   = loc_pointed_p.CallPoint() == new_loc.CallPoint();

                    Constraint c = c_mapping_ptr && c_point_to;
                    if (weaken_to_summary)
                    {
                        c = c.Weaken();
                    }
                    AddPointToEdge(target_pt_map, new_loc, c);

                    if (loc_import_workset.find(new_loc) == loc_import_workset.end())
                    {
                        loc_import_worklist.push_back({new_loc, loc_pointed_p, weaken_to_summary});
                        loc_import_workset.insert(new_loc);
                    }
                }
            }
        };

        // merge locations passed in as arguments
        //
        for (const auto& [loc_a, eq_map] : loc_mapping.ap)
        {
            if (loc_a.Tag() == LocationTag::Value)
            {
                continue;
            }

            // constraint if the location is actually passed into the callee
            Constraint c_pass_in{false};
            PointToMap new_pt_map;

            // case 1: location is passed into callee
            for (const auto& [loc_p, c_mapping_ptr] : eq_map)
            {
                c_pass_in = c_pass_in || c_mapping_ptr;

                merge_param_pt_map(new_pt_map, loc_p, c_mapping_ptr);
            }

            // case2: location isn't passed into callee
            for (const auto& [loc_pointed_a, constraint] : store_[loc_a])
            {
                AddPointToEdge(new_pt_map, loc_pointed_a, !c_pass_in && constraint);
            }

#ifdef HEAP_ANALYSIS_DEBUG_MODE
            // if (!new_pt_map.empty())
            // {
            //     fmt::print("rewriting ptmap of {}\n", loc_a);
            //     for (auto& [loc_target, constraint] : new_pt_map)
            //     {
            //         constraint.Simplify();
            //         fmt::print("  -> {} ? {}\n", loc_target, constraint);
            //     }
            // }
#endif

            // track loc_a for update
            // TODO: narrow down for more precise constraint where loc_a is actually written
            ctx_->update_hitory_[reg][loc_a] = c_pass_in;

            // update point-to relations from loc_a
            MarkLocationUpdate(loc_a);
            store_[loc_a] = move(new_pt_map);
        }

        // merge return value
        //
        if (called_summary.return_inst != nullptr)
        {
            const Value* ret_val = called_summary.return_inst->getReturnValue();
            if (ret_val != nullptr)
            {
                PointToMap new_pt_map;
                merge_param_pt_map(new_pt_map, AbstractLocation::FromRegister(ret_val),
                                   Constraint{true});

                UpdateRegFile(reg, new_pt_map);
            }
        }

        // merge imported locations
        //
        while (!loc_import_worklist.empty())
        {
            auto [loc_a, loc_p, weaken_to_summary] = loc_import_worklist.front();
            loc_import_worklist.pop_front();

            PointToMap new_pt_map;
            merge_param_pt_map(new_pt_map, loc_p,
                               weaken_to_summary ? Constraint{true}.Weaken() : Constraint{true});

            // track loc_a for update
            ctx_->update_hitory_[reg][loc_a] = Constraint{true};

            // update point-to relations from loc_a
            MarkLocationUpdate(loc_a);
            store_[loc_a] = move(new_pt_map);
        }
    }

    // TODO: remove this
    void DebugPrint(const AbstractStore& store);

    // TODO: copy some value location into caller's context as well
    void AbstractExecution::DoInvoke(const llvm::Instruction* reg,
                                     const FunctionSummary& called_summary,
                                     const std::vector<const llvm::Value*>& inputs)
    {
        // TODO: remove workaround
        if (called_summary.func->isDeclaration())
        {
            return;
        }

        ctx_->update_hitory_[reg].clear();

        // step 1: rewrite constraint terms
        //
        // we want to convert alias constraint from callee's context into call sites'
        // say in invocation f(a1, a2, ...), constraint variables are x1, x2, ...
        // term alias(xi, xj) should be translated into alias(ai, aj)
        AbstractStore result_store = ExtractStoreToCurrentContext(called_summary, inputs);

#ifdef HEAP_ANALYSIS_DEBUG_MODE
        // NormalizeStore(ctx_->Solver(), result_store);
        // fmt::print("Instantiation:");
        // DebugPrint(result_store);
#endif

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

        PointToMap pt_map_reg;
        const PointToMap& pt_map_ptr = ctx_->LookupRegFile(reg_ptr);
        for (const auto& [ptr, ptr_constraint] : pt_map_ptr)
        {
            if (auto it = store_.find(ptr); it != store_.end())
            {
                for (const auto& [val, val_constraint] : it->second)
                {
                    AddPointToEdge(pt_map_reg, val, ptr_constraint && val_constraint);
                }
            }
        }

        UpdateRegFile(reg, pt_map_reg);
    }

    void AbstractExecution::DoStore(const llvm::Value* reg_val, const llvm::Value* reg_ptr)
    {
        // translate alias
        reg_val = ctx_->TranslateAliasReg(reg_val);
        reg_ptr = ctx_->TranslateAliasReg(reg_ptr);

        // find register to update
        const PointToMap& pt_map_val = ctx_->LookupRegFile(reg_val);
        const PointToMap& pt_map_ptr = ctx_->LookupRegFile(reg_ptr);
        for (const auto& [ptr, ptr_constraint] : pt_map_ptr)
        {
            MarkLocationUpdate(ptr);

            PointToMap& pt_map_ptr_deref = store_[ptr];

            // update edges before store: case value not overwritten
            for (auto& [old_val, old_val_constraint] : pt_map_ptr_deref)
            {
                old_val_constraint = !ptr_constraint && old_val_constraint;
            }

            // add edges after store: case value written
            for (const auto& [val, val_constraint] : pt_map_val)
            {
                AddPointToEdge(pt_map_ptr_deref, val, ptr_constraint && val_constraint);
            }
        }
    }

    bool AbstractExecution::TestStoreUpdate(const AbstractStore& store_old)
    {
        if (reg_update_)
        {
            return true;
        }

        for (const auto& loc : important_loc_)
        {
            static PointToMap empty_pt_map;

            auto it = store_old.find(loc);

            const PointToMap& pt_map_old = it != store_old.end() ? it->second : empty_pt_map;
            if (!EqualPointToMap(ctx_->Solver(), store_.at(loc), pt_map_old))
            {
                return true;
            }
        }

        return false;

        // return !EqualAbstractStore(ctx_->Solver(), store_, store_old);
    }

    void AbstractExecution::UpdateRegFile(const llvm::Value* reg, PointToMap pt_map)
    {
        bool update = ctx_->UpdateRegFile(reg, std::move(pt_map), reg_update_);
        reg_update_ = reg_update_ || update;
    }
} // namespace mh
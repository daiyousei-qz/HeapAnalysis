#pragma once
#include "utils.h"
#include "z3++.h"
#include <set>

namespace mh
{
    // TODO: support multi-threading
    class SmtProvider
    {
    private:
        z3::context ctx_;
        std::vector<z3::expr> alias_locs_;

        SmtProvider() = default;

    public:
        static SmtProvider& Current() noexcept
        {
            static thread_local SmtProvider provider;
            return provider;
        }

    public:
        z3::context& Context() noexcept { return ctx_; }

        z3::expr TopConstraint() { return ctx_.bool_val(true); }
        z3::expr BottomConstraint() { return ctx_.bool_val(false); }

        z3::expr AliasLocation(int i) { return alias_locs_.at(i); }

        std::vector<z3::expr> GetInputLocations(int n_args)
        {
            ReserveAliasVariables(n_args);

            return std::vector<z3::expr>{alias_locs_.begin(), alias_locs_.begin() + n_args};
        }

        void ReserveAliasVariables(int n_args)
        {
            while (n_args > alias_locs_.size())
            {
                auto name = "x" + std::to_string(alias_locs_.size());
                alias_locs_.push_back(ctx_.int_const(name.c_str()));
            }
        }

        z3::expr CreateAliasExpr(int loc_i, int loc_j)
        {
            if (loc_i < loc_j)
            {
                std::swap(loc_i, loc_j);
            }
            assert(loc_i < alias_locs_.size());

            if (loc_i == loc_j)
            {
                return ctx_.bool_val(true);
            }
            else
            {
                return alias_locs_[loc_i] == alias_locs_[loc_j];
            }
        }

        z3::expr CreateNoAliasExpr(int loc_i, int loc_j) { return !CreateAliasExpr(loc_i, loc_j); }
    };

    // TODO: try avoid redundent context storage
    class Constraint
    {
    private:
        z3::expr may;
        z3::expr must;

    public:
        Constraint() : Constraint(false) {}
        Constraint(bool value)
            : may(value ? SmtProvider::Current().TopConstraint()
                        : SmtProvider::Current().BottomConstraint()),
              must(value ? SmtProvider::Current().TopConstraint()
                         : SmtProvider::Current().BottomConstraint())
        {
        }
        Constraint(z3::expr expr) : may(expr), must(expr) {}
        Constraint(z3::expr expr_may, z3::expr expr_must) : may(expr_may), must(expr_must) {}

        bool HasSameMayMust() const noexcept
        {
            return static_cast<Z3_ast>(may) == static_cast<Z3_ast>(must);
        }

        bool IsTopLiteral() const noexcept { return HasSameMayMust() && must.is_true(); }
        bool IsBottomLiteral() const noexcept { return HasSameMayMust() && must.is_false(); }

        // upper bound, weakest constraint
        z3::expr GetMayExpr() const noexcept { return may; }
        // lower bound, strongest constraint
        z3::expr GetMustExpr() const noexcept { return must; }

        // TODO: need a better name
        Constraint Weaken() const noexcept
        {
            return Constraint{may, SmtProvider::Current().BottomConstraint()};
        }

        Constraint Combine(const Constraint& c) const noexcept
        {
            return Constraint{may || c.may, must && c.must};
        }

        void Simplify() noexcept
        {
            if (HasSameMayMust())
            {
                may = must = must.simplify();
            }
            else
            {
                may  = may.simplify();
                must = must.simplify();
            }
        }

        std::string ToString() const
        {
            if (HasSameMayMust())
            {
                return fmt::format("{{{}}}", must.to_string());
            }
            else
            {
                return fmt::format("{{{}, {}}}", may.to_string(), must.to_string());
            }
        }

        friend Constraint operator&&(const Constraint& lhs, const Constraint& rhs)
        {
            return Constraint{lhs.may && rhs.may, lhs.must && rhs.must};
        }
        friend Constraint operator||(const Constraint& lhs, const Constraint& rhs)
        {
            return Constraint{lhs.may || rhs.may, lhs.must || rhs.must};
        }
        friend Constraint operator!(const Constraint& c) { return Constraint{!c.must, !c.may}; }
    };

    class ConstraintSolver
    {
    private:
        SmtProvider* provider = &SmtProvider::Current();
        z3::solver solver     = z3::solver{SmtProvider::Current().Context()};

        int num_inputs_;
        std::vector<z3::expr> input_loc_vars_;
        std::vector<bool> alias_rej_list_;

    public:
        ConstraintSolver(int num_inputs)
        {
            assert(num_inputs >= 0);
            this->num_inputs_     = num_inputs;
            this->input_loc_vars_ = provider->GetInputLocations(num_inputs_);
            this->alias_rej_list_.resize(num_inputs * num_inputs, false);

            for (int i = 1; i < num_inputs; ++i)
            {
                this->solver.add(input_loc_vars_[i] >= input_loc_vars_[i - 1]);
            }
        }

        // test if a constraint could hold
        bool TestSatisfiability(const Constraint& c);

        // test if a constraint always holds
        bool TestValidity(const Constraint& c);

        // test if c0 => c1
        bool TestImplication(const Constraint& c0, const Constraint& c1);

        // test if c0 <=> c1
        bool TestEquivalence(const Constraint& c0, const Constraint& c1);

        // test if two input x_i and x_j could alias (not rejected)
        bool TestAlias(int i, int j);

        // assuming i != j
        // reject alias(i, j), i.e. inputs x_i and x_j can't alias
        void RejectAlias(int i, int j);

        // assuming i >= j
        // make constraint c under which input x_i points to location v_j, which requires
        // - for all k < j, x_i and x_k don't alias
        // - x_i and x_j alias
        Constraint MakeAliasConstraint(int i, int j);

    private:
        bool TestSatisfiablityAux(z3::expr expr) { return solver.check(1, &expr) == z3::sat; }
        bool TestValidityAux(z3::expr expr)
        {
            z3::expr c_expr = !expr;
            return solver.check(1, &c_expr) == z3::unsat;
        }
        bool TestImplicationAux(z3::expr e0, z3::expr e1)
        {
            return TestValidityAux(z3::implies(e0, e1));
        }
        bool TestEquivalenceAux(z3::expr e0, z3::expr e1) { return TestValidityAux(e0 == e1); }
    };
} // namespace mh

template <> struct fmt::formatter<mh::Constraint> : fmt::formatter<std::string_view>
{
    // parse is inherited from formatter<string_view>.
    template <typename FormatContext> auto format(const mh::Constraint& c, FormatContext& ctx)
    {
        return formatter<std::string_view>::format(c.ToString(), ctx);
    }
};

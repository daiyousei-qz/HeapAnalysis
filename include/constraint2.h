#pragma once
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

        void ReserveAliasVariables(int n_args)
        {
            while (n_args > alias_locs_.size())
            {
                auto name = std::to_string(alias_locs_.size());
                alias_locs_.push_back(ctx_.int_const(name.c_str()));
            }
        }

    public:
        static SmtProvider& Current() noexcept
        {
            // TODO: make it thread_local?
            // static thread_local SmtProvider provider;
            static SmtProvider provider;
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
    };

    class Constraint
    {
        // TODO: make sure provider is unchanged on operations
    private:
        enum class State
        {
            Top,
            Bottom,
            Expr,
        };

        SmtProvider* provider = &SmtProvider::Current();

        State state = State::Bottom;
        Z3_ast may  = nullptr;
        Z3_ast must = nullptr;

    public:
        Constraint() {}
        Constraint(bool value)
        {
            if (value)
            {
                state = State::Top;
                may = must = provider->TopConstraint();
            }
            else
            {
                state = State::Bottom;
                may = must = provider->BottomConstraint();
            }
        }
        Constraint(Z3_ast ast)
        {
            state = State::Expr;
            may = must = ast;
        }
        Constraint(Z3_ast ast_may, Z3_ast ast_must)
        {
            state = State::Expr;
            may   = ast_may;
            must  = ast_must;
        }

        Constraint(const Constraint&) = default;
        Constraint(Constraint&&)      = default;
        Constraint& operator=(const Constraint&) = default;
        Constraint& operator=(Constraint&&) = default;

        bool IsExpr() const noexcept { return state == State::Expr; }
        bool IsTopLiteral() const noexcept { return state == State::Top; }
        bool IsBottomLiteral() const noexcept { return state == State::Bottom; }

        bool HasMayExpr() const noexcept { return may != must; }

        // upper bound, weakest constraint
        z3::expr GetMayExpr() const noexcept
        {
            assert(IsExpr());
            return z3::expr{provider->Context(), may};
        }
        // lower bound, strongest constraint
        z3::expr GetMustExpr() const noexcept
        {
            assert(IsExpr());
            return z3::expr{provider->Context(), must};
        }

        // TODO: need a better name
        Constraint Weaken() const noexcept
        {
            if (state == State::Top)
            {
                return Constraint{provider->TopConstraint(), provider->BottomConstraint()};
            }
            if (state == State::Bottom)
            {
                return *this;
            }

            return Constraint{may, provider->BottomConstraint()};
        }

        Constraint Combine(const Constraint& c) const noexcept
        {
            if (state == State::Top)
            {
                if (c.state == State::Top)
                {
                    return Constraint{true};
                }
                else if (c.state == State::Bottom)
                {
                    return Constraint{provider->TopConstraint(), provider->BottomConstraint()};
                }
            }
            if (state == State::Bottom)
            {
                if (c.state == State::Bottom)
                {
                    return Constraint{false};
                }
                else if (c.state == State::Top)
                {
                    return Constraint{provider->TopConstraint(), provider->BottomConstraint()};
                }
            }

            Z3_context ctx = provider->Context();
            Z3_ast mays[]  = {may, c.may};
            Z3_ast musts[] = {must, c.must};

            return Constraint{Z3_mk_or(ctx, 2, mays), Z3_mk_and(ctx, 2, musts)};
        }

        void Simplify() noexcept
        {
            // TODO: make sure provider is unchanged
            if (state != State::Expr)
            {
                return;
            }

            if (may == must)
            {
                may = must = Z3_simplify(provider->Context(), must);
            }
            else
            {
                may  = Z3_simplify(provider->Context(), may);
                must = Z3_simplify(provider->Context(), must);
            }
        }

        friend Constraint operator&&(const Constraint& lhs, const Constraint& rhs)
        {
            if (lhs.state == State::Bottom || rhs.state == State::Bottom)
            {
                return Constraint{false};
            }
            else if (lhs.state == State::Top)
            {
                return rhs;
            }
            else if (rhs.state == State::Top)
            {
                return lhs;
            }
            else
            {
                Z3_context ctx = lhs.provider->Context();
                Z3_ast mays[]  = {lhs.may, rhs.may};
                Z3_ast musts[] = {lhs.must, rhs.must};

                return Constraint{Z3_mk_and(ctx, 2, mays), Z3_mk_and(ctx, 2, musts)};
            }
        }
        friend Constraint operator||(const Constraint& lhs, const Constraint& rhs)
        {
            // TODO: make sure provider is unchanged
            if (lhs.state == State::Top || rhs.state == State::Top)
            {
                return Constraint{true};
            }
            else if (lhs.state == State::Bottom)
            {
                return rhs;
            }
            else if (rhs.state == State::Bottom)
            {
                return lhs;
            }
            else
            {
                Z3_context ctx = lhs.provider->Context();
                Z3_ast mays[]  = {lhs.may, rhs.may};
                Z3_ast musts[] = {lhs.must, rhs.must};

                return Constraint{Z3_mk_or(ctx, 2, mays), Z3_mk_or(ctx, 2, musts)};
            }
        }
        friend Constraint operator!(const Constraint& c)
        {
            // TODO: make sure provider is unchanged
            if (c.state == State::Top)
            {
                return Constraint{false};
            }
            else if (c.state == State::Bottom)
            {
                return Constraint{true};
            }
            else if (c.may == c.must)
            {
                return Constraint{Z3_mk_not(c.provider->Context(), c.must)};
            }
            else
            {
                Z3_context ctx = c.provider->Context();
                return Constraint{Z3_mk_not(ctx, c.may), Z3_mk_not(ctx, c.must)};
            }
        }
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

        // test if two constraints are equivalent
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
        bool TestEquivalenceAux(z3::expr e0, z3::expr e1) { return TestValidityAux(e0 == e1); }
    };
} // namespace mh

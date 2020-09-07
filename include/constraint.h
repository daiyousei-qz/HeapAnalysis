#pragma once
#include "z3++.h"
#include "fmt/format.h"
#include <vector>

class SmtProvider
{
private:
    z3::context ctx_;
    std::vector<z3::expr> alias_locs_;

    void ReserveAliasVariables(int n_args)
    {
        while (n_args > alias_locs_.size())
        {
            auto name = fmt::format("x{}", alias_locs_.size());
            alias_locs_.push_back(ctx_.int_const(name.c_str()));
        }
    }
public:
    z3::context& Context() noexcept
    {
        return ctx_;
    }

    const z3::expr& AliasLocation(int i)
    {
        ReserveAliasVariables(i+1);
        
        return alias_locs_[i];
    }

    std::vector<z3::expr> GetInputLocations(int n_args)
    {
        ReserveAliasVariables(n_args);

        return std::vector<z3::expr>{alias_locs_.begin(), alias_locs_.begin()+n_args};
    }
};

struct Constraint
{
    z3::expr body;

    void Simplify()
    {
        body = body.simplify();
    }
};

class ConstraintSolver
{
public:
    ConstraintSolver(std::shared_ptr<SmtProvider> provider)
        : provider_(provider), solver_(provider->Context())
    {
    }

    void Initialize(int n_args)
    {
        assert(n_args >= 0 && input_loc_vars_.empty());

        input_loc_vars_ = provider_->GetInputLocations(n_args);

        for (int i = 1; i < n_args; ++i)
        {
            solver_.add(input_loc_vars_[i] >= input_loc_vars_[i-1]);
        }
    }

    // test if a constraint could hold
    bool TestSatisfiability(const Constraint& c);

    // test if a constraint always holds
    bool TestValidity(const Constraint& c);

    // test if two constraints are equivalent
    bool TestEquivalence(const Constraint& c0, const Constraint& c1);

    Constraint MakeTop();
    Constraint MakeBottom();

    void RejectAlias(int i, int j)
    {
        assert(i != j);
        solver_.add(input_loc_vars_[i] != input_loc_vars_[j]);
    }

    // assuming i >= j
    Constraint MakeAliasConstraint(int i, int j)
    {
        assert(i >= j);

        z3::expr_vector buf{provider_->Context()};
        for (int k = 0; k < j; ++k)
        {
            buf.push_back(input_loc_vars_[i] != input_loc_vars_[k]);
        }

        if (i != j)
        {
            buf.push_back(input_loc_vars_[i] == input_loc_vars_[j]);
        }

        return Constraint{z3::mk_and(buf)};
    }

    const auto& Provider()
    {
        return provider_;
    }

private:
    std::shared_ptr<SmtProvider> provider_;

    z3::solver solver_;
    std::vector<z3::expr> input_loc_vars_;
};

inline Constraint operator&&(const Constraint& lhs, const Constraint& rhs)
{
    return Constraint{lhs.body && rhs.body};
}
inline Constraint operator||(const Constraint& lhs, const Constraint& rhs)
{
    return Constraint{lhs.body || rhs.body};
}
inline Constraint operator!(const Constraint& c)
{
    return Constraint{!c.body};
}
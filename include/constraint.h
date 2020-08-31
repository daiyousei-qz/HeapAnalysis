#pragma once
#include "z3++.h"
#include "fmt/format.h"
#include <vector>

struct Constraint
{
    z3::expr body;

    void Simplify()
    {
        body = body.simplify();
    }
};

class ConstraintEngine
{
public:
    ConstraintEngine()
        : ctx_(), solver_(ctx_)
    { }

    void InitializeInput(int num_input)
    {
        assert(num_input >= 0 && alias_vars.empty());
        
        for (int i = 0; i < num_input; ++i)
        {
            auto name = fmt::format("x{}", i);
            auto xi = ctx_.int_const(name.c_str());

            if (!alias_vars.empty())
            {
                // TODO: should range of xi be confined in [0, num_input)?
                solver_.add(xi >= alias_vars.back());
            }

            alias_vars.push_back(xi);
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
        solver_.add(alias_vars[i] != alias_vars[j]);
    }

    // assuming i >= k
    Constraint MakeAliasConstraint(int i, int k)
    {
        assert(i >= k);

        z3::expr_vector buf{ctx_};
        for (int j = 0; j < k; ++j)
        {
            buf.push_back(alias_vars[i] != alias_vars[j]);
        }

        buf.push_back(alias_vars[i] == alias_vars[k]);

        return Constraint{z3::mk_and(buf)};
    }

private:
    z3::context ctx_;

    std::vector<z3::expr> alias_vars;
    z3::solver solver_;
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
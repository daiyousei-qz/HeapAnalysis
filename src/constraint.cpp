#include "constraint.h"
#include "z3++.h"

bool ConstraintSolver::TestSatisfiability(const Constraint& c)
{
    z3::expr c_expr = c.body;
    return solver_.check(1, &c_expr) == z3::sat;
}

bool ConstraintSolver::TestValidity(const Constraint& c)
{
    z3::expr c_expr = !c.body;
    return solver_.check(1, &c_expr) == z3::unsat;
}

bool ConstraintSolver::TestEquivalence(const Constraint& c0, const Constraint& c1)
{
    auto imply01 = z3::implies(c0.body, c1.body);
    auto imply10 = z3::implies(c1.body, c0.body);
    auto expr    = !(imply01 && imply10);

    return solver_.check(1, &expr) == z3::unsat;
}

Constraint ConstraintSolver::MakeTop() { return Constraint{provider_->Context().bool_val(true)}; }
Constraint ConstraintSolver::MakeBottom()
{
    return Constraint{provider_->Context().bool_val(false)};
}
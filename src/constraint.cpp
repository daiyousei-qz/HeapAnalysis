#include "constraint.h"
#include "z3++.h"

bool ConstraintEngine::TestSatisfiability(const Constraint& c)
{
    auto expr = c.body;
    return solver_.check(1, &expr) == z3::sat;
}

bool ConstraintEngine::TestValidity(const Constraint& c)
{
    auto expr = !c.body;
    return solver_.check(1, &expr) == z3::unsat;
}

bool ConstraintEngine::TestEquivalence(const Constraint& c0, const Constraint& c1)
{
    auto imply01 = z3::implies(c0.body, c1.body);
    auto imply10 = z3::implies(c1.body, c0.body);
    auto expr = !(imply01 && imply10);
    
    return solver_.check(1, &expr) == z3::unsat;
}

Constraint ConstraintEngine::MakeTop()
{
    return Constraint{ ctx_.bool_val(true) };
}
Constraint ConstraintEngine::MakeBottom()
{
    return Constraint{ ctx_.bool_val(false) };
}
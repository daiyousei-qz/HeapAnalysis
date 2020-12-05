#include "constraint2.h"

namespace mh
{
    // test if a constraint could hold
    bool ConstraintSolver::TestSatisfiability(const Constraint& c)
    {
        if (c.IsBottomLiteral())
        {
            return false;
        }
        if (c.IsTopLiteral())
        {
            return true;
        }

        return TestSatisfiablityAux(c.GetMayExpr());
    }

    // test if a constraint always holds
    bool ConstraintSolver::TestValidity(const Constraint& c)
    {
        if (c.IsBottomLiteral())
        {
            return false;
        }
        if (c.IsTopLiteral())
        {
            return true;
        }

        return TestValidityAux(c.GetMustExpr());
    }

    bool ConstraintSolver::TestEquivalence(const Constraint& c0, const Constraint& c1)
    {
        if (c0.HasSameMayMust() != c1.HasSameMayMust())
        {
            return false;
        }

        if (c0.IsBottomLiteral())
        {
            return !TestSatisfiability(c1);
        }
        else if (c0.IsTopLiteral())
        {
            return TestValidity(c1);
        }
        else if (c1.IsBottomLiteral())
        {
            return !TestSatisfiability(c0);
        }
        else if (c1.IsTopLiteral())
        {
            return TestValidity(c0);
        }
        else if (!c0.HasSameMayMust())
        {
            return TestEquivalenceAux(c0.GetMustExpr(), c1.GetMustExpr());
        }
        else
        {
            return TestEquivalenceAux(c0.GetMayExpr(), c1.GetMayExpr()) &&
                   TestEquivalenceAux(c0.GetMustExpr(), c1.GetMustExpr());
        }
    }

    bool ConstraintSolver::TestAlias(int i, int j)
    {
        if (i > j)
        {
            std::swap(i, j);
        }

        return !alias_rej_list_[i * num_inputs_ + j];
    }

    void ConstraintSolver::RejectAlias(int i, int j)
    {
        assert(i != j);
        if (i > j)
        {
            std::swap(i, j);
        }

        if (!alias_rej_list_[i * num_inputs_ + j])
        {
            solver.add(input_loc_vars_[i] != input_loc_vars_[j]);
            alias_rej_list_[i * num_inputs_ + j] = true;
        }
    }

    Constraint ConstraintSolver::MakeAliasConstraint(int i, int j)
    {
        if (!TestAlias(j, i))
        {
            return Constraint{false};
        }

        z3::expr_vector buf{provider->Context()};
        for (int k = 0; k < j; ++k)
        {
            // k < j <= i
            if (TestAlias(k, i))
            {
                buf.push_back(input_loc_vars_[k] != input_loc_vars_[i]);
            }
        }

        if (i != j)
        {
            buf.push_back(input_loc_vars_[j] == input_loc_vars_[i]);
        }

        if (buf.empty())
        {
            return Constraint{true};
        }
        else if (buf.size() == 1)
        {
            return buf[0];
        }
        else
        {
            return Constraint{z3::mk_and(buf)};
        }
    }
} // namespace mh
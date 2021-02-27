// a dummy printf
int printf(const char* fmt, ...) { return 0; }

int isdigit(int code) { return code >= '0' && code <= '9'; }

int get_op_priority(int op)
{
    switch (op)
    {
    case '+':
        return 0;
    case '*':
        return 1;
    default:
        return -1;
    }
}

#define STACK_SIZE 1024

char op_stack[STACK_SIZE];
int op_stack_top = 0;

int eval_stack[STACK_SIZE];
int eval_stack_top = 0;

// assuming valid setup
void evaluate_top()
{
    int lhs    = eval_stack[eval_stack_top - 2];
    int rhs    = eval_stack[eval_stack_top - 1];
    int result = 0;
    switch (op_stack[op_stack_top - 1])
    {
    case '+':
        result = lhs + rhs;
        break;
    case '*':
        result = lhs * rhs;
        break;
    }

    eval_stack[eval_stack_top - 2] = result;
    op_stack_top -= 1;
    eval_stack_top -= 1;
}

int evaluate(const char* expr, int* output)
{
    int acc_parse      = 0;
    int expect_operand = 1;
    for (const char* p = expr; *p != '\0'; ++p)
    {
        if (isdigit(*p))
        {
            acc_parse      = acc_parse * 10 + *p - '0';
            expect_operand = 0;
            continue;
        }

        if (expect_operand || eval_stack_top >= STACK_SIZE)
            return -1;

        eval_stack[eval_stack_top++] = acc_parse;
        acc_parse                    = 0;
        expect_operand               = 1;

        int op_priority = get_op_priority(*p);
        if (op_priority < 0)
            return -1;

        while (op_stack_top > 0 && op_priority <= get_op_priority(op_stack[op_stack_top - 1]))
        {
            evaluate_top();
        }

        op_stack[op_stack_top++] = *p;
    }

    eval_stack[eval_stack_top++] = acc_parse;

    while (op_stack_top > 0)
    {
        evaluate_top();
    }

    *output = eval_stack[0];
    return 0;
}

int main(int argc, char* argv[])
{
    if (argc != 2)
    {
        printf("invalid number of inputs\n");
        return -1;
    }

    int result;
    if (evaluate(argv[1], &result) != 0)
    {
        printf("bad expression\n");
        return -1;
    }

    printf("result: %d\n", result);
    return 0;
}
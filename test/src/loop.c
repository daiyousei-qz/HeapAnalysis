#include "stdatomic.h"


void while_loop(int x)
{
    while (x < 10)
    {
        x += 1;
    }
}

void dowhile_loop(int x)
{
    do
    {
        x += 1;
    } while (x < 10);
}

void atomic_test()
{
    atomic_int counter = 0;
    for (int i = 0; i < 10; ++i)
    {
        atomic_fetch_add(&counter, 1);
    }
}

void goto_test(int x)
{
loop_begin:
    if (x >= 10)
    {
        goto loop_end;
    }
    x += 1;
    if (x == 5)
    {
        goto random_label;
    }
    goto loop_begin;
loop_end:

    x += 10;
    if (x > 10)
    {
random_label:
        x -= 10;
    }
}

int nest_test(int x, int y, int z)
{
    int result = 0;
    for (int i = 0; i < x; ++i)
    {
        if (i % 2 == 1)
        {
            result += i;
            continue;
        }

        for (int j = 0; j < y; ++j)
        {
            for (int k = 0; k < z; ++k)
            {
                result += i * j * k;
            }
        }
    }

    return result;
}


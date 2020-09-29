#include <stdlib.h>

void foo(int* ptr, int x, int y)
{
    if (x > y)
    {
        *ptr = x;
    }
    else
    {
        *ptr = y;
    }
}

int buz(int x, int y)
{
    if (x > y)
    {
        return x;
    }
    else
    {
        return y;
    }
}

// bug for this func
void* bar()
{
    int* p[3];
    for (int i = 0; i < 3; ++i)
    {
        p[i] = (int*)malloc(4);
    }

    return p[2];
}

int sumUpTo(int n)
{
    int result = 0;
    for (int i = 0; i < n; ++i)
    {
        result += i;
    }

    return result;
}
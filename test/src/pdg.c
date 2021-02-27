int f(int* p)
{
    *p = 41;
    *p = 42;
    return *p;
}

int g(int* p, int b)
{
    if (b)
        *p = 41;
    else
        *p = 42;

    return *p;
}

int h(int* p)
{
    g(p, 1);
    f(p);
    return *p;
}
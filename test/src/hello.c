#include <stdlib.h>

void f(int** a, int** b, int* p, int* q)
{
    *a  = p;
    *b  = q;
    **a = 3;
    **b = 4;
}

void g(int** a1, int** a2)
{
    *a1 = malloc(4);
    *a2 = malloc(4);

    int* t1 = *a1;
    *t1     = 7;

    int* t2 = *a2;
    *t2     = 8;

    int* t3 = *a1;
    int t4  = *t3;
}

void h(int** p, int** q, void* t, char* s)
{
    t  = NULL;
    *p = NULL;
    *q = *p + 1;
}

void k(int x)
{
    int a = x + 1;
    int b = a + 1;
}

int global;

int m(int x)
{
    int tmp = global;
    global = x;
    return tmp;
}
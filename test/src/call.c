#include <stdlib.h>

void swap(int* p, int* q)
{
    int tmp = *p;
    *p      = *q;
    *q      = tmp;
}

void do_swap(int* a, int* b) { swap(a, b); }

void do_swap2(int* a, int* b)
{
    swap(a, b);
    swap(a, b);
}

void alloc(int** p) { *p = (int*)malloc(4); }

int add_alloc(int** p, int** q)
{
    alloc(p);
    alloc(q);

    return **p + **q;
}
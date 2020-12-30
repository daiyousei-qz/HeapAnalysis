#include <stdlib.h>

void swap(int* p, int* q)
{
    int tmp = *p;
    *p      = *q;
    *q      = tmp;
}

void do_swap_once(int* a, int* b) { swap(a, b); }

void do_swap_twice(int* a, int* b)
{
    swap(a, b);
    swap(a, b);
}

void do_swap_alias(int* a, int* b) { swap(a, a); }

int* alloc_int(int value)
{
    int* p = (int*)malloc(4);
    *p     = value;
    return p;
}
int* do_alloc_int_42() { return alloc_int(42); }
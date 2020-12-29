#include "stdlib.h"

int fib(int x) { return x < 2 ? 1 : fib(x - 1) + fib(x - 2); }

int ff(int x);
int gg(int x);

int ff(int x) { return x < 0 ? x : gg(x - 1); }
int gg(int x) { return x < 0 ? x : ff(x - 2); }

int* alloc_int_array(int n) { return (int*)malloc(sizeof(int) * n); }

typedef struct ListNode
{
    int val;
    struct ListNode* next;
} ListNode;

ListNode* prepend_head(ListNode* node, int x)
{
    ListNode* result = (ListNode*)malloc(sizeof(ListNode));
    result->val      = x;
    result->next     = node;

    return result;
}

typedef struct Int
{
    int value;
} Int;

typedef struct IntInt
{
    Int value;
} IntInt;

IntInt wrapIntInt(int x)
{
    IntInt result = {.value = {.value = x}};
    return result;
}
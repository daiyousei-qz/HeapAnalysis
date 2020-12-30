#include "stdlib.h"

void stack_array() { int xs[8]; }

void heap_array() { int* xs = (int*)malloc(8 * sizeof(int)); }

int* dynamic_heap_array(int n) { return (int*)malloc(n * sizeof(int)); }

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

// int apply(int (*f)()) { return f(); }
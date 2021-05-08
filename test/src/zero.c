int first(int* p, int* q) { return *p; }
int sum(int* p, int* q) { return *p + *q; }

int foo()
{
    int a   = 41;
    int b   = 1;
    int* pa = &a;
    int* pb = &b;
    return first(pa, pb) + sum(pa, pb);
}
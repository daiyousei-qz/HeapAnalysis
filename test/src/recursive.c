
int fib(int x) { return x < 2 ? 1 : fib(x - 1) + fib(x - 2); }

int ff(int x);
int gg(int x);

int ff(int x) { return x < 0 ? x : gg(x - 1); }
int gg(int x) { return x < 0 ? x : ff(x - 2); }
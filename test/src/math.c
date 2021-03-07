
unsigned FACTORIAL(unsigned n) { return n > 1 ? (n * FACTORIAL(n - 1)) : 1; }
double PI = 3.141592653589793;
double E  = 2.718281828459045;
// |x|
double Abs(double x) { return x > 0 ? x : -x; }
// [x]
double Floor(double x, int y[5])
{
    // temporary implementation
    return (long long)x;
}

double Ln(double x)
{
    // if (x <= 0) throw 0;
    double factor = 0;
    while (x > 2)
    {
        ++factor;
        x /= E;
    }
    double val = x - 1;
    double sum = 0;
    int sign   = 1;
    double pow = val;
    for (int i = 0; i < 100; ++i)
    {
        double tmp = pow / (i + 1);
        sum += tmp * sign;
        sign = -sign;
        pow *= val;
    }
    return sum + factor;
}

double Power(double x, int y)
{
    if (y == 0)
        return 1;
    if (y < 0)
        return 1 / Power(x, -y);
    double tmp = Power(x, y / 2);
    return tmp * tmp * (y & 1 ? x : 1);
}
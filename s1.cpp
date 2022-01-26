#include <cstdio>

namespace aa
{
    typedef int bb;
}

namespace cc
{
    typedef float dd;
}

aa::bb foo(cc::dd bar)
{
    return static_cast<int>(bar);
}

int main(int argc, char *argv[])
{
    cc::dd bar = 1.123;
    aa::bb b;
    printf("hello from simple\n");
    b = foo(bar);
    printf("%f %d\n", bar, b);
}

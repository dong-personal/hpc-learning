#include "axpy.h"

template <typename T, typename Index>
NOINLINE void axpy_v1(Index n, T a, const T *x, T *y)
{
    for (Index i = 0; i < n; ++i)
    {
        y[i] = a * x[i] + y[i];
    }
}

template void axpy_v1<float, int>(int n, float a, const float *x, float *y);
template void axpy_v1<double, int>(int n, double a, const double *x, double *y);
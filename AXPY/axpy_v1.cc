#include "axpy.h"
#include <immintrin.h>

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

NOINLINE void axpy_v2(int n, float a, const float *x, float *y)
{
    __m256 a_vec = _mm256_set1_ps(a);
    int i = 0;

    // Process 8 elements at a time
    for (; i <= n - 8; i += 8)
    {
        __m256 x_vec = _mm256_loadu_ps(&x[i]);
        __m256 y_vec = _mm256_loadu_ps(&y[i]);
        __m256 result = _mm256_fmadd_ps(a_vec, x_vec, y_vec);
        _mm256_storeu_ps(&y[i], result);
    }

    // Handle remaining elements
    for (; i < n; ++i)
    {
        y[i] = a * x[i] + y[i];
    }
}

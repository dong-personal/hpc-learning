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

// vactorize and fmadd
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

// #define UNROLL_BODY_ALIGNED(i)                                                                                         \
//     {                                                                                                                  \
//         __m256 x_vec = _mm256_load_ps(&x[i]);                                                                          \
//         __m256 y_vec = _mm256_load_ps(&y[i]);                                                                          \
//         __m256 result = _mm256_fmadd_ps(a_vec, x_vec, y_vec);                                                          \
//         _mm256_store_ps(&y[i], result);                                                                                \
//     }

#define UNROLL_BODY(i) _mm256_storeu_ps(&y[i], _mm256_fmadd_ps(a_vec, _mm256_loadu_ps(&x[i]), _mm256_loadu_ps(&y[i])))

// unroll 8 times
NOINLINE void axpy_v3(int n, float a, const float *x, float *y)
{
    volatile const __m256 a_vec = _mm256_set1_ps(a);
    int i = 0;
    for (; i <= n - 64; i += 64)
    {
        UNROLL_BODY(i);
        UNROLL_BODY(i + 8);
        UNROLL_BODY(i + 16);
        UNROLL_BODY(i + 24);
        UNROLL_BODY(i + 32);
        UNROLL_BODY(i + 40);
        UNROLL_BODY(i + 48);
        UNROLL_BODY(i + 56);
    }
    // Handle remaining elements
    for (; i < n; ++i)
    {
        y[i] = a * x[i] + y[i];
    }
}

#define UNROLL_BODY_ASM(i)                                                                                             \
    do                                                                                                                 \
    {                                                                                                                  \
        __asm__ volatile("vmovups  ymm0, YMMWORD PTR [%[xp]]        \n\t"                                              \
                         "vmovups  ymm1, YMMWORD PTR [%[yp]]        \n\t"                                              \
                         "vfmadd231ps ymm1, ymm0, ymm2              \n\t" /* ymm1 = ymm0*ymm2 + ymm1 */                \
                         "vmovups  YMMWORD PTR [%[yp]], ymm1        \n\t"                                              \
                         :                                                                                             \
                         : [xp] "r"(x + (i)), [yp] "r"(y + (i))                                                        \
                         : "ymm0", "ymm1", "memory");                                                                  \
    } while (0)

NOINLINE void axpy_v4(int n, float a, const float *x, float *y)
{
    register __m256 a_reg __asm__("ymm2") = _mm256_set1_ps(a);
    int i = 0;
    for (; i <= n - 64; i += 64)
    {
        UNROLL_BODY_ASM(i);
        UNROLL_BODY_ASM(i + 8);
        UNROLL_BODY_ASM(i + 16);
        UNROLL_BODY_ASM(i + 24);
        UNROLL_BODY_ASM(i + 32);
        UNROLL_BODY_ASM(i + 40);
        UNROLL_BODY_ASM(i + 48);
        UNROLL_BODY_ASM(i + 56);
    }
    for (; i < n; ++i)
    {
        y[i] = a * x[i] + y[i];
    }
}

NOINLINE void axpy_v5(int n, float a, const float *__restrict x, float *__restrict y)
{
    int n48 = n & ~47; // 48 的倍数（向下取整）
    int it48 = n48 / 48;

    int n8 = n & ~7; // 8 的倍数
    int it8 = (n8 - n48) / 8;

    const float *xp = x;
    float *yp = y;

    __asm__ volatile("vbroadcastss ymm2, %[aval]              \n\t" // ymm2 = aaaa...

                     // -------- 主循环：48 floats / iter (6x unroll) --------
                     "test  %[cnt48], %[cnt48]                \n\t"
                     "jz    2f                                 \n\t"
                     "1:                                       \n\t"

                     // load x/y (6 blocks)
                     "vmovups ymm0,  YMMWORD PTR [%[xp] + 0]   \n\t"
                     "vmovups ymm1,  YMMWORD PTR [%[yp] + 0]   \n\t"
                     "vmovups ymm3,  YMMWORD PTR [%[xp] + 32]  \n\t"
                     "vmovups ymm4,  YMMWORD PTR [%[yp] + 32]  \n\t"
                     "vmovups ymm5,  YMMWORD PTR [%[xp] + 64]  \n\t"
                     "vmovups ymm6,  YMMWORD PTR [%[yp] + 64]  \n\t"
                     "vmovups ymm7,  YMMWORD PTR [%[xp] + 96]  \n\t"
                     "vmovups ymm8,  YMMWORD PTR [%[yp] + 96]  \n\t"
                     "vmovups ymm9,  YMMWORD PTR [%[xp] + 128] \n\t"
                     "vmovups ymm10, YMMWORD PTR [%[yp] + 128] \n\t"
                     "vmovups ymm11, YMMWORD PTR [%[xp] + 160] \n\t"
                     "vmovups ymm12, YMMWORD PTR [%[yp] + 160] \n\t"

                     // fma (6 blocks)
                     "vfmadd231ps ymm1,  ymm0,  ymm2           \n\t"
                     "vfmadd231ps ymm4,  ymm3,  ymm2           \n\t"
                     "vfmadd231ps ymm6,  ymm5,  ymm2           \n\t"
                     "vfmadd231ps ymm8,  ymm7,  ymm2           \n\t"
                     "vfmadd231ps ymm10, ymm9,  ymm2           \n\t"
                     "vfmadd231ps ymm12, ymm11, ymm2           \n\t"

                     // store y (6 blocks)
                     "vmovups YMMWORD PTR [%[yp] + 0],   ymm1  \n\t"
                     "vmovups YMMWORD PTR [%[yp] + 32],  ymm4  \n\t"
                     "vmovups YMMWORD PTR [%[yp] + 64],  ymm6  \n\t"
                     "vmovups YMMWORD PTR [%[yp] + 96],  ymm8  \n\t"
                     "vmovups YMMWORD PTR [%[yp] + 128], ymm10 \n\t"
                     "vmovups YMMWORD PTR [%[yp] + 160], ymm12 \n\t"

                     // advance pointers: 48 floats * 4 = 192 bytes
                     "add   %[xp], 192                         \n\t"
                     "add   %[yp], 192                         \n\t"
                     "dec   %[cnt48]                           \n\t"
                     "jnz   1b                                 \n\t"
                     "2:                                       \n\t"

                     // -------- 次循环：8 floats / iter --------
                     "test  %[cnt8], %[cnt8]                   \n\t"
                     "jz    4f                                 \n\t"
                     "3:                                       \n\t"
                     "vmovups ymm0, YMMWORD PTR [%[xp]]        \n\t"
                     "vmovups ymm1, YMMWORD PTR [%[yp]]        \n\t"
                     "vfmadd231ps ymm1, ymm0, ymm2             \n\t"
                     "vmovups YMMWORD PTR [%[yp]], ymm1        \n\t"
                     "add   %[xp], 32                          \n\t"
                     "add   %[yp], 32                          \n\t"
                     "dec   %[cnt8]                            \n\t"
                     "jnz   3b                                 \n\t"
                     "4:                                       \n\t"
                     : [xp] "+r"(xp), [yp] "+r"(yp), [cnt48] "+r"(it48), [cnt8] "+r"(it8)
                     : [aval] "x"(a)
                     : "ymm0", "ymm1", "ymm2", "ymm3", "ymm4", "ymm5", "ymm6", "ymm7", "ymm8", "ymm9", "ymm10", "ymm11",
                       "ymm12", "memory", "cc");

    // 标量尾巴（0~7 个）
    for (int i = n8; i < n; ++i)
    {
        y[i] = a * x[i] + y[i];
    }
}

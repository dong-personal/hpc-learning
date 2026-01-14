#pragma once
#ifndef AXPY_H
#define AXPY_H
#include "../utils/Macros.h"

template <typename T, typename Index>
NOINLINE void axpy_v0(Index n, T a, const T *x, T *y);

template <typename T, typename Index>
NOINLINE void axpy_v1(Index n, T a, const T *x, T *y);

NOINLINE void axpy_v2(int n, float a, const float *x, float *y);

NOINLINE void axpy_v3(int n, float a, const float *x, float *y);

NOINLINE void axpy_v4(int n, float a, const float *x, float *y);

NOINLINE void axpy_v5(int n, float a, const float *__restrict x, float *__restrict y);

#endif // AXPY
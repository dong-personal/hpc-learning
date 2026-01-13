#pragma once
#ifndef AXPY_H
#define AXPY_H
#include "../utils/macros.h"

template <typename T, typename Index>
NOINLINE void axpy_v0(Index n, T a, const T *x, T *y);

template <typename T, typename Index>
NOINLINE void axpy_v1(Index n, T a, const T *x, T *y);

NOINLINE void axpy_v2(int n, float a, const float *x, float *y);

#endif // AXPY
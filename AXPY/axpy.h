#pragma once
#ifndef AXPY_H
#define AXPY_H
#include "../utils/macros.h"

template <typename T, typename Index>
NOINLINE void axpy_v0(Index n, T a, const T *x, T *y);

template <typename T, typename Index>
NOINLINE void axpy_v1(Index n, T a, const T *x, T *y);

#endif // AXPY
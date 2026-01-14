// axpy_bench.cc
#include <benchmark/benchmark.h>

#include <algorithm>
#include <cstddef>
#include <cstdint>
#include <random>
#include <vector>

#include "axpy.h"

template <typename T>
static std::vector<T> MakeRandomVec(std::size_t n, uint32_t seed)
{
    std::mt19937 rng(seed);
    std::uniform_real_distribution<double> dist(-1.0, 1.0);

    std::vector<T> v(n);
    for (std::size_t i = 0; i < n; ++i)
        v[i] = static_cast<T>(dist(rng));
    return v;
}

template <typename T>
using AxpyFn = void (*)(int n, T a, const T *x, T *y);

template <typename T>
static void BM_Axpy(benchmark::State &state, AxpyFn<T> fn)
{
    const int n = static_cast<int>(state.range(0));
    const T a = static_cast<T>(1.2345);

    std::vector<T> x = MakeRandomVec<T>(static_cast<std::size_t>(n), 123);
    std::vector<T> y0 = MakeRandomVec<T>(static_cast<std::size_t>(n), 456);
    std::vector<T> y(static_cast<std::size_t>(n));

    benchmark::DoNotOptimize(x.data());
    benchmark::DoNotOptimize(y.data());

    for (auto _ : state)
    {
        state.PauseTiming();
        std::copy(y0.begin(), y0.end(), y.begin());
        benchmark::DoNotOptimize(x.data());
        benchmark::DoNotOptimize(y.data());
        state.ResumeTiming();

        fn(n, a, x.data(), y.data());

        benchmark::ClobberMemory();
    }

    state.SetBytesProcessed(static_cast<int64_t>(state.iterations()) * static_cast<int64_t>(n) *
                            static_cast<int64_t>(sizeof(T) * 3));
}

// /* ----------------- 注册：double 版本（如果有实现） ----------------- */
// BENCHMARK_CAPTURE(BM_Axpy<double>, v0, axpy_v0)->RangeMultiplier(1 << 2)->Range(1 << 10, 1 << 23);

/* ----------------- 注册：float 版本 ----------------- */
// BENCHMARK_CAPTURE(BM_Axpy<float>, v0, axpy_v0)->RangeMultiplier(1 << 2)->Range(1 << 10, 1 << 24);

// BENCHMARK_CAPTURE(BM_Axpy<float>, v1, axpy_v1)->RangeMultiplier(1 << 2)->Range(1 << 10, 1 << 24);

// BENCHMARK_CAPTURE(BM_Axpy<float>, v2, axpy_v2)->RangeMultiplier(1 << 2)->Range(1 << 10, 1 << 24);

BENCHMARK_CAPTURE(BM_Axpy<float>, v3, axpy_v3)->RangeMultiplier(1 << 2)->Range(1 << 10, 1 << 24);

BENCHMARK_CAPTURE(BM_Axpy<float>, v4, axpy_v4)->RangeMultiplier(1 << 2)->Range(1 << 10, 1 << 24);

BENCHMARK_CAPTURE(BM_Axpy<float>, v5, axpy_v5)->RangeMultiplier(1 << 2)->Range(1 << 10, 1 << 24);

BENCHMARK_MAIN();

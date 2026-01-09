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
static void BM_Axpy_V0(benchmark::State &state)
{
    const int n = static_cast<std::size_t>(state.range(0));
    const T a = static_cast<T>(1.2345);

    // 生成输入（每次 benchmark 固定同一份，避免把 RNG 时间算进去）
    std::vector<T> x = MakeRandomVec<T>(n, 123);
    std::vector<T> y0 = MakeRandomVec<T>(n, 456);
    std::vector<T> y(n);

    // 计时前：确保数据页都触达（可选）
    benchmark::DoNotOptimize(x.data());
    benchmark::DoNotOptimize(y.data());

    for (auto _ : state)
    {
        // 为了公平：每轮把 y 恢复到同样的初始状态
        state.PauseTiming();
        std::copy(y0.begin(), y0.end(), y.begin());

        benchmark::DoNotOptimize(x.data());
        benchmark::DoNotOptimize(y.data());
        state.ResumeTiming();

        axpy_v0(n, a, x.data(), y.data());

        // 防止编译器把结果优化掉
        benchmark::ClobberMemory();
    }

    // 统计吞吐：每元素读 x、读 y、写 y（大致 2读1写）
    // bytes ≈ n * (sizeof(T) * 3)
    state.SetBytesProcessed(static_cast<int64_t>(state.iterations()) * static_cast<int64_t>(n) *
                            static_cast<int64_t>(sizeof(T) * 3));
}

BENCHMARK_TEMPLATE(BM_Axpy_V0, float)->RangeMultiplier(2)->Range(1 << 10, 1 << 24); // 1K ~ 16M elements

BENCHMARK_TEMPLATE(BM_Axpy_V0, double)->RangeMultiplier(2)->Range(1 << 10, 1 << 23); // double 更大，少一点避免内存爆

template <typename T>
static void BM_Axpy_V1(benchmark::State &state)
{
    const int n = static_cast<std::size_t>(state.range(0));
    const T a = static_cast<T>(1.2345);

    // 生成输入（每次 benchmark 固定同一份，避免把 RNG 时间算进去）
    std::vector<T> x = MakeRandomVec<T>(n, 123);
    std::vector<T> y0 = MakeRandomVec<T>(n, 456);
    std::vector<T> y(n);

    // 计时前：确保数据页都触达（可选）
    benchmark::DoNotOptimize(x.data());
    benchmark::DoNotOptimize(y.data());

    for (auto _ : state)
    {
        // 为了公平：每轮把 y 恢复到同样的初始状态
        state.PauseTiming();
        std::copy(y0.begin(), y0.end(), y.begin());

        benchmark::DoNotOptimize(x.data());
        benchmark::DoNotOptimize(y.data());
        state.ResumeTiming();

        axpy_v1(n, a, x.data(), y.data());

        // 防止编译器把结果优化掉
        benchmark::ClobberMemory();
    }

    // 统计吞吐：每元素读 x、读 y、写 y（大致 2读1写）
    // bytes ≈ n * (sizeof(T) * 3)
    state.SetBytesProcessed(static_cast<int64_t>(state.iterations()) * static_cast<int64_t>(n) *
                            static_cast<int64_t>(sizeof(T) * 3));
}

BENCHMARK_TEMPLATE(BM_Axpy_V1, float)->RangeMultiplier(2)->Range(1 << 10, 1 << 24); // 1K ~ 16M elements

BENCHMARK_TEMPLATE(BM_Axpy_V1, double)->RangeMultiplier(2)->Range(1 << 10, 1 << 23); // double 更大，少一点避免内存爆

BENCHMARK_MAIN();

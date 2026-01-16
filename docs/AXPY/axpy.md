# How to Implement An AXPY Operator Optimized at The O3 Level

## The Simplest Implementation

```cpp
template <typename T, typename Index>
void axpy_v0(Index n, T a, const T *x, T *y)
{
    for (Index i = 0; i < n; ++i)
    {
        y[i] = a * x[i] + y[i];
    }
}
```
#include <memory>
#if __cplusplus < 201703L
#error "AlignedAllocator requires C++17 or later"
#endif

template <typename T, std::size_t Align>
struct AlignedAllocator
{
    using value_type = T;
    AlignedAllocator() noexcept {}

    template <class U>
    constexpr AlignedAllocator(const AlignedAllocator<U, Align> &) noexcept
    {
    }

    T *allocate(std::size_t n)
    {
        void *p = std::aligned_alloc(Align, n * sizeof(T));
        if (!p)
            throw std::bad_alloc();
        return reinterpret_cast<T *>(p);
    }

    void deallocate(T *p, std::size_t) noexcept { std::free(p); }
};
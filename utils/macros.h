#pragma once
#ifndef MACROS_H
#define MACROS_H

// NO inline
#if defined(__GNUC__) || defined(__clang__)
#define NOINLINE __attribute__((noinline))
#elif defined(_MSC_VER)
#define NOINLINE __declspec(noinline)
#else
#define NOINLINE
#endif

#endif // MACROS_H
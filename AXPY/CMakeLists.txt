cmake_minimum_required(VERSION 3.16)
project(axpy_benchmark CXX)
# set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# if(NOT CMAKE_BUILD_TYPE)
#   set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
# endif()

# 查找本地安装的 Google Benchmark
find_package(benchmark CONFIG REQUIRED)

add_executable(axpy_bench axpy_bench.cc)
add_library(axpy_v0 STATIC axpy_v0.cc axpy.h)
target_compile_options(axpy_v0 PRIVATE -O3 -mavx2 -mfma -ffast-math)
add_library(axpy_v1 STATIC axpy_v1.cc axpy.h)
target_compile_options(axpy_v1 PRIVATE -mavx2 -mfma)

# benchmark::benchmark 会自动带上需要的依赖（libbenchmark, pthread 等）
target_link_libraries(axpy_bench PRIVATE benchmark::benchmark axpy_v0 axpy_v1)

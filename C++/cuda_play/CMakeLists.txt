cmake_minimum_required(VERSION 3.21)
project(cuda_play CUDA)

set(CMAKE_CUDA_STANDARD 23)

add_executable(cuda_play main.cu)
add_executable(test_round test_round.cu)
add_executable(add_sync add_sync.cu)
set_property(TARGET add_sync PROPERTY CUDA_ARCHITECTURES 80)
add_executable(test_approx test_approx.cu)
set_target_properties(cuda_play PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)

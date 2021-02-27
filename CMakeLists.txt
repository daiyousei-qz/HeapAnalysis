cmake_minimum_required(VERSION 3.16)
project(heap-analysis CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
add_compile_options(-std=c++17 -fPIC -g)

add_definitions(-DHEAP_ANALYSIS_DEBUG_MODE)
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_definitions(-DHEAP_ANALYSIS_DEBUG_MODE)
endif()

# LLVM
find_package(LLVM CONFIG REQUIRED)

add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})

# Z3 SMT Solver
find_package(Z3 CONFIG REQUIRED)

include_directories(${Z3_CXX_INCLUDE_DIRS})
link_libraries(${Z3_LIBRARIES})

# libfmt
add_subdirectory(external/fmt)

link_libraries(fmt::fmt)

# Project
file(GLOB_RECURSE SOURCE_FILE src/*.cpp)
file(GLOB_RECURSE HEADER_FILE include/*.h)

add_library(HeapAnalysis MODULE ${HEADER_FILE} ${SOURCE_FILE})

target_include_directories(HeapAnalysis PUBLIC include/)
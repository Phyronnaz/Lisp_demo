cmake_minimum_required(VERSION 3.9)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS_DEBUG} -Wall -Wno-long-long -pedantic -gdwarf-3")

set(CMAKE_CXX_STANDARD 14)

set(SOURCE_FILES main.cpp)
add_executable(lisp_run main.cpp)

include_directories(lisp)

add_subdirectory(lisp)
add_subdirectory(lisp_tests)

target_link_libraries(lisp_run lisp)
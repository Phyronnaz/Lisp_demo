project(lisp_tests)

set(SOURCE_FILES tests.cpp)

add_executable(lisp_test ${SOURCE_FILES})
target_link_libraries(lisp_test lisp)
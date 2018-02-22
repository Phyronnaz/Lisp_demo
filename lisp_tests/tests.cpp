#include <iostream>

#include "core/core.h"
#include "Parser/read.h"
#include "Object/object.h"

#define PAUSE() (getchar())

#define PRINT_RESULT(category, name, success, test, expected_result) \
    std::cout << #category << "." << #name << ": " << std::endl; \
    std::cout << #test << " == " << #expected_result << std::endl; \
    if(success) \
    { \
        std::cout << "OK"; \
    } \
    else  \
    { \
        std::cout << "FAIL"; \
    } \
    std::cout << std::endl; \
    PAUSE();

#define TEST(category, name, string, expected_result) \
    { \
        auto env1 = MakeEnv(); \
        auto env2 = MakeEnv(); \
        auto object1 = get_object_from_string(#string); \
        auto object2 = get_object_from_string(#expected_result); \
        bool result = eq(eval(object1, env1), eval(object2, env2)); \
        PRINT_RESULT(category, name, result, string, expected_result) \
    }

int main()
{
    TEST(subr, add, (+ 1 2), 3)
    TEST(subr, minus, (- 2 3), -1)
    TEST(subr, multiply, (* 3 5), 15)
    TEST(subr, divide, (/ 6 3), 2)
    TEST(keywords, quote, (quote 1), 1)
    return 0;
}
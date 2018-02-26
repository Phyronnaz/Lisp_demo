#include <iostream>
#include <toplevel/toplevel.h>

#include "exception.h"
#include "toplevel/toplevel.h"
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
        Object object1 = get_object_from_string(#expected_result); \
        Object object2 = get_object_from_string(#string); \
        print_object(object1); print_object(object2); \
        bool result = (toplevel.analyze(object1) == toplevel.analyze(object2)); \
        PRINT_RESULT(category, name, result, string, expected_result) \
    }

int main()
{
    Toplevel toplevel = Toplevel(true);
    try
    {
        TEST(subr, add, (+ 1 2), 3)
        TEST(subr, minus, (- 2 3), -1)
        TEST(subr, multiply, (* 3 5), 15)
        TEST(subr, divide, (/ 6 3), 2)
        TEST(keywords, quote, (quote 1), 1)
        TEST(keywords, if, (if 1 2 3), 2)
        TEST(keywords, if, (if () 2 3), 3)
        TEST(keywords, lambda, ((lambda (n) (+ 1 n)) 2), 3)
        TEST(keywords, lambda, ((lambda (n x) (+ (* n 2) x)) 4 5), 13)
        TEST(list, null, (null ()), t)
        TEST(list, null, (null t), ())
        TEST(list, car, (car (quote(1 2 3))), (quote 1))
        TEST(list, cdr, (cdr (quote(1 2 3))), (quote(2 3)))
        TEST(list, cons, (cons (quote 1) (quote(2 3))), (quote(1 2 3)))
        //TEST(keywords, define, (define a 1), "SET: a = 1")
        //TEST(keywords, define, a, 1)
        //TEST(keywords, set, (set a 2), "SET: a = 2")
        //TEST(keywords, set, a, 2)
        //TEST(list, append, (setq append (lambda (u v) (if (null u) v (cons (car u) (append (cdr u) v))))), )
        //TEST(list, append, "(append () \'(1 2))", "\'(1 2)" )
        //TEST(list, map, (setq map (lambda (f u) (if (null u) nil (cons (f (car u)) (map f (cdr u)))))), )
        //TEST(list, reduce, (setq reduce (lambda (f u a) (if null u) a (reduce f (cdr u) (f (car u) a)))), )
    }
    catch (const LispException& error)
    {
        std::cout << error.what() << std::endl;
    }
    return 0;
}
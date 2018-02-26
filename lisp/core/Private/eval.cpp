#include <cassert>

#include "core/core.h"
#include "Object/object.h"
#include "apply.h"
#include "environment.h"
#include "subr.h"
#include "exception.h"
#include "debug.h"

/**
 * Evaluates the arguments of a function (before applying them) and stores them into lvals
 * @param lvals the vector storing the evaluated arguments
 * @param object the arguments container
 * @param env the current environment
 * @param initial_object the first object toplevel read
 */
void map(std::vector<Object>& lvals, Object object, const std::shared_ptr<Environment>& env, Object initial_object)
{
    if(!null(object))
    {
        lvals.push_back(eval(car(object), env, initial_object));
        map(lvals, cdr(object), env, initial_object);
    }
}

/**
 * Simulates a if condition where if obj_1 is false then obj_3 else obj_2 in a given environment
 * @param obj_1 the if condition
 * @param obj_2 results if true (or anything else than a boolean)
 * @param obj_3 results if false
 * @param env the current environment
 * @param initial_object the first object toplevel read
 * @return the evaluation of the right object
 */
Object do_if(Object obj_1, Object obj_2, Object obj_3, const std::shared_ptr<Environment>& env, Object initial_object)
{
    if(null(eval(obj_1, env, initial_object)))
    {
        return eval(obj_3, env, initial_object);
    }
    else
    {
        return eval(obj_2, env, initial_object);
    }
}

/**
 * Simulates the "progn" command, where we keep on evaluating object before returning the last one
 * @param object objects to be evaluated
 * @param env the current environnement
 * @param initial_object the first object toplevel read
 * @return the last evaluated object
 */
Object do_progn(Object object, const std::shared_ptr<Environment>& env, Object initial_object)
{
    assert (object);

    if(!null(cdr(object)))
    {
        eval(car(object), env, initial_object);
        return do_progn(cdr(object), env, initial_object);
    }
    else
    {
        return eval(car(object), env, initial_object);
    }

}

/**
 * Prints the current environnement
 * @param env the cirrent environnement
 */

void do_print_env(const std::shared_ptr<Environment>& env)
{
    env->print();
}

/**
 * Computes the list with the car() of a list of list
 * @param object a list of list
 * @return the list of car(list)
 */

Object map_car(const Object& object)
{
    if(null(object))
    {
        return nil();
    }
    else
    {
        Object to_map = cdr(object);
        Object result = car(car(object));
        return cons(result, map_car(to_map));
    }
}

/**
 * Computes the list with the cadr() of a list of list
 * @param object a list of list
 * @return the list of cadr(list)
 */

Object map_cadr(const Object& object)
{
    if(null(object))
    {
        return nil();
    }
    else
    {
        Object to_map = cdr(object);
        Object result = cadr(car(object));
        return cons(result, map_cadr(to_map));
    }
}

/**
 * Expands the let macro
 * @param object
 * @return an equivalent object written with lambda
 */

Object macro_let_to_lambda(const Object& object)
{
    Object binding_list = cadr(object);
    Object body = caddr(object);
    Object lpars = map_car(binding_list);
    Object lvals = map_cadr(binding_list);
    Object lambda_expr = cons(symbol_to_Object("lambda"), cons(lpars, cons(body, nil())));
    Object new_obj = cons(lambda_expr, lvals);
    return new_obj;
}

/**
 * Computes if f is in initial_obj
 * @param initial_obj original object
 * @param f object to be found
 * @return true iif f is in initial_obj
 */

bool is_f_there(Object initial_obj, Object f)
{
    if(eq(initial_obj, f))
    {
        return true;
    }
    else
    {
        if(listp(initial_obj))
        {
            return is_f_there(car(initial_obj), f) | is_f_there(cdr(initial_obj), f);
        }
        else
        {
            return false;
        }
    }
}

/**
 * Computes the continuation of a wanted object
 * @param initial_obj the original object
 * @param wanted_obj the object that contains "callcc"
 * @param delete_mode
 * @param in_a_begin
 * @return the object made of all instructions that happen after wanted_object
 */

Object compute_continuation(Object initial_obj, Object wanted_obj, bool delete_mode = true, bool in_a_begin = false)
{
    if(eq(initial_obj, wanted_obj))
    {
        return symbol_to_Object("__x");
    }
    else
    {
        if(listp(initial_obj))
        {
            if(symbolp(car(initial_obj)) && Object_to_string(car(initial_obj)) == "begin")
            {
                return cons(car(initial_obj), compute_continuation(cdr(initial_obj), wanted_obj, true, true));
            }
            else
            {
                if(is_f_there(car(initial_obj), wanted_obj))
                {
                    return cons(compute_continuation(car(initial_obj), wanted_obj, false, true), cdr(initial_obj));
                }
                else
                {
                    if(delete_mode)
                    {
                        return compute_continuation(cdr(initial_obj), wanted_obj, true, in_a_begin);
                    }
                    else
                    {
                        return cons(compute_continuation(car(initial_obj), wanted_obj, false, in_a_begin),
                                    compute_continuation(cdr(initial_obj), wanted_obj, false, in_a_begin));
                    }
                }
            }
        }
        else
        {
            if(delete_mode)
            {
                return nil();
            }
            else
            {
                return initial_obj;
            }
        }
    }
}

/**
 * The main eval function
 * @param object object to evaluate
 * @param env environnement to evaluate the object
 * @param initial_obj the original object that is read
 * @return the evaluation of the given object
 */

Object eval(Object object, const std::shared_ptr<Environment>& env, Object initial_object)
{
    assert(env);
    assert(object);
    assert(initial_object);

    Debug::new_call(object, env);
    Object result;

    {
        if(null(object))
        {
            Debug::end_call(object);
            result = object;
        }
        else
        {
            if(numberp(object))
            {
                result = object;
            }
            else if(stringp(object))
            {
                result = object;
            }
            else if(symbolp(object))
            {
                std::string s = Object_to_string(object);

                if(s == "t")
                {
                    result = object;
                }
                else
                {
                    Object obj_result = env->get_object_from_env(s);

                    if(obj_result) //known variable
                    {
                        result = obj_result;
                    }
                    else
                    {
                        if(is_subrp(object))
                        {
                            result = object;
                        }
                        else
                        {
                            throw LispException("Unknown variable " + s);
                        }
                    }
                }
            }
            else
            {
                assert(listp(object));

                Object car_obj = car(object);

                if(numberp(car_obj))
                {
                    throw LispException("Cannot apply a number: " + std::to_string(Object_to_number(car_obj)));
                }
                else if(stringp(car_obj))
                {
                    throw LispException("Cannot apply a string: " + Object_to_string(car_obj));
                }
                else if(listp(car_obj))
                {
                    Object f = eval(car(object), env, initial_object);

                    std::vector<Object> lvals;
                    map(lvals, cdr(object), env, initial_object);

                    Object obj_result = apply(f, lvals, env, initial_object);

                    result = obj_result;
                }
                else
                {
                    assert(symbolp(car_obj));

                    std::string symbol = Object_to_string(car_obj);

                    if(symbol == "lambda")
                    {
                        result = object;
                    }
                    else if(symbol == "quote")
                    {
                        Object cadr_obj = cadr(object);
                        result = cadr_obj;
                    }
                    else if(symbol == "if")
                    {
                        result = do_if(cadr(object), caddr(object), cadddr(object), env, initial_object);
                    }
                    else if(symbol == "progn" || symbol == "begin")
                    {
                        result = do_progn(cdr(object), env, initial_object);
                    }
                    else if(symbol == "printenv")
                    {
                        do_print_env(env);
                        result = nil();
                    }
                    else if(symbol == "let")
                    {
                        result = eval(macro_let_to_lambda(object), env, initial_object);
                    }
                    else if(is_setbang(object))
                    {
                        setbang(object, env, initial_object);
                        result = nil();
                    }
                    else if(symbol == "callcc" || symbol == "call-with-current-continuation")
                    {
                        Object f = car(cdr(object));

                        Object object_in_memory = env->get_definition(object);

                        Object initial_object_in_memory = env->get_definition(initial_object);

                        Object continuation = compute_continuation(initial_object_in_memory, object_in_memory);

                        Object fct_cont = cons(symbol_to_Object("lambda"),
                                               cons(
                                                       cons(symbol_to_Object("__x"), nil()),
                                                       cons(continuation, nil())));

                        Object to_be_evaluated = cons(f, cons(fct_cont, nil()));

                        result = eval(to_be_evaluated, env, initial_object);
                    }
                    else if(symbol == "trace" || symbol == "print" || symbol == "display")
                    {
                        Object to_print = eval(cadr(object), env, initial_object);
                        std::cout << print_object(to_print) << std::endl;
                        result = to_print;
                    }
                    else
                    {
                        Object f = car_obj;
                        std::vector<Object> lvals;
                        map(lvals, cdr(object), env, initial_object);

                        Object obj_result = apply(f, lvals, env, initial_object);
                        result = obj_result;
                    }
                }
            }
        }
    }
    Debug::end_call(object);
    return result;
}
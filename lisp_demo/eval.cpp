#include <cassert>

#include "core.h"
#include "apply.h"
#include "object.h"
#include "environment.h"

/**
 * Evaluates the arguments of a function (before applying them) and stores them into lvals
 * @param lvals the vector storing the evaluated arguments
 * @param object the arguments container
 * @param env the current environment
 */

void map(std::vector<Object>& lvals, Object object, const std::shared_ptr<Environment>& env)
{
    if(!null(object))
    {
        lvals.push_back(eval(car(object), env));
        map(lvals, cdr(object), env);
    }
}

/**
 * Simulates a if condition where if obj_1 is false then obj_3 else obj_2 in a given environment
 * @param obj_1 the if condition
 * @param obj_2 results if true (or anything else than a boolean)
 * @param obj_3 results if false
 * @param env the current environment
 * @return the evaluation of the right object
 */

Object do_if(Object obj_1, Object obj_2, Object obj_3, const std::shared_ptr<Environment>& env)
{
    if(null(eval(obj_1, env)))
    {
        return eval(obj_3, env);
    }
    else
    {
        return eval(obj_2, env);
    }
}

/**
 * Simulates the "progn" command, where we keep on evaluating object before returning the last one
 * @param object objects to be evaluated
 * @param env the current environnement
 * @return the last evaluated object
 */

Object do_progn(Object object, const std::shared_ptr<Environment>& env)
{
    assert (object != nullptr);
    if(cdr(object) != nullptr && !null(cdr(object)))
    {
        eval(car(object), env);
        return do_progn(cdr(object), env);
    }
    else
    {
        return eval(car(object), env);
    }

}

void do_print_env(const std::shared_ptr<Environment>& env)
{
    env->print();
}

Object eval(Object object, const std::shared_ptr<Environment>& env)
{
    if(null(object))
    {
        return object;
    }
    else
    {
        if(numberp(object))
        {
            return object;
        }
        else if(stringp(object))
        {
            return object;
        }
        else if(symbolp(object))
        {
            std::string s = Object_to_string(object);
            Object obj_result = env->get_object_from_env(s);
            if(obj_result)
            {
                return obj_result;
            }
            else
            {
                std::string error_message = "Error: unknown variable " + s;
                throw (error_message);
                return nullptr;
            }
        }
        else
        {
            assert(listp(object));

            Object car_obj = car(object);
            if(numberp(car_obj))
            {
                std::string error_message = "Error: cannot apply a number";
                throw (error_message);
                return nullptr;
            }
            else if(stringp(car_obj))
            {
                std::string error_message = "Error: cannot apply a string";
                throw (error_message);
                return nullptr;
            }
            else if(listp(car_obj))
            {
                Object f = eval(car(object), env);
                std::vector<Object> lvals;
                map(lvals, cdr(object), env);
                return apply(f, lvals, env);
            }
            else
            {
                assert(symbolp(car_obj));
                std::string symbol = Object_to_string(car_obj);
                if(symbol == "lambda")
                {
                    return object;
                }
                else if(symbol == "quote")
                {
                    return cadr(object);
                }
                else if(symbol == "if")
                {
                    return do_if(cadr(object), caddr(object), cadddr(object), env);
                }
                else if(symbol == "progn")
                {
                    if(cdr(object) != nullptr)
                    {
                        return do_progn(cdr(object), env);
                    }
                    else
                    {
                        return nil();
                    }
                }
                else if(symbol == "printenv")
                {
                    std::cout << "<env>";
                    do_print_env(env);
                    return nil();
                }
                else
                {
                    Object f = car_obj;
                    std::vector<Object> lvals;
                    map(lvals, cdr(object), env);
                    return apply(f, lvals, env);
                }
            }
        }
    }
}
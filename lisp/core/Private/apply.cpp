#include <cassert>

#include "core/core.h"
#include "Object/object.h"
#include "subr.h"
#include "apply.h"
#include "environment.h"
#include "exception.h"
#include "debug.h"

Object apply(Object f, const std::vector<Object>& lvals, const std::shared_ptr<Environment>& env, Object initial_object)
{
    assert(f);
    assert(env);
    assert(initial_object);

    Debug::new_call(f, env);
    Object result;

    {
        if(null(f))
        {
            throw LispException("Cannot apply nil");
        }
        else if(numberp(f))
        {
            throw LispException("Cannot apply a number: " + std::to_string(Object_to_number(f)));
        }
        else if(stringp(f))
        {
            throw LispException("Cannot apply a string: " + Object_to_string(f));
        }
        else if(symbolp(f))
        {
            std::string symbol = Object_to_string(f);
            if(Subr::subrp(symbol))
            {
                result = Subr::apply_subr(symbol, lvals);
            }
            else
            {
                std::shared_ptr<Environment> new_env = env->get_frame_where_symbol_defined(Object_to_string(f));

                if(new_env == nullptr)
                {
                    throw LispException("Unknown variable:"  + print_object(f));
                }
                else
                {
                    Object new_f = eval(f, new_env, initial_object);
                    result = apply(new_f, lvals, new_env, initial_object);
                }
            }
        }
        else
        {
            // must be a number, a string, a symbol or a list
            assert(listp(f));

            Object pair_car = car(f);
            Object pair_cdr = cdr(f);

            if(Object_to_string(pair_car) == "lambda")
            {
                // at this point, it has to be a lambda expression

                Object parameters = car(pair_cdr);
                Object body = cadr(pair_cdr);

                std::vector<std::string> string_parameters; // list of the parameters string of the lambda expression

                // Convert symbols to strings
                {
                    Object to_convert = parameters;
                    while (!null(to_convert))
                    {
                        Object symbol = car(to_convert);
                        if(symbolp(symbol))
                        {
                            string_parameters.push_back(Object_to_string(symbol));
                            to_convert = cdr(to_convert);
                        }
                        else
                        {
                            throw LispException("Invalid lambda arg");
                        }
                    }
                }

                if(string_parameters.size() == lvals.size())
                {
                    std::shared_ptr<Environment> new_env = env->CreateChildEnv();
                    new_env->add_objects_to_env(string_parameters, lvals);

                    result = eval(body, new_env, initial_object);
                }
                else
                {
                    throw LispException(std::to_string(lvals.size()) + " args instead of " +
                                        std::to_string(string_parameters.size()));
                }
            }
            else
            {
                throw LispException("Cannot apply a list that isn't a lambda");
            }
        }
    }

    Debug::end_call(f);
    return result;
}

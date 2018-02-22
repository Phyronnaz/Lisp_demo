#include <cassert>
#include "apply.h"
#include "eval.h"
#include "subr.h"

Object apply(Object f, const std::vector<Object>& lvals, const std::shared_ptr<Environment>& env)
{
    assert(f); //Cannot apply nullptr
    assert(env);

    if(numberp(f))
    {
        std::string error_message = "Error: cannot apply a number";
        throw (error_message);
    }
    else if(stringp(f))
    {
        std::string error_message = "Error: cannot apply a string";
        throw (error_message);
    }
    else if(symbolp(f))
    {
        auto symbol = Object_to_string(f)
        if(subrp(symbol))
        {
            return apply_subr(symbol, lvals);
        }
        else
        {
            auto new_f = eval(f, env);
            return apply(new_f, lvals, env);
        }
    }

    else if(listp(f))
    {
        auto f_car = car(f); //at this point, it has to be a lambda expression

        if(Object_to_string(f_car) == "lambda")
        {
            auto cell_lpars = cadr(f); //list of the parameters cell of the lambda expression, it has to be a pair
            auto body = caddr(f); //body of the lambda expression
            std::vector<
                    -

            if(null(cell_lpars))
            {
                return nullptr;
            }
            else if(is_list_of_string(cell_lpars))
            {
                auto lpars = List_to_string_vector(body);// list of the parameters string of the lambda expression

            }

            else
            {
                return nullptr; //the list of parameters wasn't a list of string nor an empty list
            }

            auto new_env = env->CreateChildEnv();
            new_env->add_objects_to_env(lpars, lvals);
            return eval(body, new_env);
        }
        else
        {
            return nullptr; //the list of parameters isn't a cell_pair
        }
    }
    else
    {
        return nullptr; //not a list beginning by lambda: cannot happen
    }
}
assert(false);
}
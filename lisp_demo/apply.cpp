#include <cassert>

#include "apply.h"
#include "core.h"
#include "subr.h"
#include "object.h"
#include "environment.h"

void symbol_list_to_string_vector(const Object& list, std::vector<std::string>& result)
{
    auto to_convert = list;
    while (!null(to_convert))
    {
        auto symbol = car(to_convert);
        assert(symbolp(symbol));

        result.push_back(Object_to_string(symbol));

        to_convert = cdr(to_convert);
    }
}


Object apply(Object f, const std::vector<Object>& lvals, const std::shared_ptr<Environment>& env)
{
    assert(f);
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
        auto symbol = Object_to_string(f);
        if(subrp(symbol))
        {
            return apply_subr(symbol, lvals);
        }
        else
        {
            auto new_f = eval(f, env);
            return apply(new_f, lvals, env);
        };
    }
    else
    {
        // must be a number, a string, a symbol or a list
        assert(listp(f));

        auto pair_car = car(f);
        auto pair_cdr = cdr(f);

        if(Object_to_string(pair_car) == "lambda")
        {
            // at this point, it has to be a lambda expression

            auto parameters = car(pair_cdr);
            auto body = cadr(pair_cdr);

            std::vector<std::string> string_parameters; // list of the parameters string of the lambda expression
            symbol_list_to_string_vector(parameters, string_parameters);

            auto new_env = env->CreateChildEnv();
            new_env->add_objects_to_env(string_parameters, lvals);
            return eval(body, new_env);
        }
        else
        {
            //TODO: error
            return nullptr; //not a list beginning by lambda: cannot happen
        }
    }
}

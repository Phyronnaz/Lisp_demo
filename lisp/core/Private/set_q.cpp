#include <memory>
#include <cassert>
#include <exception.h>

#include "Object/object.h"
#include "environment.h"
#include "core/core.h"

bool is_command(Object object, const std::string& command)
{
    if(listp(object))
    {
        Object car_obj = car(object);
        if(symbolp(car_obj))
        {
            if(Object_to_string(car_obj) == command)
            {
                Object cdr_obj = cdr(object);
                if(listp(cdr_obj))
                {
                    Object cadr_obj = car(cdr_obj);
                    //true iif the first given object after "setq" is not a pair nor nil
                    return ((!listp(cadr_obj)) && !(null(cadr_obj)));
                }
            }
        }
    }
    return false;
}

bool is_setq(Object object)
{
    return is_command(object, "setq") || is_command(object, "define");
}

std::string setq(Object object, const std::shared_ptr<Environment>& env, Object initial_object)
{
    assert(is_setq(object));

    Object cadr_obj = cadr(object);
    Object caddr_obj = caddr(object);
    std::string name;

    if(numberp(cadr_obj))
    {
        name = std::to_string(Object_to_number(cadr_obj));
    }
    else if(stringp(cadr_obj) || symbolp(cadr_obj))
    {
        name = Object_to_string(cadr_obj);
    }
    else
    {
        assert(false);
    }

    Object result = eval(caddr_obj, env, initial_object);
    env->add_object_to_env(name, result);
    return "SET: " + name + " = " + print_object(result);
}

bool is_setbang(Object object)
{
    return is_command(object, "set");
}

std::string setbang(Object object, const std::shared_ptr<Environment>& env, Object initial_object)
{
    assert(is_setbang(object));

    Object cadr_obj = cadr(object);
    Object caddr_obj = caddr(object);
    std::string symbol;

    if(numberp(cadr_obj))
    {
        symbol = std::to_string(Object_to_number(cadr_obj));
    }
    else if(stringp(cadr_obj) || symbolp(cadr_obj))
    {
        symbol = Object_to_string(cadr_obj);
    }
    else
    {
        assert(false);
    }


    std::shared_ptr<Environment> frame = env->get_frame_where_symbol_defined(symbol);
    Object result = eval(caddr_obj, env, initial_object);

    if (frame)
    {
        assert(frame->modify_frame_where_symbol_defined(symbol, result));
    }
    else
    {
        env->add_object_to_env(symbol, result);
    }
    return "SET : " + symbol + " = " + print_object(result);
}


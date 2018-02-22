#include <memory>
#include <cassert>
#include "object.h"
#include "environment.h"
#include "core.h"

bool is_setq(Object object, const std::shared_ptr<Environment>& env)
{
    if (listp(object))
    {
        Object car_obj = car(object);
        if (symbolp(car_obj))
        {
            if (Object_to_string(car_obj) == "setq")
            {
                Object cdr_obj = cdr(object);
                if (listp(cdr_obj))
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

void setq(Object object, const std::shared_ptr<Environment>& env)
{
    assert(is_setq(object, env));
    Object cadr_obj = cadr(object);
    Object caddr_obj = caddr(object);
    if (numberp(cadr_obj))
    {
        env->add_object_to_env(std::to_string(Object_to_number(cadr_obj)), eval(caddr_obj, env));
    }
    else if (stringp(cadr_obj) || symbolp(cadr_obj))
    {
        env->add_object_to_env(Object_to_string(cadr_obj), eval(caddr_obj, env));
    }
    else
    {
        assert(false);
    }
}

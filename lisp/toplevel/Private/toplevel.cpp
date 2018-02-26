#include <iostream>

#include "toplevel/toplevel.h"
#include "Object/object.h"

Toplevel::Toplevel(bool _init)
{
    env = MakeEnv();
    if(_init)
    {
        init();
    }
}

std::string Toplevel::analyze(Object object)
{
    init_debug_step();
    std::string to_print;
    if(is_setq(object))
    {
        to_print = setq(object, env, object);
    }
    else if(is_setbang(object))
    {
        to_print = setbang(object, env, object);
    }
    else
    {
        Object evaluated_obj = eval(object, env, object);
        if(is_subrp(evaluated_obj))
        {
            to_print = "<subr>";
        }
        else
        {
            to_print = print_object(evaluated_obj);
        }
    }
    //std::vector<Object> valid_objects;
    //GetValidObjectsFromEnv(env, valid_objects);
    //CleanGC(valid_objects);
    actualise_debug_mode();
    return to_print;
}
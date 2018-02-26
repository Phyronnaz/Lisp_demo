#include "core/core.h"
#include "environment.h"
#include "subr.h"
#include "subr_defs.h"

Env MakeEnv()
{
    return Environment::MakeEnv();
}

void init()
{
    Debug::init();

    Subr::register_subr("+", do_add);
    Subr::register_subr("-", do_substract);
    Subr::register_subr("*", do_multiply);
    Subr::register_subr("/", do_divide);
    Subr::register_subr("=", do_equal);
    Subr::register_subr("car", do_car);
    Subr::register_subr("cons", do_cons);
    Subr::register_subr("cdr", do_cdr);
    Subr::register_subr("debug", do_debug);
    Subr::register_subr("null", do_null);
}

bool is_subrp(Object object)
{
    if(symbolp(object))
    {
        return Subr::subrp(Object_to_string(object));
    }
    else
    {
        return false;
    }
}

void GetValidObjectsFromEnv(Env env, std::vector<Object>& valid_objects)
{
    env->GetValidObjectsFromEnv(valid_objects);
}

void actualise_debug_mode()
{
    Debug::actualise_debug_mode();
}
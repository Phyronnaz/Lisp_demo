#include <iostream>
#include "toplevel.h"
#include "object.h"

Toplevel::Toplevel()
{
    env = MakeEnv();
}

void Toplevel::analyze(Object object)
{
    if (is_setq(object, env))
    {
        setq(object, env);
    }
    else
    {
        auto x = eval(object, env);
        std::cout << x << std::endl;
    }
}
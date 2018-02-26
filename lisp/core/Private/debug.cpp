#include <iostream>

#include "debug.h"
#include "Object/object.h"
#include "core/core.h"

bool Debug::debug_mode;
int Debug::debug_step;
bool Debug::debug_mode_to_change;
bool Debug::next_value;
void do_print_env(const std::shared_ptr<Environment>& env);

void init_debug_step()
{
    Debug::set_step_to_0();
}

void Debug::init()
{
    debug_mode = false;
    debug_step = 0;
    debug_mode_to_change = false;
    next_value = false;
}

bool Debug::is_debug_mode_active()
{
    return debug_mode;
}
int Debug::get_debug_step()
{
    return debug_step;
}

void Debug::incr_debug_step()
{
    debug_step++;
}

void Debug::decr_debug_step()
{
    debug_step--;
}

void Debug::start_debug_mode()
{
    debug_mode_to_change = true;
    next_value = true;
}

void Debug::actualise_debug_mode()
{
    if(debug_mode_to_change)
    {
        debug_mode = next_value;
        debug_mode_to_change = false;
    }
}

void Debug::stop_debug_mode()
{
    debug_mode_to_change = true;
    next_value = false;
}

std::string print_spaces(int n)
{
    if(n == 0)
    {
        return "";
    }
    else
    {
        return " " + print_spaces(n-1);
    }
}

void Debug::new_call(Object object, const std::shared_ptr<Environment>& env)
{
    if (Debug::is_debug_mode_active())
    {
        std::cout << print_spaces(2*(get_debug_step()+1))
                  << Debug::get_debug_step() << " --> " << object
                  << " | ";
        do_print_env(env);
        std::cout << std::endl;
        Debug::incr_debug_step();
    }
}

void Debug::end_call(Object object)
{
    if (Debug::is_debug_mode_active())
    {
        Debug::decr_debug_step();
        if (is_subrp(object))
        {
            std::cout << print_spaces(2*(get_debug_step()+1))
                      << Debug::get_debug_step() << " <-- <subr> " << std::endl;
        }
        else
        {
            std::cout << print_spaces(2*(get_debug_step()+1))
                      << Debug::get_debug_step() << " <-- " << object << std::endl;
        }
    }
}

void Debug::set_step_to_0()
{
    debug_step = 0;
}
#pragma once

#include <vector>
#include <cassert>
#include <exception.h>

#include "Object/object.h"
#include "debug.h"

/**
 * Throws an exception if the size of values to apply to the subroutine doesn't match with the required size
 * @param name Name of the subroutine
 * @param lvals Values to apply to the subroutines
 * @param required_args Required number of values
 */
void subr_check_args(const std::string& name, const std::vector<Object>& lvals, unsigned required_args)
{
    if(lvals.size() < required_args)
    {
        throw LispException("invalid arg count for " + name + ": " + std::to_string(lvals.size()) + " instead of " +
                            std::to_string(required_args));
    }
}

/**
 * Computes addition
 * @param lvals
 * @return
 */
Object do_add(const std::vector<Object>& lvals)
{
    subr_check_args("+", lvals, 2);
    return number_to_Object(Object_to_number(lvals[0]) + Object_to_number(lvals[1]));
}

/**
 * Computes substraction
 * @param lvals
 * @return
 */
Object do_substract(const std::vector<Object>& lvals)
{
    subr_check_args("-", lvals, 2);
    return number_to_Object(Object_to_number(lvals[0]) - Object_to_number(lvals[1]));
}

/**
 * Computes multiplication
 * @param lvals
 * @return
 */
Object do_multiply(const std::vector<Object>& lvals)
{
    subr_check_args("*", lvals, 2);
    return number_to_Object(Object_to_number(lvals[0]) * Object_to_number(lvals[1]));
}

/**
 * Computes division
 * @param lvals
 * @return
 */
Object do_divide(const std::vector<Object>& lvals)
{
    subr_check_args("/", lvals, 2);
    return number_to_Object(Object_to_number(lvals[0]) / Object_to_number(lvals[1]));
}

/**
 * Tests if the 2 values are equaled to each other
 * @param lvals
 * @return
 */
Object do_equal(const std::vector<Object>& lvals)
{
    subr_check_args("=", lvals, 2);
    return Object_to_number(lvals[0]) == Object_to_number(lvals[1]) ? t() : nil();
}

/**
 *
 * @param lvals
 * @return Returns the head of the first value
 */
Object do_car(const std::vector<Object>& lvals)
{
    subr_check_args("car", lvals, 1);
    return car(lvals[0]);
}

/**
 *
 * @param lvals
 * @return Returns the list which head is the first value and tail is the second one
 */
Object do_cons(const std::vector<Object>& lvals)
{
    subr_check_args("cons", lvals, 2);
    return cons(lvals[0], lvals[1]);
}

/**
 *
 * @param lvals
 * @return Returns the tail of the first value
 */
Object do_cdr(const std::vector<Object>& lvals)
{
    subr_check_args("cdr", lvals, 1);
    return cdr(lvals[0]);
}

/**
 *
 * @param lvals
 * @return Switches off the debug mode if the first value if nil, else switches on
 */
Object do_debug(const std::vector<Object>& lvals)
{
    subr_check_args("debug", lvals, 0);

    if(null(lvals.at(0)))
    {
        Debug::stop_debug_mode();
    }
    else
    {
        Debug::start_debug_mode();
    }
    return nil();
}

Object do_null(const std::vector<Object>& lvals)
{
    assert(lvals.size()>0);
    if (null(lvals.at(0)))
    {
        return t();
    }
    else
    {
        return nil();
    }
}
#include <cassert>

#include "subr.h"
#include "object.h"

bool subrp(const std::string& s)
{
    if(s == "+")
    {
        return true;
    }
    else if(s == "*")
    {
        return true;
    }
    else if(s == "-")
    {
        return true;
    }
    else if(s == "/")
    {
        return true;
    }
    assert(false);
}

Object apply_subr(const std::string& s, const std::vector<Object>& lvals)
{
    assert(subrp(s));

    if(s == "+")
    {
        assert(lvals.size() == 2);
        return number_to_Object(Object_to_number(lvals[0]) + Object_to_number(lvals[1]));
    }
    else if(s == "-")
    {
        assert(lvals.size() == 2);
        return number_to_Object(Object_to_number(lvals[0]) - Object_to_number(lvals[1]));
    }
    else if(s == "*")
    {
        assert(lvals.size() == 2);
        return number_to_Object(Object_to_number(lvals[0]) * Object_to_number(lvals[1]));
    }
    else if(s == "/")
    {
        assert(lvals.size() == 2);
        return number_to_Object(Object_to_number(lvals[0]) / Object_to_number(lvals[1]));
    }
    else
    {
        assert(false);
    }
}
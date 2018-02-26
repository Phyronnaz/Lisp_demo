#include <cassert>

#include "subr.h"

std::map<std::string, Object(*)(const std::vector<Object>&)> Subr::registered_subr;

Object Subr::apply_subr(const std::string& symbol, const std::vector<Object>& lvals)
{
    assert(subrp(symbol));
    return (*registered_subr[symbol])(lvals);
}

bool Subr::subrp(const std::string& symbol)
{
    return registered_subr.count(symbol) > 0;
}

void Subr::register_subr(const std::string& symbol, Object(* ptr)(const std::vector<Object>&))
{
    assert(registered_subr.count(symbol) == 0);
    registered_subr[symbol] = ptr;
}

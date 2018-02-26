#include <string>
#include <iostream>
#include <cassert>
#include <exception.h>
#include <sstream>

#include "Object/object.h"
#include "cell.h"
#include "garbage_collector.h"

using namespace std;

Object nil()
{
    static Cell_Symbol c("nil");
    c.no_GC = 1;
    return &c;
}

bool null(const Object& l)
{
    return l == nil();
}

Object t()
{
    static Cell_Symbol c("t");
    c.no_GC = 1;
    return &c;
}

Object cons(const Object& a, const Object& l)
{
    return NewObject<Cell_Pair>(a, l);
}

Object car(const Object& l)
{
    if(listp(l))
    {
        return (dynamic_cast<Cell_Pair*>(l))->get_car();
    }
    else
    {
        throw LispException("Cannot take car of such object: " + print_object(l));
    }
}

Object cdr(const Object& l)
{
    if(listp(l))
    {
        return (dynamic_cast<Cell_Pair*>(l))->get_cdr();
    }
    else
    {
        throw LispException("Cannot take cdr of such object: " + print_object(l));
    }
}

Object number_to_Object(int n)
{
    return NewObject<Cell_Number>(n);
}

Object string_to_Object(const std::string& s)
{
    return NewObject<Cell_String>(s);
}

Object symbol_to_Object(const std::string& s)
{
    return NewObject<Cell_Symbol>(s);
}

Object bool_to_Object(bool b)
{
    if(b) return t();
    return nil();
}

int Object_to_number(const Object& l)
{
    if(numberp(l))
    {
        return (dynamic_cast<Cell_Number*>(l))->get_contents();
    }
    else
    {
        throw LispException("Not an int: " + print_object(l));
    }

}

string Object_to_string(const Object& l)
{
    if(stringp(l))
    {
        return (dynamic_cast<Cell_String*>(l))->get_contents();
    }
    else if(symbolp(l))
    {
        return (dynamic_cast<Cell_Symbol*>(l))->get_contents();
    }
    else
    {
        throw LispException("Not an string nor a symbol: " + print_object(l));
    }
}

bool numberp(const Object& l)
{
    assert(l != nullptr);
    return (l->get_sort() == Cell::sort::NUMBER);
}

bool stringp(const Object& l)
{
    assert(l != nullptr);
    return (l->get_sort() == Cell::sort::STRING);
}

bool symbolp(const Object& l)
{
    assert(l != nullptr);
    return (l->get_sort() == Cell::sort::SYMBOL);
}

bool listp(const Object& l)
{
    assert(l != nullptr);
    return (l->get_sort() == Cell::sort::PAIR);
}

static void print_aux(ostream& s, const Object& l);

ostream& operator<<(ostream& s, const Object& l)
{
    if(null(l)) return s << "()";
    if(numberp(l)) return s << Object_to_number(l);
    if(stringp(l)) return s << Object_to_string(l);
    if(symbolp(l)) return s << Object_to_string(l);
    assert(listp(l));
    s << "(";
    print_aux(s, l);
    s << ")";
    return s;
}

std::string print_object(const Object& object)
{
    std::stringstream ss;
    ss << object;
    return ss.str();
}

static void print_aux(ostream& s, const Object& l)
{
    assert(listp(l));
    if(null(l)) return;
    if(null(cdr(l)))
    {
        s << car(l);
        return;
    }
    s << car(l) << " ";
    print_aux(s, cdr(l));
}

Object cadr(const Object& l)
{
    return car(cdr(l));
}

Object cddr(const Object& l)
{
    return cdr(cdr(l));
}

Object caddr(const Object& l)
{
    return car(cddr(l));
}

Object cdddr(const Object& l)
{
    return cdr(cddr(l));
}

Object cadddr(const Object& l)
{
    return car(cdddr(l));
}

bool eq(const Object& a, const Object& b)
{
    assert(a != nullptr);
    assert(b != nullptr);
    if(a->get_sort() != b->get_sort()) return false;
    if(numberp(a)) return Object_to_number(a) == Object_to_number(b);
    if(stringp(a) || symbolp(a))
    { return Object_to_string(a) == Object_to_string(b); }
    else
    {
        assert(listp(a));
        if(listp(b))
        {
            return eq(car(a), car(b)) && eq(cdr(a), cdr(b));
        }
        else
        {
            return false;
        }
    }
}

void CleanGC(std::vector<Object>& valid_objects)
{
    GC::CleanGC(valid_objects);
}

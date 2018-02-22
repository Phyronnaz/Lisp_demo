#include <string>
#include <iostream>
#include <cassert>

#include "object.h"
#include "cell.h"

using namespace std;

Object nil()
{
    static Cell* c = new Cell_Symbol("nil");
    // clog << "nil: " << (void *)c << endl;
    return c;
}

bool null(const Object& l)
{
    return l == nil();
}

Object t()
{
    static Cell* c = new Cell_Symbol("t");
    return c;
}

Object cons(const Object& a, const Object& l)
{
    return new Cell_Pair(a, l);
}

Object car(const Object& l)
{
    assert(listp(l));
    return (dynamic_cast<Cell_Pair*>(l))->get_car();
}

Object cdr(const Object& l)
{
    assert(listp(l));
    return (dynamic_cast<Cell_Pair*>(l))->get_cdr();
}

Object number_to_Object(int n)
{
    return new Cell_Number(n);
}

Object string_to_Object(const std::string& s)
{
    return new Cell_String(s);
}

Object symbol_to_Object(const std::string& s)
{
    return new Cell_Symbol(s);
}

Object bool_to_Object(bool b)
{
    if(b) return t();
    return nil();
}

int Object_to_number(const Object& l)
{
    assert(numberp(l));
    return (dynamic_cast<Cell_Number*>(l))->get_contents();
}

string Object_to_string(const Object& l)
{
    assert(stringp(l) || symbolp(l));
    if(stringp(l))
    {
        return (dynamic_cast<Cell_String*>(l))->get_contents();
    }
    if(symbolp(l))
    {
        return (dynamic_cast<Cell_Symbol*>(l))->get_contents();
    }
    assert(false);
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
    if(stringp(a) || symbolp(a)) return Object_to_string(a) == Object_to_string(b);
    return a == b;
}

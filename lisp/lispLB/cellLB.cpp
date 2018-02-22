#include <iostream>
#include "cell.h"

using namespace std;

static void trace(string s)
{
//    clog << s;
}

/*****************************/

Cell_Number::Cell_Number(int _contents) : contents(_contents)
{
    trace("n");
}

Cell::sort Cell_Number::get_sort() const
{
    return sort::NUMBER;
}

int Cell_Number::get_contents() const
{
    return contents;
}

/*****************************/

Cell_String::Cell_String(string _contents) : contents(_contents)
{
    trace("t");
}

Cell::sort Cell_String::get_sort() const
{
    return sort::STRING;
}

string Cell_String::get_contents() const
{
    return contents;
}

/*****************************/

Cell_Symbol::Cell_Symbol(string _contents) : contents(_contents)
{
    trace("s");
}

Cell::sort Cell_Symbol::get_sort() const
{
    return sort::SYMBOL;
}

string Cell_Symbol::get_contents() const
{
    return contents;
}

/*****************************/

Cell_Pair::Cell_Pair(Cell* _car, Cell* _cdr) : car(_car), cdr(_cdr)
{
    trace("p");
}

Cell::sort Cell_Pair::get_sort() const
{
    return sort::PAIR;
}

Cell* Cell_Pair::get_car() const
{
    return car;
}

Cell* Cell_Pair::get_cdr() const
{
    return cdr;
}
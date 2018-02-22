#pragma once

#include <iostream>
#include <string>

using Object = class Cell*;

Object nil();
bool null(const Object& l);
Object t();

Object cons(const Object& a, const Object& l);
Object car(const Object& l);
Object cdr(const Object& l);
bool eq(const Object& a, const Object& b);

Object number_to_Object(int n);
Object string_to_Object(const std::string& s);
Object symbol_to_Object(const std::string& s);
Object bool_to_Object(bool b);

int Object_to_number(const Object& l);
std::string Object_to_string(const Object& l);

bool numberp(const Object& l);
bool stringp(const Object& l);
bool symbolp(const Object& l);
bool listp(const Object& l);

std::ostream& operator << (std::ostream& s, const Object& l);

Object cadr(const Object& l);
Object cddr(const Object& l);
Object caddr(const Object& l);
Object cdddr(const Object& l);
Object cadddr(const Object& l);

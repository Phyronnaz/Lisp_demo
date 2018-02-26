#pragma once

#include <vector>
#include <iostream>
#include <string>

using Object = class Cell*;

/**
 * It is the default object used for the boolean false in Lisp. It cannot be deleted by the garbage collector.
 * @return  The constant object nil
 */
Object nil();
/**
 *
 * @param   l   The object we want to test if it's equal to nil
 * @return  True if l equals nil, otherwise false
 */
bool null(const Object& l);
/**
 * It is the default object used for the boolean true in Lisp. It cannot be deleted by the garbage collector.
 * @return  The constant object t
 */
Object t();
/**
 *
 * @param   a
 * @param   l
 * @return  Returns a list which head is a and tail is l
 */
Object cons(const Object& a, const Object& l);
/**
 *
 * @param   l   l is a list
 * @return  Returns the head of l
 */
Object car(const Object& l);
/**
 *
 * @param   l   l is a list
 * @return  Returns the tail of l
 */
Object cdr(const Object& l);
/**
 *
 * @param   a
 * @param   b
 * @return  Returns true if a equals b, else false
 */
bool eq(const Object& a, const Object& b);

/**
 *
 * @param   n
 * @return  Returns the object representing the integer n
 */
Object number_to_Object(int n);
/**
 *
 * @param   s
 * @return  Returns the object representing the string s
 */
Object string_to_Object(const std::string& s);
/**
 *
 * @param   s
 * @return  Returns the object representing the symbol s
 */
Object symbol_to_Object(const std::string& s);
/**
 *
 * @param   b
 * @return  Returns the object representing the boolean b
 */
Object bool_to_Object(bool b);

/**
 *
 * @param   l
 * @return  Returns the integer corresponding to the object l
 */
int Object_to_number(const Object& l);
/**
 *
 * @param   l
 * @return  Returns the string corresponding to the object l
 */
std::string Object_to_string(const Object& l);

/**
 *
 * @param   l
 * @return  Returns true if l represents a number
 */
bool numberp(const Object& l);
/**
 *
 * @param   l
 * @return  Returns true if l represents a string
 */
bool stringp(const Object& l);
/**
 *
 * @param   l
 * @return  Returns true if l represents a symbol
 */
bool symbolp(const Object& l);
/**
 *
 * @param   l
 * @return  Returns true if l is a list
 */
bool listp(const Object& l);

/**
 * Extends the operator << to objects
 * @param   s
 * @param   l
 * @return
 */
std::ostream& operator << (std::ostream& s, const Object& l);
/**
 *
 * @param   object
 * @return  Prints the number or the string corresponding to the object taken as parameter
 */
std::string print_object(const Object& object);

/**
 *
 * @param   l   l is a list
 * @return  Returns the head of the tail of l
 */
Object cadr(const Object& l);
Object cddr(const Object& l);
Object caddr(const Object& l);
Object cdddr(const Object& l);
Object cadddr(const Object& l);

/**
 * Deletes the unused objects
 * @param   valid_objects   Objects that are still used by the Lisp interpreter
 */
void CleanGC(std::vector<Object>& valid_objects);

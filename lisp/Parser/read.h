#pragma once

#include "Object/object.h"

/**
 *
 * @return Returns the object corresponding to the command line of the user
 */
Object read_object();
/**
 * Changes the place of the interpreter input to a file
 * @param   fh  A file we want to read
 */
void read_object_restart(FILE* fh);

Object get_object_from_string(const std::string& s);
#pragma once

using Object = class Cell*;

Object read_object();
void read_object_restart(FILE* fh);
Object get_object_from_string(const std::string& s);
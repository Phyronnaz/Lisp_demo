#include <iostream>
#include <sstream>
#include <cstring>

#include "Parser/read.h"
#include "Object/object.h"

using namespace std;


typedef struct yy_buffer_state* YY_BUFFER_STATE;

extern YY_BUFFER_STATE yy_scan_string(const char* yystr);

void yy_switch_to_buffer(YY_BUFFER_STATE new_buffer);

void yy_delete_buffer(YY_BUFFER_STATE b);

extern Object get_read_Object();

extern int yyparse();

extern void yyrestart(FILE* fh);

Object read_object()
{
    if(yyparse() != 0)
    {
        throw runtime_error("End of input stream");
    }
    Object l = get_read_Object();
    cout << "Read: " << l << endl;
    return l;
}

void read_object_restart(FILE* fh)
{
    yyrestart(fh);
}


Object get_object_from_string(const std::string& s)
{
    auto my_string = s.c_str();

    // add the second NULL terminator
    size_t len = strlen(my_string);
    char* temp = new char[len + 2];
    strcpy(temp, my_string);
    temp[len + 1] = 0; // The first NULL terminator is added by strcpy

    YY_BUFFER_STATE my_string_buffer = yy_scan_string(temp);
    yy_switch_to_buffer(my_string_buffer); // switch flex to the buffer we just created
    yyparse();
    yy_delete_buffer(my_string_buffer);
    return get_read_Object();
}

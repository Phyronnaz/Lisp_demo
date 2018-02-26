#include <iostream>
#include "exception.h"
#include "toplevel/toplevel.h"
#include "Parser/read.h"

using namespace std;

int main()
{
    Toplevel toplevel = Toplevel();
    while (true)
    {
        cout << "Lisp? " << flush;
        try
        {
            Object l = read_object();
            std::cout << toplevel.analyze(l) << std::endl;
        }
        catch (const LispException& error)
        {
            cout << error.what() << endl;
        }
    }
}

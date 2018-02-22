#include <iostream>
#include "toplevel/toplevel.h"
#include "Parser/read.h"

using namespace std;

int main()
{
    Toplevel toplevel = Toplevel();
    while (true)
    {
        //auto env = make_shared<Environment>(nullptr);
        cout << "Lisp? " << flush;
        try
        {
            Object l = read_object();
            toplevel.analyze(l);
        }
        catch (std::string& error)
        {
            cout << error << endl;
        }
    }
}

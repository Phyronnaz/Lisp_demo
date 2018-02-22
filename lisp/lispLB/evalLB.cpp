#include <object.h>

Object eval(Object object, const std::shared_ptr<Environment>& env)
{
    if(null(object))
    {
        return object;
    }
    else
    {
        auto sort = object->get_sort();
        switch (sort)
        {
            case Cell::sort::NUMBER:
                return object;
            case Cell::sort::STRING:
                return object;
            case Cell::sort::SYMBOL:
            {
                std::string s = Object_to_string(object);
                Object o = env->get_object_from_env(s);
                if(o)
                {
                    return o;
                }
                else
                {
                    std::string error_message = "Error: unknown variable " + s;
                    throw (error_message);
                }
            }
            case Cell::sort::PAIR:
            {
                switch (car(object)->get_sort())
                {
                    case Cell::sort::NUMBER:
                    {
                        std::string error_message = "Error: cannot apply a number";
                        throw (error_message);
                    }
                    case Cell::sort::STRING:
                    {
                        std::string error_message = "Error: cannot apply a string";
                        throw (error_message);
                    }
                    case Cell::sort::PAIR:
                    {
                        Object f = eval(car(object), env);
                        std::vector<Object> lvals;
                        map(lvals, cdr(object), env);
                        return apply(f, lvals, env);
                    }
                    case Cell::sort:
                    SYMBOL:

                        std::string symbol = Object_to_string(car(object));
                        if(symbol == "lambda")
                        {
                            return object;
                        }
                        else if(symbol == "quote")
                        {
                            return cadr(object);
                        }
                        else if(symbol == "if")
                        {
                            return do_if(cadr(object), caddr(object), cadddr(object), env);
                        }
                        else if(symbol == "progn")
                        {
                            if(cdr(object) != nullptr)
                            {
                                return do_progn(cdr(object), env);
                            }
                            else
                            {
                                return nil();
                            }
                        }
                        else if(symbol == "printenv")
                        {
                            std::cout << "<env>";
                            do_print_env(env);
                            return nil();
                        }
                        else
                        {
                            Object f = car(object);
                            std::vector<Object> lvals;
                            map(lvals, cdr(object), env);
                            return apply(f, lvals, env);
                        }
                }

            }
        }
    }
}

}
#include <cassert>
#include <iostream>

#include "environment.h"

std::shared_ptr<Environment> Environment::CreateChildEnv()
{
    return std::make_shared<Environment>(shared_from_this());
}

Object Environment::get_object_from_env(const std::string& name) const
{
    for (auto it = items.rbegin(); it != items.rend(); ++it)
    {
        if(it->name == name)
        {
            return (*it).object;
        }
    }

    if(prev)
    {
        return prev->get_object_from_env(name);
    }
    else
    {
        return nullptr;
    }
}

void Environment::add_object_to_env(const std::string& name, const Object& object)
{
    items.push_back({name, object});
}

void Environment::add_objects_to_env(const std::vector<std::string>& names, const std::vector<Object>& objects)
{
    assert(names.size() == objects.size());

    for (unsigned i = 0; i < names.size(); i++)
    {
        items.push_back({names[i], objects[i]});
    }
}

std::shared_ptr<Environment> Environment::MakeEnv()
{
    return std::make_shared<Environment>(nullptr);
}

void Environment::print()
{
    std::cout << "<env>";

    for (auto it = items.rbegin(); it != items.rend(); ++it)
    {
        std::cout << "\"" << (*it).name << "\" = " << (*it).object << "; ";
    }
    if(prev)
    {
        prev->print();
    }
}

void Environment::GetValidObjectsFromEnv(std::vector<Object>& valid_objects) const
{
    for (const Item& item : items)
    {
        valid_objects.push_back(item.object);
    }
    if(prev)
    {
        prev->GetValidObjectsFromEnv(valid_objects);
    }
}

std::shared_ptr<Environment> Environment::get_frame_where_symbol_defined(const std::string& symbol)
{
    for (auto it = items.rbegin(); it != items.rend(); ++it)
    {
        if(it->name == symbol)
        {
            return shared_from_this();
        }
    }

    if(prev)
    {
        return prev->get_frame_where_symbol_defined(symbol);
    }
    else
    {
        return nullptr;
    }
}

bool Environment::modify_frame_where_symbol_defined(const std::string& symbol, Object new_value)
{
    assert(this);
    unsigned int i = 0;
    while (i < items.size())
    {
        if (items.at(i).name == symbol)
        {
            items.at(i).object = new_value;
            return true;
        }
        i++;
    }
    return false;
}

Object Environment::get_definition(Object object)
{
    if (null(object))
    {
        return nil();
    }
    else if (numberp(object))
    {
        Object object_in_memory = get_object_from_env(std::to_string(Object_to_number(object)));
        if (object_in_memory)
        {
            return object_in_memory;
        }
        else
        {
            return object;
        }
    }
    else if (symbolp(object) || stringp(object))
    {
        Object object_in_memory = get_object_from_env(Object_to_string(object));
        if (object_in_memory)
        {
            return object_in_memory;
        }
        else
        {
            return object;
        }
    }
    else
    {
        assert(listp(object));
        return cons(get_definition(car(object)), get_definition(cdr(object)));
    }
}

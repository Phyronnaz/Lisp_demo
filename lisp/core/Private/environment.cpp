#include <cassert>
#include <iostream>

#include "environment.h"

std::shared_ptr<Environment> Environment::CreateChildEnv()
{
    return std::make_shared<Environment>(shared_from_this());
}

Object Environment::get_object_from_env(const std::string& name)
{
    assert(this);

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
    for (auto it = items.rbegin(); it != items.rend(); ++it)
    {
        std::cout << (*it).name << " -> " << (*it).object << std::endl;
    }
    if (prev)
    {
        prev->print();
    }
}

#include <cassert>
#include "environment.h"

std::shared_ptr<Environment> Environment::CreateChildEnv()
{
    return std::make_shared<Environment>(shared_from_this());
}

Object Environment::get_object_from_env(const std::string& name)
{
    assert(this);
    for (const auto& item : items)
    {
        if(item.name == name)
        {
            return item.object;
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

    for (uint32_t i = 0; i < names.size(); i++)
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
    for (int k = items.size()-1; k >= 0; k--) //last added objects are printed first
    {
        std::cout << items.at(k).name << " ";
        Object obj = items.at(k).object;
        switch (obj->get_sort())
        {
            case Cell::sort::NUMBER:
                std::cout << std::to_string(Object_to_number(obj));
                break;
            case Cell::sort::STRING:
                std::cout << Object_to_string(obj);
                break;
            case Cell::sort::SYMBOL:
                std::cout << Object_to_string(obj);
                break;
            case Cell::sort::PAIR:
                assert(false);
                break;
        }
    }
    if (prev)
    {
        prev->print();
    }
}

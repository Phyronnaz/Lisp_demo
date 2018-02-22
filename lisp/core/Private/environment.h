#pragma once

#include <string>
#include <utility>
#include <vector>
#include <memory>

using Object = class Cell*;

class Environment : public std::enable_shared_from_this<Environment>
{
public:
    static std::shared_ptr<Environment> MakeEnv();

    explicit Environment(const std::shared_ptr<Environment>& prev) : prev(prev)
    {}

    std::shared_ptr<Environment> CreateChildEnv();

    /**
     * Get the object with name from the environment. Return nullptr if not found
     * @param name  name to find
     * @return object, nullptr if not found
     */
    Object get_object_from_env(const std::string& name);

    void add_object_to_env(const std::string& name, const Object& object);

    void add_objects_to_env(const std::vector<std::string>& names, const std::vector<Object>& objects);

    void print();

private:

    struct Item
    {
        std::string name;
        Object object;
    };

    const std::shared_ptr<Environment> prev;
    std::vector<Item> items;
};
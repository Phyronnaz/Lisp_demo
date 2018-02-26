#pragma once

#include <type_traits>
#include <vector>

#include "Object/object.h"

/**
 * Garbage collector
 */
class GC
{
public:
    /**
     * Create a new object
     */
    template<typename T, typename... ArgTypes>
    static T* NewObject(ArgTypes&& ... args)
    {
        static_assert(std::is_base_of<Cell, T>::value, "invalid class");

        T* ptr = new T(args...);

        AddToGC(ptr);
        return ptr;
    }

    /**
     * Removed objects that are not in valid_objects
     * @param   valid_objects   objects that are still valid
     */
    static void CleanGC(std::vector<Object>& valid_objects);

private:

    struct Item
    {
        unsigned valid:1;
        Object object;
    };
    static std::vector<Item> items;
    static std::vector<unsigned> free;

    /**
     * Add an object to the GC
     */
    static void AddToGC(Object ptr);
};

/**
 * Create a new object
 */
template<typename T, typename... ArgTypes>
static T* NewObject(ArgTypes&& ... args)
{
    return GC::NewObject<T, ArgTypes...>(args...);
}
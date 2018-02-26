#include "garbage_collector.h"
#include "cell.h"

std::vector<GC::Item> GC::items;
std::vector<unsigned> GC::free;

void GC::CleanGC(std::vector<Object>& valid_objects)
{
    for (Item& item : items)
    {
        item.valid = 0;
    }

    std::vector<unsigned int> stack;
    for (Object& obj : valid_objects)
    {
        if(!obj->no_GC)
        {
            stack.push_back(obj->GC_id);
        }
    }

    while (!stack.empty())
    {
        unsigned int index = stack.back();
        stack.pop_back();

        if(!items[index].valid)
        {
            items[index].valid = 1;

            Cell_Pair* pair = dynamic_cast<Cell_Pair*>(items[index].object);
            if(pair)
            {
                Object car = pair->get_car();
                Object cdr = pair->get_cdr();
                if(!car->no_GC)
                {
                    stack.push_back(car->GC_id);
                }
                if(!cdr->no_GC)
                {
                    stack.push_back(cdr->GC_id);
                }
            }
        }
    }

    free.resize(0);
    for (Item& item : items)
    {
        if(!item.valid && item.object)
        {
            free.push_back(item.object->GC_id);
            delete item.object;
            item.object = nullptr;
        }
    }
}

void GC::AddToGC(Object ptr)
{
    if(free.empty())
    {
        items.push_back({1, ptr});
        ptr->GC_id = items.size() - 1;
    }
    else
    {
        unsigned int index = free.back();
        free.pop_back();

        items[index].object = ptr;
        ptr->GC_id = index;
    }
}

#include <vector>
#include <string>
#include <map>

#include "Object/object.h"

/**
 * Used to manage subroutines
 */
class Subr
{
public:
    /**
     * Apply subr symbol to the lvals args
     * @param   symbol  symbol
     * @param   lvals   arguments
     * @return  object
     */
    static Object apply_subr(const std::string& symbol, const std::vector<Object>& lvals);

    /**
     * Is symbol a subr?
     */
    static bool subrp(const std::string& symbol);

    /**
     * Register a new subr
     * @param   symbol  symbol of the new subr
     * @param   ptr     ptr to the new subr
     */
    static void register_subr(const std::string& symbol, Object(*ptr)(const std::vector<Object>&));

private:
    static std::map<std::string, Object(*)(const std::vector<Object>&)> registered_subr;
};
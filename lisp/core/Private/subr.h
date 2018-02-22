#include <vector>
#include <string>

using Object = class Cell*;

bool subrp(const std::string& s);
Object apply_subr(const std::string& s, const std::vector<Object>& lvals);

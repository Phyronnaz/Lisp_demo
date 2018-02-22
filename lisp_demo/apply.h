#pragma once

#include <vector>
#include <memory>

using Object = class Cell*;
class Environment;

Object apply(Object f, const std::vector<Object>& lvals, const std::shared_ptr<Environment>& env);
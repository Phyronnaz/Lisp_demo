#pragma once

#include "core/core.h"

class Toplevel
{
public:
    Toplevel();
    void analyze(Object object);

private:
    std::shared_ptr<Environment> env;
};


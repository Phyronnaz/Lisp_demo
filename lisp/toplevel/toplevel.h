#pragma once

#include "core/core.h"
/**
 * Used to manage the interface between the user and the interpreter
 */
class Toplevel
{
public:
    /**
     * Initializes the toplevel: creates the toplevel environment and defines the subroutines
     */
    Toplevel(bool init = true);
    /**
     * Analyzes the object and computes the corresponding command
     * @param object The object corresponding to the input of the user
     */
    std::string analyze(Object object);


private:
    std::shared_ptr<Environment> env;
};


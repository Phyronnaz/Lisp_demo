#pragma once

#include <vector>
#include <memory>

#include "Object/object.h"

class Environment;

/**
 * Core application function, where all the work is done
 * @param   f               the Lisp object to be applied
 * @param   lvals           the evaluated arguments
 * @param   env             the current environment
 * @param   initial_object  the initial input of the user into the Lisp interpreter used to compute continuation
 * @return  The result of the application of the function to the arguments in the environment
 */
Object apply(Object f, const std::vector<Object>& lvals, const std::shared_ptr<Environment>& env, Object initial_object);
#pragma once

#include <memory>

using Object = class Cell*;
using Env = std::shared_ptr<class Environment>;

/**
 * Allows the interpreter to compute objets in a given environment
 * @param object to be evaluated
 * @param env, environment of the evaluation
 * @return the evaluation of a given object in an environment
 */
Object eval(Object object, const Env& env);
Env MakeEnv();

bool is_setq(Object object, const Env& env);
void setq(Object object, const Env& env);
#pragma once

#include <memory>
#include <vector>

#include "Object/object.h"

using Env = std::shared_ptr<class Environment>;

/**
 * Allows the interpreter to compute objets in a given environment
 * @param object Object to be evaluated
 * @param env Environment of the evaluation
 * @param initial_object The initial input of the user into the Lisp interpreter
 * @return Returns the evaluation of a given object in an environment
 */
Object eval(Object object, const Env& env, Object initial_object);

/**
 *
 * @return Returns a new environment
 */
Env MakeEnv();
/**
 *
 * @param env The current environment
 * @param valid_objects Vector to be filled with the used objects
 */
void GetValidObjectsFromEnv(Env env, std::vector<Object>& valid_objects);

/**
 *
 * @param object
 * @return Returns true if the user command aims to define an object
 */
bool is_setq(Object object);
/**
 * Computes a define command
 * @param object A command that aims to define a new object
 * @param env The current environment
 * @param initial_object The initial input of the user in the interpreter Lisp
 * @return the object's name
 */
std::string setq(Object object, const Env& env, Object initial_object);
/**
 *
 * @param object
 * @return Returns true if the user command aims to modify a bind
 */
bool is_setbang(Object object);
/**
 * Computes a command that aims to modify a bind in the environment
 * @param object
 * @param env
 * @param initial_object
 * @return the object's name
 */
std::string setbang(Object object, const Env& env, Object initial_object);
/**
 *
 * @param object
 * @return Returns true if the object represents a subroutine
 */
bool is_subrp(Object object);
bool is_command(Object object, const std::string& command);

/**
 * Takes part in the initialization of the interpreter by defining the subroutines
 */
void init();

/**
 * Resets the debug step
 */
void init_debug_step();

/**
 * Changes the status of debug mode to the next value wanted by the user
 */
void actualise_debug_mode();
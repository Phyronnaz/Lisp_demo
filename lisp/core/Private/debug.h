#pragma once

#include <memory>

#include "Object/object.h"

class Environment;

/**
 * Used to manage debug mode
 */
class Debug
{
public:
    /**
     * @return true iif debug is active
     */
    static bool is_debug_mode_active();

    /**
     * @return the recursion degree
     */
    static int get_debug_step();

    /**
     * Increments the recursion degree
     */
    static void incr_debug_step();

    /**
    * Decrements the recursion degree
    */
    static void decr_debug_step();

    /**
     * Starts the debug
     */
    static void start_debug_mode();

    /**
     * Stops the debug
     */
    static void stop_debug_mode();

    /**
     * Inits the mandatory variables for debug mode
     */
    static void init();

    /**
     * Checks if debug mode has to change
     */
    static void actualise_debug_mode();

    /**
     * Calls to start the debug for the given object
     * @param object
     * @param env
     */
    static void new_call(Object object, const std::shared_ptr<Environment>& env);

    /**
     * Finish the debug on the given object
     * @param object
     */
    static void end_call(Object object);

    static void set_step_to_0();

private:
    /**
     * The current debug status
     */
    static bool debug_mode;

    /**
     * The current debug step
     */
    static int debug_step;

    /**
     * true iif debug mode has to change
     */
    static bool debug_mode_to_change;

    /**
     * Next value for debug mode that will be actualised
     */
    static bool next_value;
};


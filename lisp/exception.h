#pragma once

#include <stdexcept>

/**
 * Manages the exception due to wrong inputs from the user
 */
struct LispException : public std::runtime_error
{
    explicit LispException(std::string const& message) : std::runtime_error(message)
    {}
};
# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/victor/tmp/Lisp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/victor/tmp/Lisp/cmake-build

# Include any dependencies generated for this target.
include CMakeFiles/lisp_run.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lisp_run.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lisp_run.dir/flags.make

CMakeFiles/lisp_run.dir/main.cpp.o: CMakeFiles/lisp_run.dir/flags.make
CMakeFiles/lisp_run.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/lisp_run.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lisp_run.dir/main.cpp.o -c /home/victor/tmp/Lisp/main.cpp

CMakeFiles/lisp_run.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lisp_run.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/victor/tmp/Lisp/main.cpp > CMakeFiles/lisp_run.dir/main.cpp.i

CMakeFiles/lisp_run.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lisp_run.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/victor/tmp/Lisp/main.cpp -o CMakeFiles/lisp_run.dir/main.cpp.s

CMakeFiles/lisp_run.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/lisp_run.dir/main.cpp.o.requires

CMakeFiles/lisp_run.dir/main.cpp.o.provides: CMakeFiles/lisp_run.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/lisp_run.dir/build.make CMakeFiles/lisp_run.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/lisp_run.dir/main.cpp.o.provides

CMakeFiles/lisp_run.dir/main.cpp.o.provides.build: CMakeFiles/lisp_run.dir/main.cpp.o


# Object files for target lisp_run
lisp_run_OBJECTS = \
"CMakeFiles/lisp_run.dir/main.cpp.o"

# External object files for target lisp_run
lisp_run_EXTERNAL_OBJECTS =

lisp_run: CMakeFiles/lisp_run.dir/main.cpp.o
lisp_run: CMakeFiles/lisp_run.dir/build.make
lisp_run: lisp/liblisp.a
lisp_run: CMakeFiles/lisp_run.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable lisp_run"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lisp_run.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lisp_run.dir/build: lisp_run

.PHONY : CMakeFiles/lisp_run.dir/build

CMakeFiles/lisp_run.dir/requires: CMakeFiles/lisp_run.dir/main.cpp.o.requires

.PHONY : CMakeFiles/lisp_run.dir/requires

CMakeFiles/lisp_run.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lisp_run.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lisp_run.dir/clean

CMakeFiles/lisp_run.dir/depend:
	cd /home/victor/tmp/Lisp/cmake-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/victor/tmp/Lisp /home/victor/tmp/Lisp /home/victor/tmp/Lisp/cmake-build /home/victor/tmp/Lisp/cmake-build /home/victor/tmp/Lisp/cmake-build/CMakeFiles/lisp_run.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lisp_run.dir/depend


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
include lisp/CMakeFiles/lisp.dir/depend.make

# Include the progress variables for this target.
include lisp/CMakeFiles/lisp.dir/progress.make

# Include the compile flags for this target's objects.
include lisp/CMakeFiles/lisp.dir/flags.make

lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.o: lisp/CMakeFiles/lisp.dir/flags.make
lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.o: ../lisp/core/Private/core.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.o"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lisp.dir/core/Private/core.cpp.o -c /home/victor/tmp/Lisp/lisp/core/Private/core.cpp

lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lisp.dir/core/Private/core.cpp.i"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/victor/tmp/Lisp/lisp/core/Private/core.cpp > CMakeFiles/lisp.dir/core/Private/core.cpp.i

lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lisp.dir/core/Private/core.cpp.s"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/victor/tmp/Lisp/lisp/core/Private/core.cpp -o CMakeFiles/lisp.dir/core/Private/core.cpp.s

lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.o.requires:

.PHONY : lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.o.requires

lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.o.provides: lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.o.requires
	$(MAKE) -f lisp/CMakeFiles/lisp.dir/build.make lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.o.provides.build
.PHONY : lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.o.provides

lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.o.provides.build: lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.o


lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.o: lisp/CMakeFiles/lisp.dir/flags.make
lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.o: ../lisp/core/Private/apply.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.o"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lisp.dir/core/Private/apply.cpp.o -c /home/victor/tmp/Lisp/lisp/core/Private/apply.cpp

lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lisp.dir/core/Private/apply.cpp.i"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/victor/tmp/Lisp/lisp/core/Private/apply.cpp > CMakeFiles/lisp.dir/core/Private/apply.cpp.i

lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lisp.dir/core/Private/apply.cpp.s"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/victor/tmp/Lisp/lisp/core/Private/apply.cpp -o CMakeFiles/lisp.dir/core/Private/apply.cpp.s

lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.o.requires:

.PHONY : lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.o.requires

lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.o.provides: lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.o.requires
	$(MAKE) -f lisp/CMakeFiles/lisp.dir/build.make lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.o.provides.build
.PHONY : lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.o.provides

lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.o.provides.build: lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.o


lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.o: lisp/CMakeFiles/lisp.dir/flags.make
lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.o: ../lisp/core/Private/eval.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.o"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lisp.dir/core/Private/eval.cpp.o -c /home/victor/tmp/Lisp/lisp/core/Private/eval.cpp

lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lisp.dir/core/Private/eval.cpp.i"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/victor/tmp/Lisp/lisp/core/Private/eval.cpp > CMakeFiles/lisp.dir/core/Private/eval.cpp.i

lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lisp.dir/core/Private/eval.cpp.s"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/victor/tmp/Lisp/lisp/core/Private/eval.cpp -o CMakeFiles/lisp.dir/core/Private/eval.cpp.s

lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.o.requires:

.PHONY : lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.o.requires

lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.o.provides: lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.o.requires
	$(MAKE) -f lisp/CMakeFiles/lisp.dir/build.make lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.o.provides.build
.PHONY : lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.o.provides

lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.o.provides.build: lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.o


lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.o: lisp/CMakeFiles/lisp.dir/flags.make
lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.o: ../lisp/core/Private/subr.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.o"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lisp.dir/core/Private/subr.cpp.o -c /home/victor/tmp/Lisp/lisp/core/Private/subr.cpp

lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lisp.dir/core/Private/subr.cpp.i"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/victor/tmp/Lisp/lisp/core/Private/subr.cpp > CMakeFiles/lisp.dir/core/Private/subr.cpp.i

lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lisp.dir/core/Private/subr.cpp.s"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/victor/tmp/Lisp/lisp/core/Private/subr.cpp -o CMakeFiles/lisp.dir/core/Private/subr.cpp.s

lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.o.requires:

.PHONY : lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.o.requires

lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.o.provides: lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.o.requires
	$(MAKE) -f lisp/CMakeFiles/lisp.dir/build.make lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.o.provides.build
.PHONY : lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.o.provides

lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.o.provides.build: lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.o


lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.o: lisp/CMakeFiles/lisp.dir/flags.make
lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.o: ../lisp/core/Private/environment.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.o"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lisp.dir/core/Private/environment.cpp.o -c /home/victor/tmp/Lisp/lisp/core/Private/environment.cpp

lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lisp.dir/core/Private/environment.cpp.i"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/victor/tmp/Lisp/lisp/core/Private/environment.cpp > CMakeFiles/lisp.dir/core/Private/environment.cpp.i

lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lisp.dir/core/Private/environment.cpp.s"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/victor/tmp/Lisp/lisp/core/Private/environment.cpp -o CMakeFiles/lisp.dir/core/Private/environment.cpp.s

lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.o.requires:

.PHONY : lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.o.requires

lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.o.provides: lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.o.requires
	$(MAKE) -f lisp/CMakeFiles/lisp.dir/build.make lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.o.provides.build
.PHONY : lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.o.provides

lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.o.provides.build: lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.o


lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.o: lisp/CMakeFiles/lisp.dir/flags.make
lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.o: ../lisp/core/Private/set_q.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.o"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lisp.dir/core/Private/set_q.cpp.o -c /home/victor/tmp/Lisp/lisp/core/Private/set_q.cpp

lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lisp.dir/core/Private/set_q.cpp.i"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/victor/tmp/Lisp/lisp/core/Private/set_q.cpp > CMakeFiles/lisp.dir/core/Private/set_q.cpp.i

lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lisp.dir/core/Private/set_q.cpp.s"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/victor/tmp/Lisp/lisp/core/Private/set_q.cpp -o CMakeFiles/lisp.dir/core/Private/set_q.cpp.s

lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.o.requires:

.PHONY : lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.o.requires

lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.o.provides: lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.o.requires
	$(MAKE) -f lisp/CMakeFiles/lisp.dir/build.make lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.o.provides.build
.PHONY : lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.o.provides

lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.o.provides.build: lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.o


lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.o: lisp/CMakeFiles/lisp.dir/flags.make
lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.o: ../lisp/Object/Private/cell.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.o"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lisp.dir/Object/Private/cell.cpp.o -c /home/victor/tmp/Lisp/lisp/Object/Private/cell.cpp

lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lisp.dir/Object/Private/cell.cpp.i"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/victor/tmp/Lisp/lisp/Object/Private/cell.cpp > CMakeFiles/lisp.dir/Object/Private/cell.cpp.i

lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lisp.dir/Object/Private/cell.cpp.s"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/victor/tmp/Lisp/lisp/Object/Private/cell.cpp -o CMakeFiles/lisp.dir/Object/Private/cell.cpp.s

lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.o.requires:

.PHONY : lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.o.requires

lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.o.provides: lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.o.requires
	$(MAKE) -f lisp/CMakeFiles/lisp.dir/build.make lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.o.provides.build
.PHONY : lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.o.provides

lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.o.provides.build: lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.o


lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.o: lisp/CMakeFiles/lisp.dir/flags.make
lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.o: ../lisp/Object/Private/object.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.o"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lisp.dir/Object/Private/object.cpp.o -c /home/victor/tmp/Lisp/lisp/Object/Private/object.cpp

lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lisp.dir/Object/Private/object.cpp.i"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/victor/tmp/Lisp/lisp/Object/Private/object.cpp > CMakeFiles/lisp.dir/Object/Private/object.cpp.i

lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lisp.dir/Object/Private/object.cpp.s"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/victor/tmp/Lisp/lisp/Object/Private/object.cpp -o CMakeFiles/lisp.dir/Object/Private/object.cpp.s

lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.o.requires:

.PHONY : lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.o.requires

lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.o.provides: lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.o.requires
	$(MAKE) -f lisp/CMakeFiles/lisp.dir/build.make lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.o.provides.build
.PHONY : lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.o.provides

lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.o.provides.build: lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.o


lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o: lisp/CMakeFiles/lisp.dir/flags.make
lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o: ../lisp/Parser/Private/lisp.tab.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o -c /home/victor/tmp/Lisp/lisp/Parser/Private/lisp.tab.cpp

lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.i"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/victor/tmp/Lisp/lisp/Parser/Private/lisp.tab.cpp > CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.i

lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.s"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/victor/tmp/Lisp/lisp/Parser/Private/lisp.tab.cpp -o CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.s

lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o.requires:

.PHONY : lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o.requires

lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o.provides: lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o.requires
	$(MAKE) -f lisp/CMakeFiles/lisp.dir/build.make lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o.provides.build
.PHONY : lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o.provides

lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o.provides.build: lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o


lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o: lisp/CMakeFiles/lisp.dir/flags.make
lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o: ../lisp/Parser/Private/lisp.yy.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o -c /home/victor/tmp/Lisp/lisp/Parser/Private/lisp.yy.cpp

lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.i"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/victor/tmp/Lisp/lisp/Parser/Private/lisp.yy.cpp > CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.i

lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.s"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/victor/tmp/Lisp/lisp/Parser/Private/lisp.yy.cpp -o CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.s

lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o.requires:

.PHONY : lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o.requires

lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o.provides: lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o.requires
	$(MAKE) -f lisp/CMakeFiles/lisp.dir/build.make lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o.provides.build
.PHONY : lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o.provides

lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o.provides.build: lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o


lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.o: lisp/CMakeFiles/lisp.dir/flags.make
lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.o: ../lisp/Parser/Private/read.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.o"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lisp.dir/Parser/Private/read.cpp.o -c /home/victor/tmp/Lisp/lisp/Parser/Private/read.cpp

lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lisp.dir/Parser/Private/read.cpp.i"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/victor/tmp/Lisp/lisp/Parser/Private/read.cpp > CMakeFiles/lisp.dir/Parser/Private/read.cpp.i

lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lisp.dir/Parser/Private/read.cpp.s"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/victor/tmp/Lisp/lisp/Parser/Private/read.cpp -o CMakeFiles/lisp.dir/Parser/Private/read.cpp.s

lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.o.requires:

.PHONY : lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.o.requires

lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.o.provides: lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.o.requires
	$(MAKE) -f lisp/CMakeFiles/lisp.dir/build.make lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.o.provides.build
.PHONY : lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.o.provides

lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.o.provides.build: lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.o


lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o: lisp/CMakeFiles/lisp.dir/flags.make
lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o: ../lisp/toplevel/Private/toplevel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o -c /home/victor/tmp/Lisp/lisp/toplevel/Private/toplevel.cpp

lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.i"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/victor/tmp/Lisp/lisp/toplevel/Private/toplevel.cpp > CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.i

lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.s"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/victor/tmp/Lisp/lisp/toplevel/Private/toplevel.cpp -o CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.s

lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o.requires:

.PHONY : lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o.requires

lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o.provides: lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o.requires
	$(MAKE) -f lisp/CMakeFiles/lisp.dir/build.make lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o.provides.build
.PHONY : lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o.provides

lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o.provides.build: lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o


# Object files for target lisp
lisp_OBJECTS = \
"CMakeFiles/lisp.dir/core/Private/core.cpp.o" \
"CMakeFiles/lisp.dir/core/Private/apply.cpp.o" \
"CMakeFiles/lisp.dir/core/Private/eval.cpp.o" \
"CMakeFiles/lisp.dir/core/Private/subr.cpp.o" \
"CMakeFiles/lisp.dir/core/Private/environment.cpp.o" \
"CMakeFiles/lisp.dir/core/Private/set_q.cpp.o" \
"CMakeFiles/lisp.dir/Object/Private/cell.cpp.o" \
"CMakeFiles/lisp.dir/Object/Private/object.cpp.o" \
"CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o" \
"CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o" \
"CMakeFiles/lisp.dir/Parser/Private/read.cpp.o" \
"CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o"

# External object files for target lisp
lisp_EXTERNAL_OBJECTS =

lisp/liblisp.a: lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.o
lisp/liblisp.a: lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.o
lisp/liblisp.a: lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.o
lisp/liblisp.a: lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.o
lisp/liblisp.a: lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.o
lisp/liblisp.a: lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.o
lisp/liblisp.a: lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.o
lisp/liblisp.a: lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.o
lisp/liblisp.a: lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o
lisp/liblisp.a: lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o
lisp/liblisp.a: lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.o
lisp/liblisp.a: lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o
lisp/liblisp.a: lisp/CMakeFiles/lisp.dir/build.make
lisp/liblisp.a: lisp/CMakeFiles/lisp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/victor/tmp/Lisp/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Linking CXX static library liblisp.a"
	cd /home/victor/tmp/Lisp/cmake-build/lisp && $(CMAKE_COMMAND) -P CMakeFiles/lisp.dir/cmake_clean_target.cmake
	cd /home/victor/tmp/Lisp/cmake-build/lisp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lisp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lisp/CMakeFiles/lisp.dir/build: lisp/liblisp.a

.PHONY : lisp/CMakeFiles/lisp.dir/build

lisp/CMakeFiles/lisp.dir/requires: lisp/CMakeFiles/lisp.dir/core/Private/core.cpp.o.requires
lisp/CMakeFiles/lisp.dir/requires: lisp/CMakeFiles/lisp.dir/core/Private/apply.cpp.o.requires
lisp/CMakeFiles/lisp.dir/requires: lisp/CMakeFiles/lisp.dir/core/Private/eval.cpp.o.requires
lisp/CMakeFiles/lisp.dir/requires: lisp/CMakeFiles/lisp.dir/core/Private/subr.cpp.o.requires
lisp/CMakeFiles/lisp.dir/requires: lisp/CMakeFiles/lisp.dir/core/Private/environment.cpp.o.requires
lisp/CMakeFiles/lisp.dir/requires: lisp/CMakeFiles/lisp.dir/core/Private/set_q.cpp.o.requires
lisp/CMakeFiles/lisp.dir/requires: lisp/CMakeFiles/lisp.dir/Object/Private/cell.cpp.o.requires
lisp/CMakeFiles/lisp.dir/requires: lisp/CMakeFiles/lisp.dir/Object/Private/object.cpp.o.requires
lisp/CMakeFiles/lisp.dir/requires: lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.tab.cpp.o.requires
lisp/CMakeFiles/lisp.dir/requires: lisp/CMakeFiles/lisp.dir/Parser/Private/lisp.yy.cpp.o.requires
lisp/CMakeFiles/lisp.dir/requires: lisp/CMakeFiles/lisp.dir/Parser/Private/read.cpp.o.requires
lisp/CMakeFiles/lisp.dir/requires: lisp/CMakeFiles/lisp.dir/toplevel/Private/toplevel.cpp.o.requires

.PHONY : lisp/CMakeFiles/lisp.dir/requires

lisp/CMakeFiles/lisp.dir/clean:
	cd /home/victor/tmp/Lisp/cmake-build/lisp && $(CMAKE_COMMAND) -P CMakeFiles/lisp.dir/cmake_clean.cmake
.PHONY : lisp/CMakeFiles/lisp.dir/clean

lisp/CMakeFiles/lisp.dir/depend:
	cd /home/victor/tmp/Lisp/cmake-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/victor/tmp/Lisp /home/victor/tmp/Lisp/lisp /home/victor/tmp/Lisp/cmake-build /home/victor/tmp/Lisp/cmake-build/lisp /home/victor/tmp/Lisp/cmake-build/lisp/CMakeFiles/lisp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lisp/CMakeFiles/lisp.dir/depend


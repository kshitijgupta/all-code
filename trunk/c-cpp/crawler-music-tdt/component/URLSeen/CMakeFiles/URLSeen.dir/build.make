# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.6

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
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

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/luolei/crawler-for-music-tdt

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/luolei/crawler-for-music-tdt

# Include any dependencies generated for this target.
include component/URLSeen/CMakeFiles/URLSeen.dir/depend.make

# Include the progress variables for this target.
include component/URLSeen/CMakeFiles/URLSeen.dir/progress.make

# Include the compile flags for this target's objects.
include component/URLSeen/CMakeFiles/URLSeen.dir/flags.make

component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.o: component/URLSeen/CMakeFiles/URLSeen.dir/flags.make
component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.o: component/URLSeen/URLSeen.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/luolei/crawler-for-music-tdt/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.o"
	cd /home/luolei/crawler-for-music-tdt/component/URLSeen && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/URLSeen.dir/URLSeen.cpp.o -c /home/luolei/crawler-for-music-tdt/component/URLSeen/URLSeen.cpp

component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/URLSeen.dir/URLSeen.cpp.i"
	cd /home/luolei/crawler-for-music-tdt/component/URLSeen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/luolei/crawler-for-music-tdt/component/URLSeen/URLSeen.cpp > CMakeFiles/URLSeen.dir/URLSeen.cpp.i

component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/URLSeen.dir/URLSeen.cpp.s"
	cd /home/luolei/crawler-for-music-tdt/component/URLSeen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/luolei/crawler-for-music-tdt/component/URLSeen/URLSeen.cpp -o CMakeFiles/URLSeen.dir/URLSeen.cpp.s

component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.o.requires:
.PHONY : component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.o.requires

component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.o.provides: component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.o.requires
	$(MAKE) -f component/URLSeen/CMakeFiles/URLSeen.dir/build.make component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.o.provides.build
.PHONY : component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.o.provides

component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.o.provides.build: component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.o
.PHONY : component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.o.provides.build

# Object files for target URLSeen
URLSeen_OBJECTS = \
"CMakeFiles/URLSeen.dir/URLSeen.cpp.o"

# External object files for target URLSeen
URLSeen_EXTERNAL_OBJECTS =

component/URLSeen/libURLSeen.a: component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.o
component/URLSeen/libURLSeen.a: component/URLSeen/CMakeFiles/URLSeen.dir/build.make
component/URLSeen/libURLSeen.a: component/URLSeen/CMakeFiles/URLSeen.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libURLSeen.a"
	cd /home/luolei/crawler-for-music-tdt/component/URLSeen && $(CMAKE_COMMAND) -P CMakeFiles/URLSeen.dir/cmake_clean_target.cmake
	cd /home/luolei/crawler-for-music-tdt/component/URLSeen && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/URLSeen.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
component/URLSeen/CMakeFiles/URLSeen.dir/build: component/URLSeen/libURLSeen.a
.PHONY : component/URLSeen/CMakeFiles/URLSeen.dir/build

component/URLSeen/CMakeFiles/URLSeen.dir/requires: component/URLSeen/CMakeFiles/URLSeen.dir/URLSeen.cpp.o.requires
.PHONY : component/URLSeen/CMakeFiles/URLSeen.dir/requires

component/URLSeen/CMakeFiles/URLSeen.dir/clean:
	cd /home/luolei/crawler-for-music-tdt/component/URLSeen && $(CMAKE_COMMAND) -P CMakeFiles/URLSeen.dir/cmake_clean.cmake
.PHONY : component/URLSeen/CMakeFiles/URLSeen.dir/clean

component/URLSeen/CMakeFiles/URLSeen.dir/depend:
	cd /home/luolei/crawler-for-music-tdt && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/luolei/crawler-for-music-tdt /home/luolei/crawler-for-music-tdt/component/URLSeen /home/luolei/crawler-for-music-tdt /home/luolei/crawler-for-music-tdt/component/URLSeen /home/luolei/crawler-for-music-tdt/component/URLSeen/CMakeFiles/URLSeen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : component/URLSeen/CMakeFiles/URLSeen.dir/depend


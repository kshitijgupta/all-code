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
include component/ris/CMakeFiles/ris.dir/depend.make

# Include the progress variables for this target.
include component/ris/CMakeFiles/ris.dir/progress.make

# Include the compile flags for this target's objects.
include component/ris/CMakeFiles/ris.dir/flags.make

component/ris/CMakeFiles/ris.dir/ris.cpp.o: component/ris/CMakeFiles/ris.dir/flags.make
component/ris/CMakeFiles/ris.dir/ris.cpp.o: component/ris/ris.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/luolei/crawler-for-music-tdt/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object component/ris/CMakeFiles/ris.dir/ris.cpp.o"
	cd /home/luolei/crawler-for-music-tdt/component/ris && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ris.dir/ris.cpp.o -c /home/luolei/crawler-for-music-tdt/component/ris/ris.cpp

component/ris/CMakeFiles/ris.dir/ris.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ris.dir/ris.cpp.i"
	cd /home/luolei/crawler-for-music-tdt/component/ris && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/luolei/crawler-for-music-tdt/component/ris/ris.cpp > CMakeFiles/ris.dir/ris.cpp.i

component/ris/CMakeFiles/ris.dir/ris.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ris.dir/ris.cpp.s"
	cd /home/luolei/crawler-for-music-tdt/component/ris && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/luolei/crawler-for-music-tdt/component/ris/ris.cpp -o CMakeFiles/ris.dir/ris.cpp.s

component/ris/CMakeFiles/ris.dir/ris.cpp.o.requires:
.PHONY : component/ris/CMakeFiles/ris.dir/ris.cpp.o.requires

component/ris/CMakeFiles/ris.dir/ris.cpp.o.provides: component/ris/CMakeFiles/ris.dir/ris.cpp.o.requires
	$(MAKE) -f component/ris/CMakeFiles/ris.dir/build.make component/ris/CMakeFiles/ris.dir/ris.cpp.o.provides.build
.PHONY : component/ris/CMakeFiles/ris.dir/ris.cpp.o.provides

component/ris/CMakeFiles/ris.dir/ris.cpp.o.provides.build: component/ris/CMakeFiles/ris.dir/ris.cpp.o
.PHONY : component/ris/CMakeFiles/ris.dir/ris.cpp.o.provides.build

# Object files for target ris
ris_OBJECTS = \
"CMakeFiles/ris.dir/ris.cpp.o"

# External object files for target ris
ris_EXTERNAL_OBJECTS =

component/ris/libris.a: component/ris/CMakeFiles/ris.dir/ris.cpp.o
component/ris/libris.a: component/ris/CMakeFiles/ris.dir/build.make
component/ris/libris.a: component/ris/CMakeFiles/ris.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libris.a"
	cd /home/luolei/crawler-for-music-tdt/component/ris && $(CMAKE_COMMAND) -P CMakeFiles/ris.dir/cmake_clean_target.cmake
	cd /home/luolei/crawler-for-music-tdt/component/ris && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ris.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
component/ris/CMakeFiles/ris.dir/build: component/ris/libris.a
.PHONY : component/ris/CMakeFiles/ris.dir/build

component/ris/CMakeFiles/ris.dir/requires: component/ris/CMakeFiles/ris.dir/ris.cpp.o.requires
.PHONY : component/ris/CMakeFiles/ris.dir/requires

component/ris/CMakeFiles/ris.dir/clean:
	cd /home/luolei/crawler-for-music-tdt/component/ris && $(CMAKE_COMMAND) -P CMakeFiles/ris.dir/cmake_clean.cmake
.PHONY : component/ris/CMakeFiles/ris.dir/clean

component/ris/CMakeFiles/ris.dir/depend:
	cd /home/luolei/crawler-for-music-tdt && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/luolei/crawler-for-music-tdt /home/luolei/crawler-for-music-tdt/component/ris /home/luolei/crawler-for-music-tdt /home/luolei/crawler-for-music-tdt/component/ris /home/luolei/crawler-for-music-tdt/component/ris/CMakeFiles/ris.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : component/ris/CMakeFiles/ris.dir/depend


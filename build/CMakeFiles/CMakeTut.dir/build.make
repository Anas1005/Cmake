# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/anassaif/CMakeTut

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/anassaif/CMakeTut/build

# Include any dependencies generated for this target.
include CMakeFiles/CMakeTut.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/CMakeTut.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/CMakeTut.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/CMakeTut.dir/flags.make

CMakeFiles/CMakeTut.dir/src/main.cpp.o: CMakeFiles/CMakeTut.dir/flags.make
CMakeFiles/CMakeTut.dir/src/main.cpp.o: ../src/main.cpp
CMakeFiles/CMakeTut.dir/src/main.cpp.o: CMakeFiles/CMakeTut.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/anassaif/CMakeTut/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/CMakeTut.dir/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/CMakeTut.dir/src/main.cpp.o -MF CMakeFiles/CMakeTut.dir/src/main.cpp.o.d -o CMakeFiles/CMakeTut.dir/src/main.cpp.o -c /home/anassaif/CMakeTut/src/main.cpp

CMakeFiles/CMakeTut.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/CMakeTut.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anassaif/CMakeTut/src/main.cpp > CMakeFiles/CMakeTut.dir/src/main.cpp.i

CMakeFiles/CMakeTut.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/CMakeTut.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anassaif/CMakeTut/src/main.cpp -o CMakeFiles/CMakeTut.dir/src/main.cpp.s

# Object files for target CMakeTut
CMakeTut_OBJECTS = \
"CMakeFiles/CMakeTut.dir/src/main.cpp.o"

# External object files for target CMakeTut
CMakeTut_EXTERNAL_OBJECTS =

CMakeTut: CMakeFiles/CMakeTut.dir/src/main.cpp.o
CMakeTut: CMakeFiles/CMakeTut.dir/build.make
CMakeTut: libLibrary.a
CMakeTut: CMakeFiles/CMakeTut.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/anassaif/CMakeTut/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable CMakeTut"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/CMakeTut.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/CMakeTut.dir/build: CMakeTut
.PHONY : CMakeFiles/CMakeTut.dir/build

CMakeFiles/CMakeTut.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/CMakeTut.dir/cmake_clean.cmake
.PHONY : CMakeFiles/CMakeTut.dir/clean

CMakeFiles/CMakeTut.dir/depend:
	cd /home/anassaif/CMakeTut/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/anassaif/CMakeTut /home/anassaif/CMakeTut /home/anassaif/CMakeTut/build /home/anassaif/CMakeTut/build /home/anassaif/CMakeTut/build/CMakeFiles/CMakeTut.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/CMakeTut.dir/depend

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
CMAKE_SOURCE_DIR = /home/raiuny/projects/Socket/UDP

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/raiuny/projects/Socket/UDP/build

# Include any dependencies generated for this target.
include CMakeFiles/udpcli.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/udpcli.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/udpcli.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/udpcli.dir/flags.make

CMakeFiles/udpcli.dir/udpcli.c.o: CMakeFiles/udpcli.dir/flags.make
CMakeFiles/udpcli.dir/udpcli.c.o: ../udpcli.c
CMakeFiles/udpcli.dir/udpcli.c.o: CMakeFiles/udpcli.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/raiuny/projects/Socket/UDP/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/udpcli.dir/udpcli.c.o"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/udpcli.dir/udpcli.c.o -MF CMakeFiles/udpcli.dir/udpcli.c.o.d -o CMakeFiles/udpcli.dir/udpcli.c.o -c /home/raiuny/projects/Socket/UDP/udpcli.c

CMakeFiles/udpcli.dir/udpcli.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/udpcli.dir/udpcli.c.i"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/raiuny/projects/Socket/UDP/udpcli.c > CMakeFiles/udpcli.dir/udpcli.c.i

CMakeFiles/udpcli.dir/udpcli.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/udpcli.dir/udpcli.c.s"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/raiuny/projects/Socket/UDP/udpcli.c -o CMakeFiles/udpcli.dir/udpcli.c.s

# Object files for target udpcli
udpcli_OBJECTS = \
"CMakeFiles/udpcli.dir/udpcli.c.o"

# External object files for target udpcli
udpcli_EXTERNAL_OBJECTS =

bin/udpcli: CMakeFiles/udpcli.dir/udpcli.c.o
bin/udpcli: CMakeFiles/udpcli.dir/build.make
bin/udpcli: CMakeFiles/udpcli.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/raiuny/projects/Socket/UDP/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bin/udpcli"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/udpcli.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/udpcli.dir/build: bin/udpcli
.PHONY : CMakeFiles/udpcli.dir/build

CMakeFiles/udpcli.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/udpcli.dir/cmake_clean.cmake
.PHONY : CMakeFiles/udpcli.dir/clean

CMakeFiles/udpcli.dir/depend:
	cd /home/raiuny/projects/Socket/UDP/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/raiuny/projects/Socket/UDP /home/raiuny/projects/Socket/UDP /home/raiuny/projects/Socket/UDP/build /home/raiuny/projects/Socket/UDP/build /home/raiuny/projects/Socket/UDP/build/CMakeFiles/udpcli.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/udpcli.dir/depend


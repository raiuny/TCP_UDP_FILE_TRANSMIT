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
CMAKE_SOURCE_DIR = /home/raiuny/projects/Socket/TCP

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/raiuny/projects/Socket/TCP/build

# Include any dependencies generated for this target.
include CMakeFiles/tcpcli.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/tcpcli.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/tcpcli.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/tcpcli.dir/flags.make

CMakeFiles/tcpcli.dir/tcpcli.c.o: CMakeFiles/tcpcli.dir/flags.make
CMakeFiles/tcpcli.dir/tcpcli.c.o: ../tcpcli.c
CMakeFiles/tcpcli.dir/tcpcli.c.o: CMakeFiles/tcpcli.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/raiuny/projects/Socket/TCP/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/tcpcli.dir/tcpcli.c.o"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/tcpcli.dir/tcpcli.c.o -MF CMakeFiles/tcpcli.dir/tcpcli.c.o.d -o CMakeFiles/tcpcli.dir/tcpcli.c.o -c /home/raiuny/projects/Socket/TCP/tcpcli.c

CMakeFiles/tcpcli.dir/tcpcli.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tcpcli.dir/tcpcli.c.i"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/raiuny/projects/Socket/TCP/tcpcli.c > CMakeFiles/tcpcli.dir/tcpcli.c.i

CMakeFiles/tcpcli.dir/tcpcli.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tcpcli.dir/tcpcli.c.s"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/raiuny/projects/Socket/TCP/tcpcli.c -o CMakeFiles/tcpcli.dir/tcpcli.c.s

# Object files for target tcpcli
tcpcli_OBJECTS = \
"CMakeFiles/tcpcli.dir/tcpcli.c.o"

# External object files for target tcpcli
tcpcli_EXTERNAL_OBJECTS =

bin/tcpcli: CMakeFiles/tcpcli.dir/tcpcli.c.o
bin/tcpcli: CMakeFiles/tcpcli.dir/build.make
bin/tcpcli: CMakeFiles/tcpcli.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/raiuny/projects/Socket/TCP/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bin/tcpcli"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tcpcli.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/tcpcli.dir/build: bin/tcpcli
.PHONY : CMakeFiles/tcpcli.dir/build

CMakeFiles/tcpcli.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tcpcli.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tcpcli.dir/clean

CMakeFiles/tcpcli.dir/depend:
	cd /home/raiuny/projects/Socket/TCP/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/raiuny/projects/Socket/TCP /home/raiuny/projects/Socket/TCP /home/raiuny/projects/Socket/TCP/build /home/raiuny/projects/Socket/TCP/build /home/raiuny/projects/Socket/TCP/build/CMakeFiles/tcpcli.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tcpcli.dir/depend


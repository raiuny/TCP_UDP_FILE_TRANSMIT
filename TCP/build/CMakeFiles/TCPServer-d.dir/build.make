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
include CMakeFiles/TCPServer-d.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/TCPServer-d.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/TCPServer-d.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/TCPServer-d.dir/flags.make

CMakeFiles/TCPServer-d.dir/TCPServer.c.o: CMakeFiles/TCPServer-d.dir/flags.make
CMakeFiles/TCPServer-d.dir/TCPServer.c.o: ../TCPServer.c
CMakeFiles/TCPServer-d.dir/TCPServer.c.o: CMakeFiles/TCPServer-d.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/raiuny/projects/Socket/TCP/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/TCPServer-d.dir/TCPServer.c.o"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/TCPServer-d.dir/TCPServer.c.o -MF CMakeFiles/TCPServer-d.dir/TCPServer.c.o.d -o CMakeFiles/TCPServer-d.dir/TCPServer.c.o -c /home/raiuny/projects/Socket/TCP/TCPServer.c

CMakeFiles/TCPServer-d.dir/TCPServer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/TCPServer-d.dir/TCPServer.c.i"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/raiuny/projects/Socket/TCP/TCPServer.c > CMakeFiles/TCPServer-d.dir/TCPServer.c.i

CMakeFiles/TCPServer-d.dir/TCPServer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/TCPServer-d.dir/TCPServer.c.s"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/raiuny/projects/Socket/TCP/TCPServer.c -o CMakeFiles/TCPServer-d.dir/TCPServer.c.s

# Object files for target TCPServer-d
TCPServer__d_OBJECTS = \
"CMakeFiles/TCPServer-d.dir/TCPServer.c.o"

# External object files for target TCPServer-d
TCPServer__d_EXTERNAL_OBJECTS =

bin/TCPServer-d: CMakeFiles/TCPServer-d.dir/TCPServer.c.o
bin/TCPServer-d: CMakeFiles/TCPServer-d.dir/build.make
bin/TCPServer-d: CMakeFiles/TCPServer-d.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/raiuny/projects/Socket/TCP/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bin/TCPServer-d"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TCPServer-d.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/TCPServer-d.dir/build: bin/TCPServer-d
.PHONY : CMakeFiles/TCPServer-d.dir/build

CMakeFiles/TCPServer-d.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/TCPServer-d.dir/cmake_clean.cmake
.PHONY : CMakeFiles/TCPServer-d.dir/clean

CMakeFiles/TCPServer-d.dir/depend:
	cd /home/raiuny/projects/Socket/TCP/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/raiuny/projects/Socket/TCP /home/raiuny/projects/Socket/TCP /home/raiuny/projects/Socket/TCP/build /home/raiuny/projects/Socket/TCP/build /home/raiuny/projects/Socket/TCP/build/CMakeFiles/TCPServer-d.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/TCPServer-d.dir/depend


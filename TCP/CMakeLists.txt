cmake_minimum_required(VERSION 3.22)

project(TCP)
set(CMAKE_C_COMPILER gcc)

add_executable(TCPServer TCPServer.c)
add_executable(TCPServer-d TCPServer.c)
add_executable(tcpcli tcpcli.c)
add_executable(copy copy.c)

set_target_properties(TCPServer-d PROPERTIES LINK_FLAGS "-static")

set(EXECUTABLE_OUTPUT_PATH "./bin")
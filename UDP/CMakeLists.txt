cmake_minimum_required(VERSION 3.22)

project(UDP)
set(CMAKE_C_COMPILER gcc)

add_executable(UDPServer UDPServer.c)
add_executable(UDPServer-d UDPServer.c)
add_executable(udpcli udpcli.c)

set_target_properties(UDPServer-d PROPERTIES LINK_FLAGS "-static")

set(EXECUTABLE_OUTPUT_PATH "./bin")
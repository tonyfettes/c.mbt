cmake_minimum_required(VERSION 3.19)
project(c.mbt)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_VERBOSE_MAKEFILE on)

include(cmake/MoonBit.cmake)

add_moon_package(src)
add_moon_module(test)

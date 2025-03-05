cmake_minimum_required(VERSION 3.19)
project(c.mbt LANGUAGES C)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_VERBOSE_MAKEFILE on)

include(cmake/MoonBit.cmake)

setup_moonbit_module(.)

add_library(c.mbt::moonbit ALIAS moonbit)
add_library(c.mbt STATIC src/c.c)
add_library(c.mbt::c.mbt ALIAS c.mbt)
target_link_libraries(c.mbt PRIVATE moonbit)

include(GNUInstallDirs)
install(
  TARGETS c.mbt moonbit
  EXPORT c.mbt-targets
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
install(
  EXPORT c.mbt-targets
  NAMESPACE c.mbt::
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/c.mbt
  FILE c.mbt-targets.cmake)
export(EXPORT c.mbt-targets FILE ${CMAKE_CURRENT_BINARY_DIR}/c.mbt-targets.cmake)
include(CMakePackageConfigHelpers)
configure_package_config_file(
  ${CMAKE_CURRENT_LIST_DIR}/cmake/config.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/c.mbt-config.cmake
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/c.mbt
)
install(FILES
  ${CMAKE_CURRENT_BINARY_DIR}/c.mbt-config.cmake
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/c.mbt
)

add_moon_module(test)

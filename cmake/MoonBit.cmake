include(CMakePrintHelpers)
set(MOON_HOME "$ENV{MOON_HOME}")

function(setup_moonbit_module directory)
  file(READ ${CMAKE_CURRENT_SOURCE_DIR}/${directory}/moon.mod.json MOON_MOD_JSON)
  string(JSON
    MOON_CURRENT_SOURCE_DIR
    ERROR_VARIABLE MOON_CURRENT_SOURCE_DIR_ERROR
    GET ${MOON_MOD_JSON} source)
  if(NOT MOON_CURRENT_SOURCE_DIR_ERROR STREQUAL NOTFOUND)
    set(MOON_CURRENT_SOURCE_DIR ${directory})
  endif()
  string(JSON
    MOON_CURRENT_TARGET_DIR
    ERROR_VARIABLE MOON_CURRENT_TARGET_DIR_ERROR
    GET ${MOON_MOD_JSON} source)
  if(NOT MOON_CURRENT_TARGET_DIR_ERROR STREQUAL NOTFOUND)
    set(MOON_CURRENT_TARGET_DIR ${MOON_CURRENT_SOURCE_DIR}/target)
  endif()
  set(MOON_CURRENT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${MOON_CURRENT_SOURCE_DIR} PARENT_SCOPE)
  cmake_print_variables(MOON_CURRENT_SOURCE_DIR)
  set(MOON_CURRENT_TARGET_DIR ${CMAKE_CURRENT_BINARY_DIR}/${MOON_CURRENT_TARGET_DIR} PARENT_SCOPE)
  cmake_print_variables(MOON_CURRENT_TARGET_DIR)
endfunction()

setup_moonbit_module(.)

add_library(moonbit INTERFACE)
target_include_directories(moonbit INTERFACE "${MOON_HOME}/include")

function(add_moon_executable target_name)
  cmake_print_variables(MOON_CURRENT_SOURCE_DIR)
  file(RELATIVE_PATH MOON_CURRENT_PACKAGE ${MOON_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR})
  cmake_print_variables(MOON_CURRENT_PACKAGE)
  add_moon_custom_target(${target_name})
  add_executable(
    ${target_name}
    ${MOON_CURRENT_TARGET_DIR}/native/release/build/${MOON_CURRENT_PACKAGE}/${target_name}.c)
  target_link_libraries(${target_name} PRIVATE moonbit)
  install(TARGETS ${target_name} RUNTIME DESTINATION bin)
endfunction()

function(add_moon_custom_target target_name)
  add_custom_target(
    ${target_name}-moon
    COMMAND moon build --target=native --directory ${MOON_CURRENT_SOURCE_DIR}
      --target-dir ${MOON_CURRENT_TARGET_DIR}
    BYPRODUCTS
      ${MOON_CURRENT_TARGET_DIR}/native/release/build/${MOON_CURRENT_PACKAGE}/${target_name}.c
      ${MOON_CURRENT_TARGET_DIR}/native/release/build/${MOON_CURRENT_PACKAGE}/${target_name}.exe)
endfunction()

function(add_moon_module directory)
  setup_moonbit_module(${directory})
  cmake_print_variables(MOON_CURRENT_SOURCE_DIR)
  add_subdirectory(${directory})
endfunction()

function(add_moon_package directory)
  add_subdirectory(${directory})
endfunction()

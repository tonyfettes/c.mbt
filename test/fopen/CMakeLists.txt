add_moon_executable(fopen)
target_link_libraries(fopen PRIVATE c.mbt::c.mbt)
add_test(NAME fopen COMMAND fopen DEPENDS fopen)

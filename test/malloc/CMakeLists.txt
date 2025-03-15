add_moon_executable(malloc)
target_sources(malloc PRIVATE malloc.c)
target_link_libraries(malloc PRIVATE c.mbt::c.mbt)
add_test(NAME malloc COMMAND malloc DEPENDS malloc)

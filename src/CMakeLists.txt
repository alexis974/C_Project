### CMakeLists of src ###

include_directories(
    .
    )

add_executable(project_name
    main.c
    )

# Here you can add library to be link to your project
target_link_libraries(project_name PUBLIC
    )

set_target_properties(project_name PROPERTIES
    C_STANDARD 99
    C_EXTENSIONS OFF
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}
    )

target_compile_options(project_name PUBLIC
    "-Wall"
    "-Werror"
    "-Wextra"
    "-pedantic"
    )

if ((${CMAKE_BUILD_TYPE} STREQUAL "Debug"))
    target_compile_options(project_name PUBLIC "-g3")
    find_library(ASAN asan) # Try to find the asan lib for leak checking
    if (EXISTS ${ASAN})
        target_compile_options(project_name PUBLIC "-fsanitize=address")
        target_link_libraries(project_name PUBLIC ${ASAN})
    endif()
endif()

# This is used to add feature test macros
target_compile_definitions(project_name PRIVATE
    )

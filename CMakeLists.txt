cmake_minimum_required(VERSION 3.8)
project(project_name VERSION 1.0.0 LANGUAGES C)

# Define build type as Release by default
if (CMAKE_BUILD_TYPE)
    SET(CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE})
else()
    SET(CMAKE_BUILD_TYPE Release)
endif()

# Display the build type
message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")

# Display some additionnal info for the Debug build type
if (${CMAKE_BUILD_TYPE} STREQUAL "Debug")
    message(STATUS "As you are in the Debug build type, the project will be compiled with:")
    message(STATUS "-The '-g3' option.")
    message(STATUS "-The '-fsanitize=address' option if lib asan is present")
endif()

# Custom library for the project
# Here you can add subdirectory for you custom lib

# Source files
add_subdirectory(src)

# Enable ctest
enable_testing()

# Add testsuite if build type is Debug
# Don't forget to put your command to run your testsuite here
if (${CMAKE_BUILD_TYPE} STREQUAL "Debug")
    add_custom_target(tests # To launch your testsuite you can type 'make tests'
        DEPENDS
        COMMAND ${CMAKE_CTEST_COMMAND} --verbose --timeout 42
        )
endif()

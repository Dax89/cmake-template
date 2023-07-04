cmake_minimum_required(VERSION 3.22)

project(projectname
    DESCRIPTION "Project Description"
    LANGUAGES CXX
)

option(ENABLE_TESTS "Enable Unit Tests" ON)

set(PROJECT_NAME_TEST "${PROJECT_NAME}_test")

include(cmake/Settings.cmake)

include(cmake/Dependencies.cmake)
setup_dependencies()

add_executable(${PROJECT_NAME})

include(cmake/Compiler.cmake)

target_sources(${PROJECT_NAME}
    PRIVATE
        "main.cpp"
        "src/source.cpp"

    PUBLIC
        "include/template/header.h"
)

target_include_directories(${PROJECT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
)

target_link_libraries(${PROJECT_NAME}
    PUBLIC
        CLI11::CLI11
        fmt
        spdlog
        scn::scn
        expected
        optional
)

if(ENABLE_TESTS)
    include(test/UnitTest.cmake)
endif()

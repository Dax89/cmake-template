cmake_minimum_required(VERSION 3.25)

project(cmake-template
    DESCRIPTION "Project Description"
    LANGUAGES CXX
)

include(cmake/Dependencies.cmake)
setup_dependencies()

add_executable(${PROJECT_NAME})
include(cmake/Compiler.cmake)

target_sources(${PROJECT_NAME}
    PRIVATE
        "src/main.cpp"
        "src/source.cpp"
)

target_include_directories(${PROJECT_NAME}
    PUBLIC
        "${PROJECT_SOURCE_DIR}/include"
)

target_link_libraries(${PROJECT_NAME}
    PUBLIC
        expected
        optional
        cl
        fmt
        scn::scn
        spdlog
)

if(NOT PROJECT_IS_TOP_LEVEL)
    return()
endif()

include(CTest)

if(BUILD_TESTING)
    add_subdirectory(tests)
endif()

cmake_minimum_required(VERSION 3.25)

project(cmake-template)

if(EXISTS src/main.cpp)
    set(PROJECT_NAME_LIB "${PROJECT_NAME}_lib")
else()
    set(PROJECT_NAME_LIB "${PROJECT_NAME}")
endif()

include(cmake/Dependencies.cmake)
setup_dependencies()

add_library(${PROJECT_NAME_LIB} STATIC)

target_sources(${PROJECT_NAME_LIB} 
    PRIVATE
        src/source.cpp
)

target_include_directories(${PROJECT_NAME_LIB}
    PUBLIC
        "${PROJECT_SOURCE_DIR}/include"
)

target_link_libraries(${PROJECT_NAME_LIB}
    PUBLIC
        expected
        optional
        cl
        fmt
        scn::scn
        spdlog
)

include(cmake/Compiler.cmake)
setup_compiler(${PROJECT_NAME_LIB})

if(EXISTS src/main.cpp)
    add_library(${PROJECT_NAME}::lib ALIAS ${PROJECT_NAME_LIB})
    add_executable(${PROJECT_NAME})

    target_sources(${PROJECT_NAME}
        PRIVATE 
            src/main.cpp
    )

    target_link_libraries(${PROJECT_NAME} PRIVATE ${PROJECT_NAME}::lib)
    setup_compiler(${PROJECT_NAME})
endif()

if(NOT PROJECT_IS_TOP_LEVEL)
    return()
endif()

if(CMAKE_BUILD_TYPE MATCHES "Debug")
    configure_file(
        "${CMAKE_SOURCE_DIR}/lsan.supp"
        "${CMAKE_BINARY_DIR}/lsan.supp"
        COPYONLY
    )
    configure_file(
        "${CMAKE_SOURCE_DIR}/asan.supp"
        "${CMAKE_BINARY_DIR}/asan.supp"
        COPYONLY
    )
endif()

if(BUILD_TESTING)
    add_subdirectory(tests)
endif()

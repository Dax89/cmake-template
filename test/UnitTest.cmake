CPMAddPackage("gh:catchorg/Catch2@3.3.2")
include(${Catch2_SOURCE_DIR}/contrib/Catch.cmake)

add_executable(${PROJECT_NAME_TEST})

target_sources(${PROJECT_NAME_TEST}
    PRIVATE
        "test/main.cpp"
)

target_link_libraries(${PROJECT_NAME_TEST}
    PRIVATE
        Catch2::Catch2
        # projectname
)

include(CTest)
catch_discover_tests(${PROJECT_NAME_TEST})

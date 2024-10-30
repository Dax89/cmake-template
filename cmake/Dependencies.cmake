include(cmake/CPM.cmake)

if(PROJECT_IS_TOP_LEVEL)
    include(CTest)
endif()

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

function(setup_dependencies)
    # Priority over old Catch2's versions from dependencies
    if(BUILD_TESTING)
        CPMAddPackage("gh:catchorg/Catch2@3.7.1")
    endif()

    CPMAddPackage("gh:TartanLlama/expected@1.1.0")
    CPMAddPackage("gh:TartanLlama/optional@1.1.0")
    CPMAddPackage("gh:fmtlib/fmt#10.2.1")
    CPMAddPackage("gh:eliaskosunen/scnlib@3.0.1")
    CPMAddPackage("gh:Dax89/cl@1.0.1")

    CPMAddPackage(
        NAME boost_regex
        GIT_TAG "boost-1.86.0"
        GITHUB_REPOSITORY "boostorg/regex"
        OPTIONS "BOOST_REGEX_STANDALONE ON"
    )

    CPMAddPackage(spdlog
        NAME spdlog
        VERSION "1.14.1"
        GITHUB_REPOSITORY "gabime/spdlog"
        OPTIONS "SPDLOG_FMT_EXTERNAL ON"
    )

    CPMAddPackage(
        NAME RapidJSON
        GIT_TAG "858451e5b7d1c56cf8f6d58f88cf958351837e53"
        GITHUB_REPOSITORY "Tencent/rapidjson"
        OPTIONS
            "RAPIDJSON_BUILD_TESTS OFF"
            "RAPIDJSON_BUILD_DOC OFF"
            "RAPIDJSON_BUILD_EXAMPLES OFF"
            "RAPIDJSON_BUILD_CXX11 OFF"
            "RAPIDJSON_BUILD_CXX17 ON"
    )

    if(RapidJSON_ADDED)
        add_library(rapidjson INTERFACE IMPORTED)
        target_include_directories(rapidjson INTERFACE "${RapidJSON_SOURCE_DIR}/include")

        target_compile_definitions(rapidjson
            INTERFACE
                "RAPIDJSON_HAS_STDSTRING"
        )
    endif()
endfunction()

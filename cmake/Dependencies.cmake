include(cmake/CPM.cmake)

if(PROJECT_IS_TOP_LEVEL)
    include(CTest)
endif()

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

function(setup_dependencies)
    # Priority over old Catch2's versions from dependencies
    if(BUILD_TESTING)
        CPMAddPackage("gh:catchorg/Catch2@3.5.0")
    endif()

    CPMAddPackage("gh:TartanLlama/expected@1.1.0")
    CPMAddPackage("gh:TartanLlama/optional@1.1.0")
    CPMAddPackage("gh:fmtlib/fmt#10.1.1")
    CPMAddPackage("gh:eliaskosunen/scnlib@1.1.3")
    CPMAddPackage("gh:Dax89/cl@1.0.1")

    CPMAddPackage(
        NAME boost_regex
        GIT_TAG "boost-1.84.0"
        GITHUB_REPOSITORY "boostorg/regex"
        OPTIONS "BOOST_REGEX_STANDALONE ON"
    )

    CPMAddPackage(spdlog
        NAME spdlog
        VERSION "1.12.0"
        GITHUB_REPOSITORY "gabime/spdlog"
        OPTIONS "SPDLOG_FMT_EXTERNAL ON"
    )
endfunction()

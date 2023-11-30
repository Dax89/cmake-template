include(cmake/CPM.cmake)

CPMAddPackage("gh:TartanLlama/expected@1.1.0")
CPMAddPackage("gh:TartanLlama/optional@1.1.0")
CPMAddPackage("gh:fmtlib/fmt#10.1.1")
CPMAddPackage("gh:eliaskosunen/scnlib@1.1.3")
CPMAddPackage("gh:Dax89/cl@1.0.0")

CPMAddPackage(
    NAME spdlog
    VERSION "1.12.0"
    GITHUB_REPOSITORY "gabime/spdlog"
    OPTIONS "SPDLOG_FMT_EXTERNAL ON"
    )

if(BUILD_TESTING)
    CPMAddPackage("gh:catchorg/Catch2@3.4.0")
endif()

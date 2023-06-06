include(cmake/CPM.cmake)

function(setup_dependencies)
    CPMAddPackage("gh:fmtlib/fmt#9.1.0")
    CPMAddPackage("gh:eliaskosunen/scnlib@1.1.2")
    CPMAddPackage("gh:TartanLlama/expected@1.1.0")
    CPMAddPackage("gh:TartanLlama/optional@1.1.0")
    CPMAddPackage("gh:CLIUtils/CLI11@2.3.2")

    CPMAddPackage(
        NAME spdlog
        VERSION "1.11.0"
        GITHUB_REPOSITORY "gabime/spdlog"
        OPTIONS "SPDLOG_FMT_EXTERNAL ON"
    )
endfunction()

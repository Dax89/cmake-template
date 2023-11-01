include(cmake/CPM.cmake)

function(setup_dependencies)
    CPMAddPackage("gh:TartanLlama/expected@1.1.0")
    CPMAddPackage("gh:TartanLlama/optional@1.1.0")
    CPMAddPackage("gh:fmtlib/fmt#10.1.1")
    CPMAddPackage("gh:eliaskosunen/scnlib@1.1.2")
    CPMAddPackage("gh:docopt/docopt.cpp@0.6.3")

    CPMAddPackage(
        NAME spdlog
        VERSION "1.12.0"
        GITHUB_REPOSITORY "gabime/spdlog"
        OPTIONS "SPDLOG_FMT_EXTERNAL ON"
    )
endfunction()

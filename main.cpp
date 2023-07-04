#include <fmt/core.h>
#include <CLI/CLI.hpp>

int main(int argc, char* argv[])
{
    CLI::App app{"Project Description"};
    CLI11_PARSE(app, argc, argv);

    fmt::print("Hello World!\n");
    return 0;
}

#include <CLI/CLI.hpp>
#include <template/header.h>

int main(int argc, char* argv[])
{
    CLI::App app{"Project Description"};
    CLI11_PARSE(app, argc, argv);
    print_hello();
    return 0;
}

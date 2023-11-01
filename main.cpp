#include <docopt.h>
#include <template/header.h>

const char* USAGE =
    R"(CMake Template

    Usage:

    Options:
        -h --help            Show this screen.
        -v --version         Show version.
)";

int main(int argc, char** argv) {
    auto options = docopt::docopt(USAGE, {argv + 1, argv + argc},
                                  true, // show help if requested
                                  "CMake Template v1.0"); // version string

    print_hello();
    return 0;
}

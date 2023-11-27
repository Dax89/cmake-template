#include "error.h"
#include <cl/cl.h>
#include <template/header.h>

int main(int argc, char** argv) {
    using namespace cl::string_literals;

    cl::set_program("cmake-template");
    cl::set_name("cmake-template");
    cl::set_description("CMake Template");
    cl::set_version("1.0");

    // clang-format off
    cl::Options{
        // Add your command line options
    };

    cl::Usage{
        // Add your command line rules
    };
    // clang-format on

    cl::Args args = cl::parse(argc, argv);

    print_hello();
    return 0;
}

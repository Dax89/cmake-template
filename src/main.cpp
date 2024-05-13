#include <cl/cl.h>
#include <cmake-template/header.h>

#if !defined(NDEBUG)
extern "C" const char* __asan_default_options() { // NOLINT
    return "suppressions=asan.supp:print_suppressions=0";
}

extern "C" const char* __lsan_default_options() { // NOLINT
    return "suppressions=lsan.supp:print_suppressions=0";
}
extern "C" const char* __lsan_default_suppressions() { // NOLINT
    return "";
}
#endif

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

    cmake_template::print_hello();
    return 0;
}

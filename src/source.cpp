#include <cmake-template/header.h>
#include <fmt/core.h>

namespace cmake_template {

int sum(int a, int b) { return a + b; }
void print_hello() { fmt::print("CMake Template: Hello World\n"); }

} // namespace cmake_template

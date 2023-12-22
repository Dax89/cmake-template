#include <catch2/catch_session.hpp>
#include <catch2/catch_test_macros.hpp>
#include <cmake-template/header.h>

int main(int argc, char** argv) {
    // Insert setup code here...

    int result = Catch::Session().run(argc, argv);

    // Insert cleanup code here...

    return result;
}

TEST_CASE("Test") {
    REQUIRE(cmake_template::sum(42, 44) == 86);
    REQUIRE(cmake_template::sum(38, 12) == 50);
    REQUIRE(cmake_template::sum(68, 28) == 96);
}

set_target_properties(${PROJECT_NAME}
    PROPERTIES
        EXPORT_COMPILE_COMMANDS ON
        CXX_STANDARD_REQUIRED YES
        CXX_EXTENSIONS NO
        CXX_STANDARD 17
)

target_compile_features(${PROJECT_NAME}
    PUBLIC
        cxx_std_17
)

set(NOT_MSVC_COMPILE_OPTIONS
    "-Wall"
    "-Wextra"
    "-Wpedantic"
    "-Wno-error=unused"
    "-Wno-error=unused-function"
    "-Wno-error=unused-parameter"
    "-Wno-error=unused-value"
    "-Wno-error=unused-variable"
    "-Wno-error=unused-local-typedefs"
    "-Wno-error=unused-but-set-parameter"
    "-Wno-error=unused-but-set-variable"
    "-fno-rtti"
)

set(NOT_MSVC_COMPILE_OPTIONS_DEBUG
    "-Werror"
    "-g"
    "-fsanitize=address,undefined"
    "-fno-omit-frame-pointer"
)

set(NOT_MSVC_LINK_OPTIONS_DEBUG
    "-fsanitize=address,undefined"
    "-fno-omit-frame-pointer"
)

set(MSVC_COMPILE_OPTIONS "/W4")

set(MSVC_COMPILE_OPTIONS_DEBUG
    "/WX"
    "/Od"
    "/fsanitize=address"
)

target_compile_options(${PROJECT_NAME}
    PRIVATE
        $<$<CXX_COMPILER_ID:MSVC>:${MSVC_COMPILE_OPTIONS}>
        $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:${NOT_MSVC_COMPILE_OPTIONS}>
        $<$<AND:$<CXX_COMPILER_ID:MSVC>,$<CONFIG:Debug>>:${MSVC_COMPILE_OPTIONS_DEBUG}>
        $<$<AND:$<NOT:$<CXX_COMPILER_ID:MSVC>>,$<CONFIG:Debug>>:${NOT_MSVC_COMPILE_OPTIONS_DEBUG}>
)

target_link_options(${PROJECT_NAME}
    PUBLIC
        $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:${NOT_MSVC_LINK_OPTIONS}>
        $<$<AND:$<NOT:$<CXX_COMPILER_ID:MSVC>>,$<CONFIG:Debug>>:${NOT_MSVC_LINK_OPTIONS_DEBUG}>
)

target_compile_definitions(${PROJECT_NAME}
    PUBLIC
        $<$<AND:$<CXX_COMPILER_ID:GNU>,$<CONFIG:Debug>>:_GLIBCXX_ASSERTIONS _GLIBCXX_DEBUG _GLIBCXX_DEBUG_PEDANTIC>
)

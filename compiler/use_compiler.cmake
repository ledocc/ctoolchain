#include_guard(GLOBAL)


##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##

function(ctoolchain__compiler__find_compiler result compiler_name)

    find_program(compiler_path "${compiler_name}")

    if(NOT compiler_path)
        message(FATAL_ERROR "[ctoolchain] Compiler executable \"${compiler_name}\" not found")
    endif()

    set(${result} "${compiler_path}" PARENT_SCOPE)

endfunction()

##---------------------------------------------------------------------------------------------------------------------##

function(ctoolchain__compiler__use_compiler c_compiler cxx_compiler)

    set( CMAKE_C_COMPILER   "${c_compiler}"   CACHE STRING "C compiler"   FORCE )
    set( CMAKE_CXX_COMPILER "${cxx_compiler}" CACHE STRING "C++ compiler" FORCE )

endfunction()

##---------------------------------------------------------------------------------------------------------------------##

macro(__ctoolchain__compiler__parse_argument function_name )

    cmake_parse_arguments(
        ARG_
        ""
        "VERSION"
        ""
        ${ARGN}
        )

    unset(suffix)
    if(ARG__VERSION)
        set(suffix "-${ARG__VERSION}")
    endif()

endmacro()

##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##

function(ctoolchain__compiler__use_gcc)

    __ctoolchain__compiler__parse_argument( cmut__toolchain__compiler__use_gcc "${ARGN}")

    ctoolchain__compiler__find_compiler(gcc_path gcc${suffix})
    ctoolchain__compiler__find_compiler(gxx_path g++${suffix})

    if (NOT "${gxx_path}" MATCHES ".*g\\+\\+${suffix}")
        string(REPLACE "gcc${suffix}" "g++${suffix}" gxx_path "${gxx_path}")
    endif()

    ctoolchain__compiler__use_compiler("${gcc_path}" "${gxx_path}")

endfunction()

##---------------------------------------------------------------------------------------------------------------------##

function(ctoolchain__compiler__use_clang)

    __ctoolchain__compiler__parse_argument( cmut__toolchain__compiler__use_clang "${ARGN}")

    ctoolchain__compiler__find_compiler(clang_path clang${suffix})
    ctoolchain__compiler__find_compiler(clangxx_path clang++${suffix})

    if (NOT "${clangxx_path}" MATCHES ".*clang\\+\\+${suffix}")
        string(REPLACE "clang${suffix}" "clang++${suffix}" clangxx_path "${clangxx_path}")
    endif()

    ctoolchain__compiler__use_compiler("${clang_path}" "${clangxx_path}")

endfunction()

##---------------------------------------------------------------------------------------------------------------------##

function(ctoolchain__compiler__use_cl)

    ctoolchain__compiler__find_compiler(compiler_path cl)
    ctoolchain__compiler__use_compiler("${compiler_path}" "${compiler_path}")

endfunction()

##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##

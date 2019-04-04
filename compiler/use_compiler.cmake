#include_guard(GLOBAL)


##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##

function(ctoolchain__compiler__xcrun result)

    find_program(xcrun_COMMAND "xcrun")

    execute_process(
        COMMAND "${xcrun_COMMAND}" ${ARGN}
        OUTPUT_VARIABLE output
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    set(${result} "${output}" PARENT_SCOPE)

endfunction()

##---------------------------------------------------------------------------------------------------------------------##

function(ctoolchain__compiler__find_compiler result compiler_name)

    find_program( ${result} "${compiler_name}" ${ARGN} )

    if( NOT ${result} )
        message(FATAL_ERROR "[ctoolchain] - Compiler executable \"${compiler_name}\" not found.")
    endif()

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

    ctoolchain__compiler__find_compiler(gcc${suffix}_path gcc${suffix})
    ctoolchain__compiler__find_compiler(gxx${suffix}_path g++${suffix})

    ctoolchain__compiler__use_compiler("${gcc_path}" "${gxx_path}")

endfunction()

##---------------------------------------------------------------------------------------------------------------------##

function(ctoolchain__compiler__use_clang)

    __ctoolchain__compiler__parse_argument( cmut__toolchain__compiler__use_clang "${ARGN}")

    ctoolchain__compiler__find_compiler(clang_path clang${suffix} HINTS /usr/local/opt/llvm/bin)
    ctoolchain__compiler__find_compiler(clangxx_path clang++${suffix} HINTS /usr/local/opt/llvm/bin)

    ctoolchain__compiler__use_compiler("${clang_path}" "${clangxx_path}")

endfunction()

##---------------------------------------------------------------------------------------------------------------------##

function(ctoolchain__compiler__use_apple_clang)

    ctoolchain__compiler__xcrun(clang_path -f clang)
    ctoolchain__compiler__xcrun(clangxx_path -f clang++)

    ctoolchain__compiler__use_compiler("${clang_path}" "${clangxx_path}")

endfunction()

##---------------------------------------------------------------------------------------------------------------------##

function(ctoolchain__compiler__use_cl)

    ctoolchain__compiler__find_compiler(cl_path cl)
    ctoolchain__compiler__use_compiler("${cl_path}" "${cl_path}")

endfunction()

##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##

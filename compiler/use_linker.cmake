#include_guard(GLOBAL)


##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##

function(ctoolchain__linker__find_linker result linker_name)

    find_program(linker_path "${linker_name}")

    if(NOT linker_path)
        message(FATAL_ERROR - "[ctoolchain] Linker executable \"${linker_name}\" not found.")
    endif()

    set(${result} "${linker_path}" PARENT_SCOPE)

endfunction()

##---------------------------------------------------------------------------------------------------------------------##

function(ctoolchain__linker__use_linker linker_path)

    set( CMAKE_LINKER   "${linker_path}"   CACHE STRING "C/CXX linker."   FORCE )

endfunction()

##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##

function(ctoolchain__linker__use_link)

    ctoolchain__linker__find_linker(linker_path link)
    ctoolchain__linker__use_linker("${linker_path}")

endfunction()

##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##
##---------------------------------------------------------------------------------------------------------------------##

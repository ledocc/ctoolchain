#include_guard(GLOBAL)



##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##

function(ctoolchain__flags__get_last_cxx_version result)

    if( DEFINED CTOOLCHAIN_LAST_CXX_VERSION )
        set( version ${CTOOLCHAIN_LAST_CXX_VERSION} )
    else()
        if( NOT "$ENV{CTOOLCHAIN_LAST_CXX_VERSION}" STREQUAL "" )
            set( version "$ENV{CTOOLCHAIN_LAST_CXX_VERSION}" )
        else()
            set( version 17 )
        endif()
        set( CTOOLCHAIN_LAST_CXX_VERSION CACHE STRING "Default cxx version used by ctoolchain" ${version} )
    endif()

    set(${result} ${version} PARENT_SCOPE)

endfunction()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_cxx version )

    cmake_parse_arguments(ARG "EXTENSIONS" "" "" ${ARGN})

    set(CMAKE_CXX_STANDARD ${version} )
    set(CMAKE_CXX_EXTENSIONS ${ARG_EXTENSIONS})
    set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_last_cxx_version)

    ctoolchain__flags__get_last_cxx_version( version )
    ctoolchain__flags__use_cxx( ${version} )

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__build_32bit)

    list(APPEND CMAKE_C_FLAGS_INIT "-m32")
    list(APPEND CMAKE_CXX_FLAGS_INIT "-m32")

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__build_64bit)

    list(APPEND CMAKE_C_FLAGS_INIT "-m64")
    list(APPEND CMAKE_CXX_FLAGS_INIT "-m64")

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_fpic)

    set(CMAKE_POSITION_INDEPENDENT_CODE ON)

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_gold_linker)

    list(APPEND CMAKE_CXX_FLAGS_INIT "-fuse-ld=gold")
    list(APPEND CMAKE_C_FLAGS_INIT "-fuse-ld=gold")

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_lto)

    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_sanitize_address)

    list(APPEND CMAKE_CXX_FLAGS_INIT "-fsanitize=address")
    list(APPEND CMAKE_CXX_FLAGS_INIT "-g")
    list(APPEND CMAKE_CXX_FLAGS_RELEASE_INIT "-O1")
    list(APPEND CMAKE_CXX_FLAGS_RELEASE_INIT "-DNDEBUG")

    list(APPEND CMAKE_C_FLAGS_INIT "-fsanitize=address")
    list(APPEND CMAKE_C_FLAGS_INIT "-g")
    list(APPEND CMAKE_C_FLAGS_RELEASE_INIT "-O1")
    list(APPEND CMAKE_C_FLAGS_RELEASE_INIT "-DNDEBUG")

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_sanitize_leak)

    list(APPEND CMAKE_CXX_FLAGS_INIT "-fsanitize=leak")
    list(APPEND CMAKE_CXX_FLAGS_INIT "-g")

    list(APPEND CMAKE_C_FLAGS_INIT "-fsanitize=leak")
    list(APPEND CMAKE_C_FLAGS_INIT "-g")

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_sanitize_memory)

    list(APPEND CMAKE_CXX_FLAGS_INIT "-fsanitize=memory")
    list(APPEND CMAKE_CXX_FLAGS_INIT "-fsanitize-memory-track-origins=2")
    list(APPEND CMAKE_CXX_FLAGS_INIT "-fno-omit-frame-pointer")
    list(APPEND CMAKE_CXX_FLAGS_INIT "-fno-optimize-sibling-calls")
    list(APPEND CMAKE_CXX_FLAGS_INIT "-g")
    list(APPEND CMAKE_CXX_FLAGS_RELEASE_INIT "-O1")
    list(APPEND CMAKE_CXX_FLAGS_RELEASE_INIT "-DNDEBUG")

    list(APPEND CMAKE_C_FLAGS_INIT "-fsanitize=memory")
    list(APPEND CMAKE_C_FLAGS_INIT "-fsanitize-memory-track-origins=2")
    list(APPEND CMAKE_C_FLAGS_INIT "-fno-omit-frame-pointer")
    list(APPEND CMAKE_C_FLAGS_INIT "-fno-optimize-sibling-calls")
    list(APPEND CMAKE_C_FLAGS_INIT "-g")
    list(APPEND CMAKE_C_FLAGS_RELEASE_INIT "-O1")
    list(APPEND CMAKE_C_FLAGS_RELEASE_INIT "-DNDEBUG")

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_sanitize_thread)

    list(APPEND CMAKE_CXX_FLAGS_INIT "-fsanitize=thread")
    list(APPEND CMAKE_CXX_FLAGS_INIT "-fPIE")
    list(APPEND CMAKE_CXX_FLAGS_INIT "-pie")
    list(APPEND CMAKE_CXX_FLAGS_INIT "-g")

    list(APPEND CMAKE_C_FLAGS_INIT "-fsanitize=thread")
    list(APPEND CMAKE_C_FLAGS_INIT "-fPIE")
    list(APPEND CMAKE_C_FLAGS_INIT "-pie")
    list(APPEND CMAKE_C_FLAGS_INIT "-g")

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_static_library)

    list(APPEND CMAKE_CXX_FLAGS_INIT "-static")
    list(APPEND CMAKE_C_FLAGS_INIT "-static")

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_libcxx)

    list(APPEND CMAKE_CXX_FLAGS_INIT "-stdlib=libc++")

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_libstdcxx)

    list(APPEND CMAKE_CXX_FLAGS_INIT "-stdlib=libstdc++")
    list(APPEND CMAKE_EXE_LINKER_FLAGS_INIT "-stdlib=libstdc++")
    list(APPEND CMAKE_SHARED_LINKER_FLAGS_INIT "-stdlib=libstdc++")

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_nolib)

    list(APPEND CMAKE_CXX_FLAGS_INIT "-nostdinc++")
    list(APPEND CMAKE_EXE_LINKER_FLAGS_INIT "-nodefaultlibs")

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__reset_var variable)
    get_property(GLOBAL CTOOLCHAIN__RESET_${variable} reseted)

    if(NOT reseted)
        set_property(GLOBAL CTOOLCHAIN__RESET_${variable} 1)
        set(${variable})
    endif()

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__clean__var_init_list)

    set(var_init
        CMAKE_C_FLAGS_INIT
        CMAKE_C_FLAGS_RELEASE_INIT
        CMAKE_CXX_FLAGS_INIT
        CMAKE_CXX_FLAGS_RELEASE_INIT
        CMAKE_EXE_LINKER_FLAGS_INIT
        CMAKE_SHARED_LINKER_FLAGS_INIT
        )

    foreach(var IN LISTS var_init)
        if(DEFINED ${var})
            list(REMOVE_DUPLICATES ${var})
            string(REPLACE ";" " " ${var} "${${var}}")
            message(STATUS "[ctoolchain] - ${var} = ${${var}}")
        endif()
    endforeach()

endmacro()

##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##

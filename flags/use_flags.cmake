#include_guard(GLOBAL)



##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_cxx version)

    set(CMAKE_CXX_STANDARD ${version})
    set(CMAKE_CXX_EXTENSIONS OFF)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)

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
    list(APPEND CMAKE_CXX_FLAGS_RELEASE_INIT "-O1 -DNDEBUG")

    list(APPEND CMAKE_C_FLAGS_INIT "-fsanitize=address")
    list(APPEND CMAKE_C_FLAGS_INIT "-g")
    list(APPEND CMAKE_C_FLAGS_RELEASE_INIT "-O1 -DNDEBUG")

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use_sanitize_leak)

    list(APPEND CMAKE_CXX_FLAGS_INIT "-fsanitize=leak")
    list(APPEND CMAKE_CXX_FLAGS_INIT "-g")

    list(APPEND CMAKE_C_FLAGS_INIT "-fsanitize=leak")
    list(APPEND CMAKE_C_FLAGS_INIT "-g")

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use__sanitize_memory)

    list(APPEND CMAKE_CXX_FLAGS_INIT "-fsanitize=memory")
    list(APPEND CMAKE_CXX_FLAGS_INIT "-fsanitize-memory-track-origins")
    list(APPEND CMAKE_CXX_FLAGS_INIT "-g")

    list(APPEND CMAKE_C_FLAGS_INIT "-fsanitize=memory")
    list(APPEND CMAKE_C_FLAGS_INIT "-fsanitize-memory-track-origins")
    list(APPEND CMAKE_C_FLAGS_INIT "-g")

endmacro()

##--------------------------------------------------------------------------------------------------------------------##

macro(ctoolchain__flags__use__sanitize_thread)

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

macro(ctoolchain__clean__var_init_list)

    set(var_init
        CMAKE_C_FLAGS_INIT
        CMAKE_CXX_FLAGS_INIT
        CMAKE_EXE_LINKER_FLAGS_INIT
        CMAKE_SHARED_LINKER_FLAGS_INIT
        )

    foreach(var IN LISTS var_init)
        if(DEFINED ${var})
            string(REPLACE ";" " " ${var} "${${var}}")
        endif()
    endforeach()

endmacro()

##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##

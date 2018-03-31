
#.rst:
# ctoolchain__os__use_android
# ---------------
#
# Functions to help define android ndk variable
#
#
#  ctoolchain__os__use_android(api_level arch_abi toolchain_version stl_type)
#
#  ``api_level``
#    CMAKE_SYSTEM_VERSION is initialized with this parameter
#
#  ``arch_abi``
#    CMAKE_ANDROID_ARCH_ABI is initialized with this parameter
#
#  ``toolchain_version``
#    CMAKE_ANDROID_NDK_TOOLCHAIN_VERSION is initialized with this parameter
#
#  ``stl_type``
#    CMAKE_ANDROID_STL_TYPE is initialized with this parameter
#

function(ctoolchain__os__use_android api_level arch_abi toolchain_version stl_type)

    set( CMAKE_SYSTEM_NAME                   "Android"            PARENT_SCOPE )
    set( CMAKE_SYSTEM_VERSION                ${api_level}         PARENT_SCOPE )
    set( CMAKE_ANDROID_ARCH_ABI              ${arch_abi}          PARENT_SCOPE )
    set( CMAKE_ANDROID_NDK_TOOLCHAIN_VERSION ${toolchain_version} PARENT_SCOPE )
    set( CMAKE_ANDROID_STL_TYPE              ${stl_type}          PARENT_SCOPE )

endfunction()

function(ctoolchain__os__use_linux arch)

    set( CMAKE_SYSTEM_NAME      "Linux" PARENT_SCOPE )
    set( CMAKE_SYSTEM_PROCESSOR ${arch} PARENT_SCOPE )

endfunction()

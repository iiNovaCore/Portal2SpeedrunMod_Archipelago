# Install script for directory: C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/zlib

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/out/install/x64-Debug")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/out/build/x64-Debug/_deps/zlib-build/zsd.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/zlib/ZLIB-static.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/zlib/ZLIB-static.cmake"
         "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/out/build/x64-Debug/_deps/zlib-build/CMakeFiles/Export/93f1ef598f1f2f8b07b376ab081bbce6/ZLIB-static.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/zlib/ZLIB-static-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/zlib/ZLIB-static.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/zlib" TYPE FILE FILES "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/out/build/x64-Debug/_deps/zlib-build/CMakeFiles/Export/93f1ef598f1f2f8b07b376ab081bbce6/ZLIB-static.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/zlib" TYPE FILE FILES "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/out/build/x64-Debug/_deps/zlib-build/CMakeFiles/Export/93f1ef598f1f2f8b07b376ab081bbce6/ZLIB-static-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/zlib" TYPE FILE FILES
    "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/out/build/x64-Debug/_deps/zlib-build/ZLIBConfig.cmake"
    "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/out/build/x64-Debug/_deps/zlib-build/ZLIBConfigVersion.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/out/build/x64-Debug/_deps/zlib-build/zconf.h"
    "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/zlib/zlib.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Docs" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man3" TYPE FILE FILES "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/zlib/zlib.3")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Docs" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/zlib/zlib" TYPE FILE FILES
    "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/zlib/LICENSE"
    "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/zlib/doc/algorithm.txt"
    "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/zlib/doc/crc-doc.1.0.pdf"
    "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/zlib/doc/rfc1950.txt"
    "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/zlib/doc/rfc1951.txt"
    "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/zlib/doc/rfc1952.txt"
    "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/zlib/doc/txtvsbin.txt"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/out/build/x64-Debug/_deps/zlib-build/zlib.pc")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/out/build/x64-Debug/_deps/zlib-build/test/cmake_install.cmake")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/Ronan/Documents/repos/Portal2SpeedrunMod_Archipelago/smsm/APLib/deps/APCpp/out/build/x64-Debug/_deps/zlib-build/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()

# Install script for directory: /home/luolei/crawler-for-music-tdt

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Debug")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "0")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/luolei/crawler-for-music-tdt/component/ContentSeen/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/component/LinkExtractor/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/component/ris/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/component/URLFrontier/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/component/Writer/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/component/DNS_Resolver/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/component/protocolModule/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/component/URLFilter/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/component/URLSeen/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/util/btree-f/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/util/btree-m/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/util/lru/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/util/rabinhash-32/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/util/rio/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/util/rwlock_fcfs/cmake_install.cmake")
  INCLUDE("/home/luolei/crawler-for-music-tdt/util/thread_print/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/luolei/crawler-for-music-tdt/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/luolei/crawler-for-music-tdt/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)

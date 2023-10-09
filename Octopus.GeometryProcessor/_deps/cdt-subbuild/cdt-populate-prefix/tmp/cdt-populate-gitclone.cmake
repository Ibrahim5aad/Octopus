# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

if(EXISTS "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix/src/cdt-populate-stamp/cdt-populate-gitclone-lastrun.txt" AND EXISTS "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix/src/cdt-populate-stamp/cdt-populate-gitinfo.txt" AND
  "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix/src/cdt-populate-stamp/cdt-populate-gitclone-lastrun.txt" IS_NEWER_THAN "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix/src/cdt-populate-stamp/cdt-populate-gitinfo.txt")
  message(STATUS
    "Avoiding repeated git clone, stamp file is up to date: "
    "'D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix/src/cdt-populate-stamp/cdt-populate-gitclone-lastrun.txt'"
  )
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-src"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: 'D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe" 
            clone --no-checkout --config "advice.detachedHead=false" "https://github.com/artem-ogre/CDT" "cdt-src"
    WORKING_DIRECTORY "D:/Work/wasm/web-ifc/src/wasm/_deps"
    RESULT_VARIABLE error_code
  )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once: ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/artem-ogre/CDT'")
endif()

execute_process(
  COMMAND "C:/Program Files/Git/cmd/git.exe" 
          checkout "4d0c9026b8ec846fe544897e7111f8f9080d5f8a" --
  WORKING_DIRECTORY "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-src"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: '4d0c9026b8ec846fe544897e7111f8f9080d5f8a'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe" 
            submodule update --recursive --init 
    WORKING_DIRECTORY "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-src"
    RESULT_VARIABLE error_code
  )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: 'D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix/src/cdt-populate-stamp/cdt-populate-gitinfo.txt" "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix/src/cdt-populate-stamp/cdt-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: 'D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix/src/cdt-populate-stamp/cdt-populate-gitclone-lastrun.txt'")
endif()

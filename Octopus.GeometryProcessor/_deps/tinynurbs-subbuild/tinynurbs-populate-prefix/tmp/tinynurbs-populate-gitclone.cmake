# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

if(EXISTS "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinynurbs-subbuild/tinynurbs-populate-prefix/src/tinynurbs-populate-stamp/tinynurbs-populate-gitclone-lastrun.txt" AND EXISTS "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinynurbs-subbuild/tinynurbs-populate-prefix/src/tinynurbs-populate-stamp/tinynurbs-populate-gitinfo.txt" AND
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinynurbs-subbuild/tinynurbs-populate-prefix/src/tinynurbs-populate-stamp/tinynurbs-populate-gitclone-lastrun.txt" IS_NEWER_THAN "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinynurbs-subbuild/tinynurbs-populate-prefix/src/tinynurbs-populate-stamp/tinynurbs-populate-gitinfo.txt")
  message(STATUS
    "Avoiding repeated git clone, stamp file is up to date: "
    "'D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinynurbs-subbuild/tinynurbs-populate-prefix/src/tinynurbs-populate-stamp/tinynurbs-populate-gitclone-lastrun.txt'"
  )
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinynurbs-src"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: 'D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinynurbs-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe" 
            clone --no-checkout --config "advice.detachedHead=false" "https://github.com/pradeep-pyro/tinynurbs" "tinynurbs-src"
    WORKING_DIRECTORY "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps"
    RESULT_VARIABLE error_code
  )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once: ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/pradeep-pyro/tinynurbs'")
endif()

execute_process(
  COMMAND "C:/Program Files/Git/cmd/git.exe" 
          checkout "2fc6562d71665312c6298f7c340bace1bcf1b7a1" --
  WORKING_DIRECTORY "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinynurbs-src"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: '2fc6562d71665312c6298f7c340bace1bcf1b7a1'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe" 
            submodule update --recursive --init 
    WORKING_DIRECTORY "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinynurbs-src"
    RESULT_VARIABLE error_code
  )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: 'D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinynurbs-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinynurbs-subbuild/tinynurbs-populate-prefix/src/tinynurbs-populate-stamp/tinynurbs-populate-gitinfo.txt" "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinynurbs-subbuild/tinynurbs-populate-prefix/src/tinynurbs-populate-stamp/tinynurbs-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: 'D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinynurbs-subbuild/tinynurbs-populate-prefix/src/tinynurbs-populate-stamp/tinynurbs-populate-gitclone-lastrun.txt'")
endif()

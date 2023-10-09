# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinycpptest-src"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinycpptest-build"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinycpptest-subbuild/tinycpptest-populate-prefix"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinycpptest-subbuild/tinycpptest-populate-prefix/tmp"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinycpptest-subbuild/tinycpptest-populate-prefix/src/tinycpptest-populate-stamp"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinycpptest-subbuild/tinycpptest-populate-prefix/src"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinycpptest-subbuild/tinycpptest-populate-prefix/src/tinycpptest-populate-stamp"
)

set(configSubDirs Debug)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinycpptest-subbuild/tinycpptest-populate-prefix/src/tinycpptest-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/tinycpptest-subbuild/tinycpptest-populate-prefix/src/tinycpptest-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()

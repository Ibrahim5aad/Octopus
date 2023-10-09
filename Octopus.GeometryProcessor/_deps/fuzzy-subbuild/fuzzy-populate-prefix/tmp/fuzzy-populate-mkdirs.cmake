# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/fuzzy-src"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/fuzzy-build"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/fuzzy-subbuild/fuzzy-populate-prefix"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/fuzzy-subbuild/fuzzy-populate-prefix/tmp"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/fuzzy-subbuild/fuzzy-populate-prefix/src/fuzzy-populate-stamp"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/fuzzy-subbuild/fuzzy-populate-prefix/src"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/fuzzy-subbuild/fuzzy-populate-prefix/src/fuzzy-populate-stamp"
)

set(configSubDirs Debug)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/fuzzy-subbuild/fuzzy-populate-prefix/src/fuzzy-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/fuzzy-subbuild/fuzzy-populate-prefix/src/fuzzy-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()

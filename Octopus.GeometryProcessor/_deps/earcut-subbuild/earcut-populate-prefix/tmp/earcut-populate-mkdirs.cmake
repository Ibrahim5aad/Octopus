# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/earcut-src"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/earcut-build"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/earcut-subbuild/earcut-populate-prefix"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/earcut-subbuild/earcut-populate-prefix/tmp"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/earcut-subbuild/earcut-populate-prefix/src/earcut-populate-stamp"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/earcut-subbuild/earcut-populate-prefix/src"
  "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/earcut-subbuild/earcut-populate-prefix/src/earcut-populate-stamp"
)

set(configSubDirs Debug)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/earcut-subbuild/earcut-populate-prefix/src/earcut-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "D:/Work/wasm/New folder/web-ifc/src/wasm/_deps/earcut-subbuild/earcut-populate-prefix/src/earcut-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()

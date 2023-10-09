# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-src"
  "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-build"
  "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix"
  "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix/tmp"
  "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix/src/cdt-populate-stamp"
  "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix/src"
  "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix/src/cdt-populate-stamp"
)

set(configSubDirs Debug)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix/src/cdt-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "D:/Work/wasm/web-ifc/src/wasm/_deps/cdt-subbuild/cdt-populate-prefix/src/cdt-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()

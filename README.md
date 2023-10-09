# Octopus

There is a dogma among developers that use Web IFC module of the IFC.js is only a WASM module. Octopus was made as a demo to shake this dogma a little bit and show how IFC.js can be used server-side. Octopus also shows how you can use it in a dotnet context. 

## Architecture
The geometry processor of the IFC.js library is built as a C++ library as the base layer of Octopus. Above the processor layer there is a C++/CLI interop layer that introduces some managed wrappers for the processor's functionality. 

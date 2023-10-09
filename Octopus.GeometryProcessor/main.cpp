///* This Source Code Form is subject to the terms of the Mozilla Public
// * License, v. 2.0. If a copy of the MPL was not distributed with this
// * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
//
//#include <iostream>
//#include <fstream>
//#include <filesystem>
//#include "test/io_helpers.h"
//
//#include "parsing/IfcLoader.h"
//#include "schema/IfcSchemaManager.h"
//#include "geometry/IfcGeometryProcessor.h"
//#include "utility/LoaderError.h"
//#include "utility/LoaderSettings.h"
//#include "schema/ifc-schema.h"
//
//
//using namespace webifc::io;
//
//long long ms()
//{
//    using namespace std::chrono;
//    milliseconds millis = duration_cast<milliseconds>(
//        system_clock::now().time_since_epoch());
//
//    return millis.count();
//}
//
//double RandomDouble(double lo, double hi)
//{
//    return lo + static_cast<double>(rand()) / (static_cast<double>(RAND_MAX / (hi - lo)));
//}
//
//std::string ReadFile(std::string filename)
//{
//    std::ifstream t(filename);
//    std::stringstream buffer;
//    buffer << t.rdbuf();
//    return buffer.str();
//}
//
//void SpecificLoadTest(webifc::parsing::IfcLoader &loader, webifc::geometry::IfcGeometryProcessor &geometryLoader, uint64_t num)
//{
//    auto walls = loader.GetExpressIDsWithType(webifc::schema::IFCSLAB);
//
//    bool writeFiles = true;
//
//    auto mesh = geometryLoader.GetMesh(num);
//
//    if (writeFiles)
//    {
//        DumpMesh(mesh, geometryLoader, "TEST.obj");
//    }
//}
//
//
//int main()
//{
//    std::cout << "Hello web IFC test!" << std::endl;
//     
//    std::string content = ReadFile("C:/Users/qmoya/Desktop/PROGRAMES/VSCODE/IFC.JS/issues/#mep2/TESTED_Simple_project_01.ifc");
//
//    webifc::utility::LoaderSettings set;
//    set.COORDINATE_TO_ORIGIN = true;
//    
//
//    webifc::utility::LoaderErrorHandler errorHandler;
//    webifc::schema::IfcSchemaManager schemaManager;
//    webifc::parsing::IfcLoader loader(set.TAPE_SIZE, set.MEMORY_LIMIT, errorHandler, schemaManager);
//
//    auto start = ms();
//    loader.LoadFile([&](char *dest, size_t sourceOffset, size_t destSize)
//                    {
//                        uint32_t length = std::min(content.size() - sourceOffset, destSize);
//                        memcpy(dest, &content[sourceOffset], length);
//
//                        return length; });
// 
//    auto time = ms() - start;
//
//    std::cout << "Reading took " << time << "ms" << std::endl;
//     
//
//    webifc::geometry::IfcGeometryProcessor geometryLoader(loader,errorHandler,schemaManager,set.CIRCLE_SEGMENTS,set.COORDINATE_TO_ORIGIN, set.OPTIMIZE_PROFILES);
//
//    start = ms();   
//    auto errors = errorHandler.GetErrors();
//    errorHandler.ClearErrors();
//
//    for (auto error : errors)
//    {
//        std::cout << error.expressID << " " << error.ifcType << " " << std::to_string((int)error.type) << " " << error.message << std::endl;
//    }
//
//    time = ms() - start;
//
//    std::cout << "Generating geometry took " << time << "ms" << std::endl;
//
//    std::cout << "Done" << std::endl;
//}

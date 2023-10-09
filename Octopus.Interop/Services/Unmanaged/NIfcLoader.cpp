#include <iostream>
#include <fstream>
#include <sstream>
#include <filesystem> 
#include "NIfcLoader.h"
 
using namespace webifc::geometry;


void NIfcLoader::LoadFile(const std::string& filename) {

	std::cout << "Loading file: " << filename << std::endl;

	const std::string content = ReadFile(filename);

	(*_loader).LoadFile([&](char* dest, size_t sourceOffset, size_t destSize)
	{
		const uint32_t length = std::min(content.size() - sourceOffset, destSize);
		memcpy(dest, &content[sourceOffset], length);
		return length; 
	});

	_geometryLoader = new IfcGeometryProcessor
		((*_loader), _errorHandler, _schemaManager, set.CIRCLE_SEGMENTS, set.COORDINATE_TO_ORIGIN, set.OPTIMIZE_PROFILES);
}


std::string NIfcLoader::ReadFile(const std::string& filename)
{
	const std::ifstream t(filename);
    std::ostringstream buff;
	buff << t.rdbuf();
    return buff.str();
}
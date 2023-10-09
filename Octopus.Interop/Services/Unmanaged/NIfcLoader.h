#pragma once

#include "../../../Octopus.GeometryProcessor/geometry/representation/geometry.h"
#include "../../../Octopus.GeometryProcessor/schema/ifc-schema.h"
#include "../../../Octopus.GeometryProcessor/parsing/IfcLoader.h"
#include "../../../Octopus.GeometryProcessor/utility/LoaderError.h"
#include "../../../Octopus.GeometryProcessor/utility/LoaderSettings.h"
#include "../../../Octopus.GeometryProcessor/geometry/IfcGeometryProcessor.h"

using namespace Octopus::Abstractions;
using namespace webifc::geometry;

class NIfcLoader
{
private:
	webifc::utility::LoaderErrorHandler _errorHandler;
	webifc::schema::IfcSchemaManager _schemaManager;
	webifc::utility::LoaderSettings set;
	webifc::parsing::IfcLoader* _loader;
	IfcGeometryProcessor* _geometryLoader;
	std::string ReadFile(const std::string& filename);

public:
	NIfcLoader(): _geometryLoader(nullptr)
	{
		_loader = new webifc::parsing::IfcLoader(set.TAPE_SIZE, set.MEMORY_LIMIT, _errorHandler, _schemaManager);
	}

	~NIfcLoader()
	{
		delete _loader;
		if(_geometryLoader != nullptr)
			delete _geometryLoader;
	}
	void LoadFile(const std::string& filename);

	IfcGeometryProcessor* GetGeometryLoader() const
	{ 
		return _geometryLoader;
	}
};

#pragma once

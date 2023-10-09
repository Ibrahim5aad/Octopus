#pragma once

#include "../../../Octopus.GeometryProcessor/geometry/representation/geometry.h"
#include "../../../Octopus.GeometryProcessor/parsing/IfcLoader.h"
#include "../../../Octopus.GeometryProcessor/geometry/IfcGeometryProcessor.h"

using namespace Octopus::Abstractions;
using namespace webifc::geometry;

class NMeshFactory
{
private:
	IfcGeometryProcessor* _geoProcessor;
public:
	explicit NMeshFactory(IfcGeometryProcessor* geoProcessor) : _geoProcessor(geoProcessor)
	{	
	}

	IfcComposedMesh BuildMesh(int id) const;
	void ToObj(IfcComposedMesh& mesh, const std::string& path) const;
};
 

#pragma once

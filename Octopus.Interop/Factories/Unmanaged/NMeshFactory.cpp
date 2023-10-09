
#include "NMeshFactory.h";
#include "../../../Octopus.GeometryProcessor/test/io_helpers.h"

using namespace webifc::geometry;
using namespace webifc::io;

IfcComposedMesh NMeshFactory::BuildMesh(const int id) const
{
	auto mesh = _geoProcessor->GetMesh(id);
	return mesh;
}

void NMeshFactory::ToObj(IfcComposedMesh& mesh, const std::string& path) const
{
	DumpMesh(mesh, *_geoProcessor, path);
}


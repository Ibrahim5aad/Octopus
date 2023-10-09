
#include "IfcLoader.h"
#include "../../Octopus.GeometryProcessor/geometry/IfcGeometryProcessor.h"
#include "../../Octopus.GeometryProcessor/schema/ifc-schema.h"
#include "../../Octopus.GeometryProcessor/parsing/IfcLoader.h"
#include "..\Geometry\OctopusComposedMesh.h"
#include <msclr\marshal_cppstd.h>

using namespace Octopus::Abstractions;
using namespace webifc::geometry;
using namespace Octopus::Geometry;

namespace Octopus
{
	namespace Services
	{
		void IfcLoader::LoadFile(System::String^ path)
		{
			std::string unmanaged = msclr::interop::marshal_as<std::string>(path);
			Native().LoadFile(unmanaged);
		};
	}
}
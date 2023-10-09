
#include "MeshFactory.h"
#include "../../Octopus.GeometryProcessor/parsing/IfcLoader.h"
#include "..\Geometry\OctopusComposedMesh.h"
#include <msclr\marshal_cppstd.h>

using namespace Octopus::Abstractions;
using namespace webifc::geometry;
using namespace Octopus::Geometry;

namespace Octopus
{
	namespace Factories
	{
		IOctopusComposedMesh^ MeshFactory::BuildMesh(const int id)
		{
			const auto nativeMesh = Native().BuildMesh(id);
			IOctopusComposedMesh^ result = gcnew OctopusComposedMesh(new IfcComposedMesh(nativeMesh));
			return result;
		};

		void MeshFactory::DumpMesh(IOctopusComposedMesh^ mesh, System::String^ path)
		{
			const auto nativeMesh = static_cast<OctopusComposedMesh^>(mesh)->Ptr();
			const std::string unmanagedPath = msclr::interop::marshal_as<std::string>(path);
			std::cout << "Dumping mesh " << nativeMesh->expressID << std::endl;
			std::cout << "Dumping mesh to path: " << unmanagedPath << std::endl;
			std::cout << "Dumping mesh, has geometry: " << nativeMesh->hasGeometry << std::endl;
			
			Native().ToObj(*nativeMesh, unmanagedPath);
		};
	}
}


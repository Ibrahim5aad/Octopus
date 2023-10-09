#pragma once

#include "Unmanaged/NMeshFactory.h"
#include "../ManagedHandle.h"
#include "../Services/IfcLoader.h"
#include <msclr\marshal_cppstd.h>

using namespace Octopus::Abstractions;
using namespace Octopus::Services;

namespace Octopus
{
	namespace Factories
	{
		public ref class MeshFactory : ManagedHandle<NMeshFactory>
		{

		public:
			MeshFactory(IfcLoader^ loader) : ManagedHandle(new NMeshFactory(loader->Ptr()->GetGeometryLoader())) {
			}
			virtual IOctopusComposedMesh^ BuildMesh(int id);
			virtual void DumpMesh(IOctopusComposedMesh^ mesh, System::String^ path);
		};
	}
}
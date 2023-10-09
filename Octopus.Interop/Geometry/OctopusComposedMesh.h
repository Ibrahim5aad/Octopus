#pragma once

#include "../../Octopus.GeometryProcessor/geometry/representation/geometry.h"
#include "../ManagedHandle.h"


namespace webifc::geometry
{
	struct IfcComposedMesh;
}

using namespace webifc::geometry;
using namespace Octopus::Abstractions;

namespace Octopus
{
	namespace Geometry
	{ 
		public ref class OctopusComposedMesh : IOctopusComposedMesh, ManagedHandle<IfcComposedMesh>
		{
			private:
				IOctopusColor^ _color;
			public:
				OctopusComposedMesh(IfcComposedMesh* mesh) : ManagedHandle(mesh){
				}
				virtual IOctopusColor^ GetColor();
				virtual array<float>^ GetTransformation();

				virtual property int ExpressId {
					int get() {
						return Native().expressID;
					}
				}
		};
		 
	}
}

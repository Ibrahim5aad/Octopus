#pragma once

#include "Unmanaged/NIfcLoader.h"
#include "../ManagedHandle.h"


using namespace Octopus::Abstractions;


namespace Octopus
{
	namespace Services
	{
		public ref class IfcLoader : ManagedHandle<NIfcLoader>
		{

		public:
			IfcLoader() : ManagedHandle(new NIfcLoader()) {
			}
			virtual void LoadFile(System::String^ path);
		};
	}
}
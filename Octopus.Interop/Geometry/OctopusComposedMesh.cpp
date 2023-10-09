
#include "OctopusComposedMesh.h"
#include "..\Styles\OctopusColor.h"

using namespace Octopus::Abstractions;
using namespace Octopus::Styles;

namespace Octopus
{
	namespace Geometry
	{
		IOctopusColor^ OctopusComposedMesh::GetColor()
		{
			if(_color != nullptr)
				return _color;

			const auto& color = Native().GetColor();
			if(color.has_value())
				return _color = gcnew OctupusColor(color.value());
			return nullptr;
		}


		array<float>^ OctopusComposedMesh::GetTransformation() {
			array<float>^ result = gcnew array<float>(16);
			for (int i = 0; i < 4; i++)
			{
				for (int j = 0; j < 4; j++)
				{
					result[i] = Native().transformation[i][j];
				}
			}

			return result;
		}
	}

}
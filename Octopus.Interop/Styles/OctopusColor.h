#pragma once
#include <glm/glm.hpp>
#include "../ManagedHandle.h"

using namespace Octopus::Abstractions;


namespace Octopus
{
	namespace Styles
	{
		public ref class OctupusColor : IOctopusColor
		{ 
		private:
			float _r;
			float _g;
			float _b;
			float _a;
		public:
			OctupusColor(const glm::dvec4& color) {
				_r = color.r;
				_g = color.g;
				_b = color.b;
				_a = color.a;
			}

			virtual property float R { float get() { return _r; } }
			virtual property float G { float get() { return _g; } }
			virtual property float B { float get() { return _b; } }
			virtual property float A { float get() { return _a; } }
		};

	}
}

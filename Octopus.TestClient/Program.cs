using Octopus.Abstractions;
using Octopus.Factories;
using Octopus.Services;

namespace Octopus.TestClient;

internal abstract class Program
{
    static void Main(string[] args)
    {
        var loader = new IfcLoader();
        loader.LoadFile(@"C:\Users\Ibrahim Saad\Desktop\samples\BimHouseFederated.ifc");
        var fac = new MeshFactory(loader);

        IOctopusComposedMesh mesh = fac.BuildMesh(3687);
        fac.DumpMesh(mesh, @"C:\Users\Ibrahim Saad\Desktop\BimHouseFederated.obj");
        var tra = mesh.GetTransformation();
        var color = mesh.GetColor();
    }
}
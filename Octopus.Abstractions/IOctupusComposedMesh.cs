namespace Octopus.Abstractions
{
    public interface IOctopusComposedMesh
    {
        int ExpressId { get; }
        IOctopusColor GetColor();
        float[] GetTransformation();
    }
}
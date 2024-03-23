using JarvisAuth.Domain.Enums;

namespace JarvisAuth.Domain.ValueObjects;

public class GenderVO
{
    public TypeGenders Type { get; set; }
    public string? Name { get; set; }
}


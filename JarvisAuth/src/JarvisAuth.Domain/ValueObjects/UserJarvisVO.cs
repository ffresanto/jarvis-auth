using JarvisAuth.Domain.Enums;

namespace JarvisAuth.Domain.ValueObjects;

public class UserJarvisVO
{
    public TypeUserJarvis Type { get; set; }
    public string? Name { get; set; }
}

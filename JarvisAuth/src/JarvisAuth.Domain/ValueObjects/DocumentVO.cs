using JarvisAuth.Domain.Enums;

namespace JarvisAuth.Domain.ValueObjects;

public class DocumentVO
{
    public TypeDocuments Type { get; set; }
    public string? Name { get; set; }
}

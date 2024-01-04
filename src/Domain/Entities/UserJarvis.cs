using Domain.Enums;

namespace Domain.Entities
{
    public class UserJarvis : Entity
    {
        public string? Name { get; set; }
        public string? Email { get; set; }
        public string? Password { get; set; }
        public int? ContactNumber { get; set; }
        public TypesGenders TypeGender { get; set; }
        public TypesDocuments TypeDocument { get; set; }
        public string? NumberDocument { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set;}
        public TypesUsersJarvis TypeUserJarvis { get; set;}
        public bool Enabled { get; set; }

    }
}

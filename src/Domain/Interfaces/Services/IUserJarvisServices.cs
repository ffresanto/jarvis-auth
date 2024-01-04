using Domain.Entities;

namespace Domain.Interfaces.Services
{
    public interface IUserJarvisServices : IDisposable
    {
        Task CreateUserJarvis(UserJarvis userJarvis);
        Task UpdateUserJarvis(UserJarvis userJarvis);
        Task DeleteUserJarvis(Guid id);
        Task DisableUserJarvis(Guid id);
        Task EnableUserJarvis(Guid id);
    }
}

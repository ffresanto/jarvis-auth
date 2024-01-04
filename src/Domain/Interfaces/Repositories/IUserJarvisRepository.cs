using Domain.Entities;

namespace Domain.Interfaces.Repositories
{
    public interface IUserJarvisRepository : IRepository<UserJarvis>
    {
        Task DisableUserJarvis(Guid id);
        Task EnableUserJarvis(Guid id);
    }
}

using Domain.Entities;
using Domain.Interfaces.Repositories;
using Domain.Interfaces.Services;

namespace Application.Services
{
    public class UserJarvisService : BaseService, IUserJarvisServices
    {
        private readonly IUserJarvisRepository _userJarvisRepository;
        public UserJarvisService(IUserJarvisRepository userJarvisRepository)
        {
            _userJarvisRepository = userJarvisRepository;
        }
        public async Task CreateUserJarvis(UserJarvis userJarvis)
        {
            await _userJarvisRepository.Create(userJarvis);
        }
        public async Task UpdateUserJarvis(UserJarvis userJarvis)
        {
            await _userJarvisRepository.Update(userJarvis);
        }

        public async Task DeleteUserJarvis(Guid id)
        {
            await _userJarvisRepository.Remove(id);
        }

        public async Task DisableUserJarvis(Guid id)
        {
            await _userJarvisRepository.DisableUserJarvis(id);
        }

        public async Task EnableUserJarvis(Guid id)
        {
            await _userJarvisRepository.EnableUserJarvis(id);
        }

        public void Dispose()
        {
            _userJarvisRepository?.Dispose();
        }
    }
}

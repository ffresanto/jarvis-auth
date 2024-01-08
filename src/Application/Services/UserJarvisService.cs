using Application.Notifications.Interfaces;
using Domain.Entities;
using Domain.Entities.Validations;
using Domain.Interfaces.Repositories;
using Domain.Interfaces.Services;

namespace Application.Services
{
    public class UserJarvisService : BaseService, IUserJarvisServices
    {
        private readonly IUserJarvisRepository _userJarvisRepository;
        public UserJarvisService(IUserJarvisRepository userJarvisRepository, INotifier notifier) : base(notifier)
        {
            _userJarvisRepository = userJarvisRepository;
        }
        public async Task CreateUserJarvis(UserJarvis userJarvis)
        {
            if (!ExecuteValidation(new UserJarvisValidation(), userJarvis)) return;

            if (_userJarvisRepository.Find(f => f.Email == userJarvis.Email).Result.Any()) Notify("This email is already being used by another user.");

            await _userJarvisRepository.Create(userJarvis);
        }
        public async Task UpdateUserJarvis(UserJarvis userJarvis)
        {
            if (!ExecuteValidation(new UserJarvisValidation(), userJarvis)) return;

            var user = _userJarvisRepository.FindById(userJarvis.Id);

            if (user == null) { Notify("User does not exist."); return; };

            await _userJarvisRepository.Update(userJarvis);
        }

        public async Task DeleteUserJarvis(Guid id)
        {
            var user = _userJarvisRepository.FindById(id);

            if (user == null) { Notify("User does not exist."); return; };

            await _userJarvisRepository.Remove(id);
        }

        public async Task DisableUserJarvis(Guid id)
        {
            var user = _userJarvisRepository.FindById(id);

            if (user == null) { Notify("User does not exist."); return; }
            if (user?.Result.Enabled == false) { Notify("The user is already disabled."); return; };

            await _userJarvisRepository.DisableUserJarvis(id);
        }

        public async Task EnableUserJarvis(Guid id)
        {
            var user = _userJarvisRepository.FindById(id);

            if (user == null) { Notify("User does not exist."); return; }
            if (user?.Result.Enabled == true) { Notify("The user is already enabled."); return; };

            await _userJarvisRepository.EnableUserJarvis(id);
        }

        public void Dispose()
        {
            _userJarvisRepository?.Dispose();
        }
    }
}

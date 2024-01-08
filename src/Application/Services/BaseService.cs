using Application.Notifications;
using Application.Notifications.Interfaces;
using Domain.Entities;
using FluentValidation;
using FluentValidation.Results;

namespace Application.Services
{
    public abstract class BaseService
    {
        private readonly INotifier? _notifier;

        public BaseService(INotifier notifier)
        {
            _notifier = notifier;
        }
        protected void Notify(ValidationResult validationResult)
        {
            foreach (var item in validationResult.Errors)
            {
                Notify(item.ErrorMessage);
            }
        }

        protected void Notify(string message)
        {
            _notifier?.Handle(new Notification(message));
        }

        protected bool ExecuteValidation<TValidation, TEntity>(TValidation validation, TEntity entity) where TValidation : AbstractValidator<TEntity> where TEntity : Entity
        {
            var validator = validation.Validate(entity);

            if (validator.IsValid) return true;

            Notify(validator);

            return false;
        }
    }
}

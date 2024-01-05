using Domain.Entities;
using FluentValidation;

namespace Application.Services
{
    public abstract class BaseService
    {
        protected bool ExecuteValidation<TValidation, TEntity>(TValidation validation, TEntity entity) where TValidation : AbstractValidator<TEntity> where TEntity : Entity
        {
            var validator = validation.Validate(entity);

            if (validator.IsValid) return true;

            return false;
        }
    }
}

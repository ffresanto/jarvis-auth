using FluentValidation;

namespace Domain.Entities.Validations
{
    public class UserJarvisValidation : AbstractValidator<UserJarvis>
    {
        public UserJarvisValidation() 
        {
            RuleFor(x => x.Name)
                .NotEmpty().WithMessage("The {PropertyName} field cannot be empty")
                .Length(2, 100).WithMessage("The {PropertyName} field must be between {MinLength} and {MaxLength} characters");

            RuleFor(x => x.Email)
               .NotEmpty().WithMessage("The {PropertyName} field cannot be empty")
               .Length(0, 100).WithMessage("The {PropertyName} field must be between {MinLength} and {MaxLength} characters");

            RuleFor(x => x.Password)
               .NotEmpty().WithMessage("The {PropertyName} field cannot be empty")
               .Length(0, 100).WithMessage("The {PropertyName} field must be between {MinLength} and {MaxLength} characters");

            RuleFor(x => x.ContactNumber)
               .NotEmpty().WithMessage("The {PropertyName} field cannot be empty");

            RuleFor(x => x.TypeGender)
                .NotEmpty().WithMessage("The {PropertyName} field cannot be empty");

            RuleFor(x => x.CreatedAt)
                .NotEmpty().WithMessage("The {PropertyName} field cannot be empty");

            RuleFor(x => x.UpdatedAt)
                 .NotEmpty().WithMessage("The {PropertyName} field cannot be empty");

            RuleFor(x => x.TypeUserJarvis)
               .NotEmpty().WithMessage("The {PropertyName} field cannot be empty");

            RuleFor(x => x.Enabled)
                .NotEmpty().WithMessage("The {PropertyName} field cannot be empty");
        }
    }
}

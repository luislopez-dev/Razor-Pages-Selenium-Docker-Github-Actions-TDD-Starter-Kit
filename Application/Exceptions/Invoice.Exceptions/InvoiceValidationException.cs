using FluentValidation.Results;

namespace Application.Exceptions.Invoice.Exceptions;

/// <summary>
/// EXCEPTION FOR INVOICE VALIDATIONS
/// </summary>
/// <remarks>
/// Author: Luis López  
/// GitHub: https://github.com/luislopez-dev
/// </remarks>
public class InvoiceValidationException: ValidationException
{
    public InvoiceValidationException(List<ValidationFailure> failures) : base(failures)
    {
    }
}
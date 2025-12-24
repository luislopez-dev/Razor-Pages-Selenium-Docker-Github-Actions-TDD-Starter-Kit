
namespace Application.Repositories;

/// <summary>
/// INVOICE-PRODUCT REPOSITORY INTERFACE
/// </summary>
/// <remarks>
/// Author: Luis López  
/// GitHub: https://github.com/luislopez-dev
/// </remarks>
public interface IInvoiceProductRepository
{
    public Task CreateRecordAsync(int invoiceId, int[] selectedProducts, CancellationToken cancellationToken);
}
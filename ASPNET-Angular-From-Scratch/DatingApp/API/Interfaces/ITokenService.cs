using System.Threading.Tasks;
using DatingApp.API.Entities;

namespace DatingApp.API.Services
{
    public interface ITokenService
    {
        Task<string> CreateToken(AppUser user);
    }
}
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using DatingApp.API.Data;
using DatingApp.API.DTOs;
using DatingApp.API.Entities;
using DatingApp.API.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DatingApp.API.Controllers
{
  public class AccountController : BaseApiController
  {
    private readonly DataContext _context;
    private readonly ITokenService _tokenService;
    public AccountController(DataContext context, ITokenService tokenService)
    {
      _tokenService = tokenService;
      _context = context;
    }

    [HttpPost("register")]
    public async Task<ActionResult<UserDto>> Register(RegisterDto registerDto)
    {

      if (await UserExists(registerDto.Username)) return BadRequest("Username is taken");

      using var hmac = new HMACSHA512();

      var user = new AppUser
      {
        UserName = registerDto.Username.ToLower(),
        PasswordHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(registerDto.Password)),
        SaltHash = hmac.Key,
      };

      _context.Users.Add(user);
      await _context.SaveChangesAsync();

      return new UserDto {
          Username = user.UserName,
          Token = _tokenService.CreateToken(user),
      };
    }

    public async Task<ActionResult<UserDto>> Login(LoginDto loginDto)
    {
      var user = await _context.Users.SingleOrDefaultAsync(x => x.UserName == loginDto.Username);

      if (user == null) return Unauthorized("Invalid credentials");

      using var hmac = new HMACSHA512(user.SaltHash);

      var comuptedHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(loginDto.Password));

      for (int i = 0; i < comuptedHash.Length; i++)
      {
        if (comuptedHash[i] != user.PasswordHash[i]) return Unauthorized("Invalid credentials");
      }

      return new UserDto {
          Username = user.UserName,
          Token = _tokenService.CreateToken(user),
      };
    }

    private async Task<bool> UserExists(string username)
    {
      return await _context.Users.AnyAsync(x => x.UserName == username.ToLower());
    }


  }
}
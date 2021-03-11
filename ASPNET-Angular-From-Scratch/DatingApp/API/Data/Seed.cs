using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using DatingApp.API.Entities;
using Microsoft.EntityFrameworkCore;

namespace DatingApp.API.Data
{
  public class Seed
  {
    public static async Task SeedUsers(DataContext context)
    {
      if (await context.Users.AnyAsync()) return;

      var userData = await System.IO.File.ReadAllTextAsync("Data/UserSeedData.json");

      var users = JsonSerializer.Deserialize<List<AppUser>>(userData);

      foreach (var user in users)
      {
        using var hmac = new HMACSHA512();

        user.UserName = user.UserName.ToLower();
        user.PasswordHash = hmac.ComputeHash(Encoding.UTF8.GetBytes("Pa$$word")); // all getting simple password as password
        user.SaltHash = hmac.Key;

        context.Users.Add(user);

      }
      await context.SaveChangesAsync();
    }
  }
}
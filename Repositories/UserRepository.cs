using Microsoft.EntityFrameworkCore;
using ParkingSpaceAPI.Models;
using ParkingSpacesAPI.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ParkingSpaceAPI.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly UserDbContext _context;

        public UserRepository(UserDbContext context)
        {
            _context = context;
        }
        public async Task<User> Create(User user)
        {
            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            return user;
        }

        public async Task Delete(int id)
        {
            var userToDelete = await _context.Users.FindAsync(id);
            _context.Users.Remove(userToDelete);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<User>> Get()
        {
            return await _context.Users.ToListAsync();
        }

        public async Task<User> Get(int id)
        {
            return await _context.Users.FindAsync(id);
        }

        public async Task Update(User user)
        {
            _context.Entry(user).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<UserParkingPlaces>> GetUsers2()
        {
            var userList = (from u in _context.Users
                            join r in _context.Reservations on u.Id equals r.UserID
                            join ps in _context.ParkingSpaces on r.ParkingSpaceID equals ps.Id
                            join b in _context.Buildings on ps.BuildingID equals b.Id
                            select new UserParkingPlaces()
                            {
                                Id = u.Id,
                                Name = u.Name,
                                PhoneNumber = u.PhoneNumber,
                                Email = u.Email,
                                ParkingSpaceID = r.ParkingSpaceID,
                                Date = r.Date,
                                FloorNumber = ps.FloorNumber,
                                HasCharger = ps.HasCharger,
                                BuildingName = b.BuildingName
                            }).ToList();

            await _context.SaveChangesAsync();
            return userList;
        }
    }
}

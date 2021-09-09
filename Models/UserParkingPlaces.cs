using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ParkingSpaceAPI.Models
{
    public class UserParkingPlaces
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public int ParkingSpaceID { get; set; }
        public DateTime Date { get; set; }
        public int FloorNumber { get; set; }
        public Boolean HasCharger { get; set; }
        public string BuildingName { get; set; }
    }
}

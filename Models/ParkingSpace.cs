using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ParkingSpaceAPI.Models
{
    public class ParkingSpace
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required]
        public int FloorNumber { get; set; }
        [Required]
        public int SpaceNumber { get; set; }
        [Required]
        public Boolean HasCharger { get; set; }
        [Required]
        public int BuildingID { get; set; }
    }
}

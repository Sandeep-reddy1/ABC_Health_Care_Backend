using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EHealthCare_API.Models
{
    public class Category
    {
        [Key]
        public int ID { get; set; }

        [Required]
        public string CategoryName { get; set; }


    }
}

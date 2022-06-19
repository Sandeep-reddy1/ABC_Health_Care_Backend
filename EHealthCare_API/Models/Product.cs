using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EHealthCare_API.Models
{
    public class Product
    {
        [Key]
        public int ID { get; set; }
        [Required]

        public string ProductName { get; set; }
        [Required]
        public double ProductPrice { get; set; }
        [Required]
        public string ProductImage { get; set; }
        [Required]
        public string ProductSeller { get; set; }
        
        [Required]
        public string ProductDescription { get; set; }
        [Required]
        public string ProductCategory { get; set; }
        

    }
}

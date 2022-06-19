using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EHealthCare_API.Models
{
    public class Cart
    {
        [Key]
        public int ID { get; set; }
        [Required]
        public string UserEmailId { get; set; }
        [Required]
        public int CartProductId { get; set; }
        [Required]
        public string CartProductName { get; set; }
        [Required]
        public double CartProductPrice { get; set; }
        [Required]
        public string CartProductImage { get; set; }
        [Required]
        public int CartProductQuantity { get; set; }
    }
}

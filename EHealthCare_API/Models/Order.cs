using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EHealthCare_API.Models
{
    public class Order
    {
        [Key]
        public int ID { get; set; }
        [Required]
        public string UserEmailId { get; set; }
        [Required]
        public string Address { get; set; }

        [Required]
        public string PhoneNumber { get; set; }
        [Required]
        public int OrderProductId { get; set; }
        [Required]
        public string OrderProductName { get; set; }
        [Required]
        public double OrderProductPrice { get; set; }
        [Required]
        public string OrderProductImage { get; set; }
        [Required]
        public int OrderProductQuantity { get; set; }
        [Required]
        public string OrderProductDateTime { get; set; }
    }
}

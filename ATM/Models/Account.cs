using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ATM.Models
{
    public class Account
    {
        [Display(Name ="Account #")]
        public int Id { get; set; }
        public User User { get; set; }
        public int UserId { get; set; }
        public decimal Balance { get; set; }
    }
}
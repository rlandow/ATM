using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ATM.Models
{
    public class User
    {
        public int Id { get; set; }
        [Display(Name = "PIN")]
        public int Pin { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ATM.Models;

namespace ATM.Models
{
    public class Transaction
    {
        public int Id { get; set; }
        public Account Account { get; set; }
        public int AccountId { get; set; }
        public string Type { get; set; }
        public decimal Amount { get; set; }


    }
}
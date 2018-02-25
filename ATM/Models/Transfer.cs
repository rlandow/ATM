using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ATM.Models
{
    public class Transfer
    {
        public int Id { get; set; }
        public int TargetAccount { get; set; }
        public Transaction Transaction { get; set; }
        public int TransactionID { get; set; }

    }
}
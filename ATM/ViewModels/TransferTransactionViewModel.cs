using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ATM.Models;

namespace ATM.ViewModels
{
    public class TransferTransactionViewModel
    {
        public List<Account> Accounts { get; set; }
        public Transaction Transaction { get; set; }
        public Transfer Transfer { get; set; }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ATM.Models;
using ATM.ViewModels;


namespace ATM.Controllers
{
    public class TransactionController : Controller
    {
        private ATMDataContext _context;

        private bool badTransfer = false;

        public TransactionController()
        {
            _context = new ATMDataContext();
        }

        // GET: Transaction
        public ActionResult Index(int Id, string Type)
        {
            if (Type == "D") return View("Deposit", new Transaction {AccountId = Id } );
            if (Type == "W") return View("Withdrawal", new Transaction { AccountId = Id });
            if (Type == "T")
            {
                var userId = _context.Accounts.Where(a => a.Id == Id).Select(a => new { a.UserId }).Single();

                List<Account> accounts = _context.Accounts.Where(a => a.UserId == userId.UserId).Where(a => a.Id != Id).ToList();

                TransferTransactionViewModel transferTransactionViewModel = new TransferTransactionViewModel
                {
                     Accounts = accounts, 
                     Transaction = new Transaction { AccountId = Id }

                };

                return View("Transfer", transferTransactionViewModel );
            }

            return View();
        }

        public ActionResult Deposit(Transaction transaction)
        {
            
            //Add deposit to transaction table
            transaction.Type = "D";
            _context.Transactions.Add(transaction);

            //Fetch account and increment balance by deposit amount
            var account = _context.Accounts.SingleOrDefault(a => a.Id == transaction.AccountId);
            account.Balance = account.Balance + transaction.Amount;

            _context.SaveChanges();

            //Redirect to account summary
            return RedirectToAction("Index", "Account", new { Id = account.UserId });
        }

        public ActionResult Withdrawal(Transaction transaction)
        {
            //Fetch account and check if funds sufficient for withdrawal
            var account = _context.Accounts.Single(a => a.Id == transaction.AccountId);

            //If insufficient funds give chance to try again
            if (transaction.Amount > account.Balance)
            {
                TempData["message"] = "Insufficient funds for a withdrawal of $" + transaction.Amount;
                return View(transaction);
            }


            //Add withdrawl to transaction table
            transaction.Type = "W";
            _context.Transactions.Add(transaction);

            account.Balance = account.Balance - transaction.Amount;
            _context.SaveChanges();

            return RedirectToAction("Index", "Account", new { Id = account.UserId });

        }

        public ActionResult Transfer(TransferTransactionViewModel transferTransaction )
        {
            
            if (transferTransaction.Transfer.TargetAccount == 0 || transferTransaction.Transaction.Amount == 0)
            {
                badTransfer = true;
                TempData["message"] = "Transfer information incomplete";
            }
             

            //Fetch account and check if funds sufficient for withdrawal
            var account = _context.Accounts.Single(a => a.Id == transferTransaction.Transaction.AccountId);

            //If insufficient funds give chance to try again
            if (transferTransaction.Transaction.Amount > account.Balance)
            {
                badTransfer = true;
                TempData["message"] = "Insufficient funds for a tranfer of $" + transferTransaction.Transaction.Amount;
            }

            if (badTransfer)
            {
                List<Account> accounts = _context.Accounts.Where(a => a.UserId == account.UserId).Where(a => a.Id != transferTransaction.Transaction.AccountId).ToList();
                transferTransaction.Accounts = accounts;
                return View(transferTransaction);
            }

            transferTransaction.Transaction.Type = "T";
            _context.Transactions.Add (transferTransaction.Transaction);
            _context.SaveChanges();

            transferTransaction.Transfer.TransactionID = transferTransaction.Transaction.Id;
            _context.Transfers.Add(transferTransaction.Transfer);
            _context.SaveChanges();


            //Fetch source account and decrement balance by the transfer amount
            var account2 = _context.Accounts.SingleOrDefault(a => a.Id == transferTransaction.Transaction.AccountId);
            account2.Balance = account2.Balance - transferTransaction.Transaction.Amount;
            _context.SaveChanges();
            
            //Fetch traget account and increment balance by the transfer amount
            var account3 = _context.Accounts.SingleOrDefault(a => a.Id == transferTransaction.Transfer.TargetAccount);
            account3.Balance = account3.Balance + transferTransaction.Transaction.Amount;

            _context.SaveChanges();

            return RedirectToAction("Index", "Account", new { Id = account.UserId });
        }
    }
}
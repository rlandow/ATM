using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ATM.Models;

namespace ATM.Controllers
{
    public class AccountController : Controller
    {
        private ATMDataContext _context;

        public AccountController()
        {
            _context = new ATMDataContext();
        }
        // GET: Account
        public ActionResult Index(int Id)
        {
            IEnumerable<Account> Account = _context.Accounts.Where(a => a.UserId == Id).ToList();
            return View(Account);
        }
    }
}
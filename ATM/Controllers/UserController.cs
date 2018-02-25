using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ATM.Models;

namespace ATM.Controllers
{
    public class UserController : Controller
    {
        private ATMDataContext _context;

        public UserController()
        {
            _context = new ATMDataContext();
        }


        // GET: User
        public ActionResult Login(User user)
        {
            var loginUser = _context.Users.SingleOrDefault(u => u.Pin == user.Pin);
            if (loginUser == null) {
                TempData["message"] = "Invalid PIN. Please try again.";
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
    }
}
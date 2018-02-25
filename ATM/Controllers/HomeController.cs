using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ATM.Models;

namespace ATM.Controllers
{
    public class HomeController : Controller
    {
        private ATMDataContext _context;

        public HomeController()
        {
            _context = new ATMDataContext();
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login(User user)
        {
            var loginUser = _context.Users.SingleOrDefault(u => u.Pin == user.Pin);
            if (loginUser == null)
            {
                TempData["message"] = "Invalid PIN. Please try again.";
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("Index", "Account", new { Id = loginUser.Id } );
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
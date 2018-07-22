using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace stage2.Controllers
{
    public class HomeController : Controller
    {
        private INameService nameService = new NameService();
        public IActionResult Index()
        {
            ViewData["Name"] = this.nameService.GetName(null);
            return View();
        }

        public IActionResult Error()
        {
            ViewData["RequestId"] = Activity.Current?.Id ?? HttpContext.TraceIdentifier;
            return View();
        }
    }
}

using K8sTest.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace K8sTest.Controllers
{
    public class OrderController : Controller
    {
        [HttpGet]
        public JsonResult getOrder(){
            return Json(new{id="123456",name="歡樂全家桶",price=2000});
        }
    }
}

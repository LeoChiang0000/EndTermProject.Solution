using EndTermProject.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.UI.WebControls;

namespace EndTermProject.Solution.Controllers.Api
{
    public class OrderApiController : ApiController
    {
        public IHttpActionResult GetOrder()
        {
            var repo = new OrderRepository();
            var vm = repo.GetOrderItems(7);
            return Ok(vm);
        }
    }
}

using EndTermProject.Repositories;
using EndTermProject.Solution.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace EndTermProject.Solution.Controllers.Api
{
    public class CitiesApiController : ApiController
    {
        public IHttpActionResult GetCities()
        {
            var cities = new CityRepository().GetAll();
            var vm = cities.Select(c => c.ToVm()).ToList();
            return Ok(vm);
        }
    }
}

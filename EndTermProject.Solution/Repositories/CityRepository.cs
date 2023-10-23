
using EndTermProject.Models.ViewModels;
using EndTermProject.Solution.Models.EFModels;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EndTermProject.Repositories
{
	public class CityRepository
	{
		public List<City> GetAll()
		{
			var db = new AppDbContext();
			var cities = db.Cities.AsNoTracking()
								.Include("Districts")
								.OrderBy(c => c.Id)
								.ToList();
			return cities;
		}
	}
}
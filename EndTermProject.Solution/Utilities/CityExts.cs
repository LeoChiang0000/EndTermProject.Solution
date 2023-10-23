using EndTermProject.Models.ViewModels;
using EndTermProject.Solution.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EndTermProject.Solution.Utilities
{
	public static class CityExts
	{
		public static CityVm ToVm(this City city)
		{
			var vm = new CityVm
			{
				Id = city.Id,
				Name = city.Name,
				Districts = city.Districts.Select(d => d.ToVm()).ToList(),
			};
			return vm;
		}

		public static DistrictVm ToVm(this District district)
		{
			var vm = new DistrictVm
			{
				Id = district.Id,
				Name = district.District1
			};
			return vm;
		}
	}
}
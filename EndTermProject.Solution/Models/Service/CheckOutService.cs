using EndTermProject.Models.ViewModels;
using EndTermProject.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;

namespace EndTermProject.Solution.Models.Service
{
	public class CheckOutService
	{
		public void CheckoutProcess(string account, CartVm cartvm, CheckoutVm checkoutVm)
		{
			new CheckoutRepository().CheckoutProcess(account,cartvm,checkoutVm);
		}
	}
}
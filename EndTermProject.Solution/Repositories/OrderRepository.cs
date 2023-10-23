
using EndTermProject.Models.ViewModels;
using EndTermProject.Solution.Models.EFModels;
using EndTermProject.Solution.Utilities;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EndTermProject.Repositories
{
	public class OrderRepository
	{
		public int GetMemberId(string account)
		{
			var db = new AppDbContext();
			var memberId = db.Members.FirstOrDefault(x => x.Account == account);
			if (memberId == null) return -1;

			return memberId.Id;
			
		}
		public List<OrderVm> GetOrder(int memberId)
		{
			var db = new AppDbContext();

			var items = db.Orders.Where(o => o.MemberId == memberId).ToList();
			var order = new List<OrderVm>();
			foreach (var item in items)
			{
				var orderVm = item.ToOrderVm();
				order.Add(orderVm);
			}

			return order;
		}
		public List<OrderVm> GetOrderItems(int orderId)
		{
			var db = new AppDbContext();
			var items = db.Orders.Where(o => o.Id == orderId).ToList();

			var order = new List<OrderVm>();
			foreach (var item in items)
			{
				var orderVm = item.ToOrderVm();
				order.Add(orderVm);
			}

			return order;
		}
	}
}
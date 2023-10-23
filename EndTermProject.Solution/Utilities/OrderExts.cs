using EndTermProject.Models.ViewModels;
using EndTermProject.Solution.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EndTermProject.Solution.Utilities
{
	public static class OrderExts
	{
		public static OrderVm ToOrderVm(this Order order)
		{
			var vm = new OrderVm
			{
				Id = order.Id,
				MemberId = order.MemberId,
				City = order.District.City.Name,
				District = order.District.District1,
				Address = order.Address,
				OrderTime = order.OrderTime,
				Receiver = order.Receiver,
				TelePhone = order.TelePhone,
				Email = order.Email,
				Status = order.Status.Status1,
				Paytype = order.Paytype.Paytype1,
				OrderItems = order.OrderItems.Select(oi => oi.ToOrderItemVm()).ToList(),
			};
			return vm;
		}

		public static OrderItemVm ToOrderItemVm(this OrderItem orderItem)
		{
			var vm = new OrderItemVm
			{
				Id = orderItem.Id,
				OrderId = orderItem.OrderId,
				ProductId = orderItem.ProductId,
				ProductName = orderItem.ProductName,
				ProductPrice = orderItem.ProductPrice,
				ProductImage = orderItem.Product.Image,
				Qty = orderItem.Qty,
				Brand = orderItem.Product.Brand.Name,
			};
			return vm;
		}
	}
}
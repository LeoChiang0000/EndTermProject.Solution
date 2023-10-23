using EndTermProject.Models.ViewModels;
using EndTermProject.Solution.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EndTermProject.Solution.Utilities
{
	public  static class CartExts
	{
		public static CartVm ToCartVm(this Cart cart)
		{
			var vm = new CartVm
			{
				Id = cart.Id,
				MemberAccount = cart.MemberAccount,
				CartItems = cart.CartItems.Select(ci => ci.ToCartItemVm()).ToList()
			};
			return vm;
		}
		public static CartItemVm ToCartItemVm(this CartItem cartItem)
		{
			var carItem = new CartItemVm
			{
				Id = cartItem.Id,
				CartId = cartItem.Id,
				ProductId = cartItem.ProductId,
				Qty = cartItem.Qty,
				Product = cartItem.Product.ToProductVm(),
			};
			return carItem;
		}

		public static ProductVm ToProductVm(this Product product)
		{
			var vm = new ProductVm
			{
				Id = product.Id,
				Name = product.Name,
				Price = product.Price,
				Image = product.Image,
			};
			return vm;
		}
	}
}
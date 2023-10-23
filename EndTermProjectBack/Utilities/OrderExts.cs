using EndTermProjectBack.Models.DTOs;
using EndTermProjectBack.Models.EFModels;
using EndTermProjectBack.Models.VMModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EndTermProjectBack.Utilities
{
	public static class OrderExts
	{
		public static OrderVm ToOrderVm(this OrderDTO dto)
		{
			var vm = new OrderVm
			{
				Id = dto.Id,
				MemberAccount = dto.MemberAccount,
				OrderTime = dto.OrderTime,
				Paytype = dto.Paytype,
				Status = dto.Status,
				City = dto.City,
				District = dto.District,
				Address = dto.Address,
				Receiver = dto.Receiver,
				TelePhone = dto.TelePhone,
				Email = dto.Email,
				OrderItems = dto.OrderItems.Select(oi => oi.ToOrderItemVm()).ToList(),
			};
			return vm;
		}
		public static OrderItemVm ToOrderItemVm(this OrderItemDTO dto)
		{
			var vm = new OrderItemVm
			{
				Id = dto.Id,
				OrderId = dto.OrderId,
				Qty = dto.Qty,
				ProductName = dto.ProductName,
				ProductPrice = dto.ProductPrice,
			};
			return vm;
		}
		public static OrderDTO ToOrderDTO(this Order order)
		{
			var dto = new OrderDTO
			{
				Id = order.Id,
				MemberAccount = order.Member.Account,
				OrderTime = order.OrderTime,
				Receiver = order.Receiver,
				TelePhone = order.TelePhone,
				Email = order.Email,
				City = order.District.City.Name,
				District = order.District.District1,
				Address = order.Address,
				Paytype = order.Paytype.Paytype1,
				Status = order.Status.Status1,
				OrderItems = order.OrderItems.Select(oi => oi.ToOrderItemDTO()).ToList(),
			};
			return dto;
		}
		public static OrderItemDTO ToOrderItemDTO(this OrderItem orderItem)
		{
			var dto = new OrderItemDTO
			{
				Id= orderItem.Id,
				OrderId = orderItem.OrderId,
				Qty = orderItem.Qty,
				ProductName = orderItem.ProductName,
				ProductPrice = orderItem.ProductPrice,
			};
			return dto;
		}
	}
}
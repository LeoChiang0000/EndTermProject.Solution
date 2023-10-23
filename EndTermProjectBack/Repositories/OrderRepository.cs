using EndTermProjectBack.Models.EFModels;
using EndTermProjectBack.Models.VMModels;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using EndTermProjectBack.Models;
using System.Reflection;
using EndTermProjectBack.Utilities;
using System.Net;
using Dapper;
using System.Runtime.Remoting.Channels;
using EndTermProjectBack.Models.DTOs;

namespace EndTermProjectBack.Repositories
{
	public class OrderRepository
	{
		public List<OrderDTO> Search(OrderSearchCriteria criteria)
		{
			var db = new AppDbContext();

			IQueryable<Order> query = db.Orders.AsNoTracking().Include(o => o.Member)
								.Include(o => o.District)
								.Include(o => o.Paytype)
								.Include(o => o.Status);

			query = ApplySearchCriteria(query, criteria);

			var dto = query.ToList().Select(q => q.ToOrderDTO()).ToList();

			return dto;
		}
		private IQueryable<Order> ApplySearchCriteria(IQueryable<Order> query, OrderSearchCriteria criteria)
		{
			if (!string.IsNullOrEmpty(criteria.Receiver))
			{
				query = query.Where(o => o.Receiver.Contains(criteria.Receiver));
			}
			if (!string.IsNullOrEmpty(criteria.Telephone))
			{
				query = query.Where(o => o.TelePhone.Contains(criteria.Telephone));
			}
			if (!string.IsNullOrEmpty(criteria.Email))
			{
				query = query.Where(o => o.Email.Contains(criteria.Email));
			}
			if (criteria.PaytypeId.HasValue)
			{
				query = query.Where(o => o.PaytypeId == criteria.PaytypeId);
			}
			if (criteria.StatusId.HasValue)
			{
				query = query.Where(o => o.StatusId == criteria.StatusId);
			}
			if (criteria.StartDate.HasValue)
			{
				query = query.Where(o => o.OrderTime > criteria.StartDate);
			}
			if (criteria.EndDate.HasValue)
			{
				query = query.Where(o => o.OrderTime < criteria.EndDate);
			}
			return query;
		}
		public void UpdateStatus(int? id, int statusId)
		{
			var db = new AppDbContext();

			var order = db.Orders.FirstOrDefault(o => o.Id == id);
			if(order.StatusId != statusId)
			{
				order.StatusId = statusId;
				db.SaveChanges();
			}
		}
		public List<OrderVm> GetOrder()
		{
			var db = new AppDbContext();

			var order = db.Orders.AsNoTracking().Include(o => o.Member)
								.Include(o => o.District)
								.Include(o => o.Paytype)
								.Include(o => o.Status)
								.AsEnumerable()
								.Select(o => new OrderVm
								{
									Id = o.Id,
									MemberAccount = o.Member.Account,
									OrderTime = o.OrderTime,
									Paytype = o.Paytype.Paytype1,
									//PaytypeId = o.PaytypeId,
									Status = o.Status.Status1,
									//StatusId = o.StatusId,
									City = o.District.City.Name,
									District = o.District.District1,
									Address = o.Address,
									Receiver = o.Receiver,
									TelePhone = o.TelePhone,
									Email = o.Email,
									OrderItems = o.OrderItems.ToList().Select(oi => new OrderItemVm
									{
										Id = oi.Id,
										OrderId = oi.OrderId,
										Qty = oi.Qty,
										ProductName = oi.ProductName,
										ProductPrice = oi.ProductPrice,
									}).ToList()
								}).ToList();
			return order;
		}
		public List<OrderVm> GetSearchResult(OrderSearchCriteria criteria)
		{
			int? statusId = criteria.StatusId;
			int? paytypeId = criteria.PaytypeId;

			List<OrderVm> ordervms = new List<OrderVm>();

			string sql = @"SELECTo.Id,o.OrderTime,o.Receiver,
o.TelePhone,o.Email,m.Account,
p.Paytype,s.Status,d.District,
c.Name,oi.ProductName,oi.ProductPrice,
oi.Qty,oi.Qty * oi.ProductPrice AS Subtotal
FROM Orders AS o
INNER JOIN Members AS m ON m.Id = o.MemberId
INNER JOIN Paytypes AS p ON p.Id = o.PaytypeId
INNER JOIN Status AS s ON s.Id = o.StatusId
INNER JOIN Districts AS d ON d.Id = o.DistrictsId
INNER JOIN Cities AS c ON d.CityId = c.Id
INNER JOIN OrderItems AS oi ON oi.OrderId = o.Id
WHERE
(o.PaytypeId = @PaytypeId OR @PaytypeId IS NULL)
AND (o.StatusId = @StatusId OR @StatusId IS NULL);";

			using (var conn = new SqlDb().GetConnection("AppDbContext"))
			{
				var result = conn.Query<Order, OrderItem, Models.EFModels.Member, Paytype, Status, District, City, Order>(
					sql,
					(o, oi, m, p, s, d, c) =>
					{
						o.Member = m;
						o.Paytype = p;
						o.Status = s;
						o.District = d;
						o.District.City = c;
						o.OrderItems.Add(oi);
						return o;
					}).ToList();

				
				ordervms = result.Select(order => new OrderVm
				{
					Id = order.Id,
					MemberAccount = order.Member.Account,  
					OrderTime = order.OrderTime,
					Paytype = order.Paytype.Paytype1,
					//PaytypeId = order.PaytypeId,
					Status = order.Status.Status1,
					//StatusId = order.StatusId,
					City = order.District.City.Name, 
					District = order.District.District1,
					Address = order.Address, 
					Receiver = order.Receiver,
					TelePhone = order.TelePhone,
					Email = order.Email,
					OrderItems = order.OrderItems.Select(oi => new OrderItemVm
					{
						Id = oi.Id,
						OrderId = oi.OrderId,
						Qty = oi.Qty,
						ProductName = oi.ProductName,
						ProductPrice = oi.ProductPrice
					}).ToList(),
				}).ToList();
			}

			return ordervms;
		}
	}
}
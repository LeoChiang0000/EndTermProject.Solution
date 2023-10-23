using EndTermProjectBack.Models.DTOs;
using EndTermProjectBack.Models.EFModels;
using EndTermProjectBack.Repositories;
using EndTermProjectBack.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EndTermProjectBack.Models.Services
{
	public class OrderService
	{
		public List<OrderDTO> Search(OrderSearchCriteria criteria)
		{
			if (criteria.StartDate.HasValue && criteria.EndDate.HasValue)
			{
				if (criteria.StartDate < criteria.EndDate)
				{
					criteria.EndDate = criteria.EndDate.Value.Date.AddHours(23).AddMinutes(59).AddSeconds(59);
				}
				else if (criteria.StartDate > criteria.EndDate)
				{
					DateTime? temp = criteria.StartDate;
					criteria.StartDate = criteria.EndDate;
					criteria.EndDate = temp;

					criteria.EndDate = criteria.EndDate.Value.Date.AddHours(23).AddMinutes(59).AddSeconds(59);
				}
				else if (criteria.StartDate == criteria.EndDate)
				{
					criteria.EndDate = criteria.EndDate.Value.AddHours(23).AddMinutes(59).AddSeconds(59);
				}
			}
			else if (criteria.StartDate.HasValue)
			{
				criteria.EndDate = criteria.StartDate.Value.Date.AddHours(23).AddMinutes(59).AddSeconds(59);
			}
			else if (criteria.EndDate.HasValue)
			{
				criteria.StartDate = criteria.EndDate.Value.Date;
				criteria.EndDate = criteria.EndDate.Value.Date.AddHours(23).AddMinutes(59).AddSeconds(59);
			}

			var repo = new OrderRepository();
			var orders = repo.Search(criteria);

			return orders;
		}
	}
}
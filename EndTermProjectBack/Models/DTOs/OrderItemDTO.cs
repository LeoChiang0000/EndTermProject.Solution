using EndTermProjectBack.Models.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EndTermProjectBack.Models.DTOs
{
	public class OrderItemDTO
	{
		public int Id { get; set; }

		public int OrderId { get; set; }

		public int Qty { get; set; }

		[Required]
		[StringLength(50)]
		public string ProductName { get; set; }

		public int ProductPrice { get; set; }
	}
}
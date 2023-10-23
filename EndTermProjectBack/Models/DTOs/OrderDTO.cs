using EndTermProjectBack.Models.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EndTermProjectBack.Models.DTOs
{
	public class OrderDTO
	{
		public int Id { get; set; }

		public DateTime OrderTime { get; set; }

		[Required]
		[StringLength(200)]
		public string Address { get; set; }

		[StringLength(50)]
		public string Receiver { get; set; }

		[StringLength(50)]
		public string TelePhone { get; set; }

		[StringLength(50)]
		public string Email { get; set; }

		public string District { get; set; }
        public string City { get; set; }

        public  string MemberAccount { get; set; }
		public  List<OrderItemDTO> OrderItems { get; set; }

		public  string Paytype { get; set; }

		public string Status { get; set; }
	}
}
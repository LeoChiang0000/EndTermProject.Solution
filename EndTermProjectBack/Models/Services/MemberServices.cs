using EndTermProjectBack.Models.DTO;
using EndTermProjectBack.Models.EFModels;
using EndTermProjectBack.Models.ViewModels;
using EndTermProjectBack.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EndTermProjectBack.Models.Services
{
	public class MemberServices
	{
		public IEnumerable<MemberDTO> MemberSearch(string account, string name, string email, string telephone, string gender, string enabled, string isConfirmed)
		{
			var members = new MemberRepository().GetMember();

			if (!string.IsNullOrEmpty(account))
			{
				members = members.Where(m => m.Account.Contains(account));
			}

			if (!string.IsNullOrEmpty(name))
			{
				members = members.Where(m => m.Name.Contains(name));
			}

			if (!string.IsNullOrEmpty(email))
			{
				members = members.Where(m => m.Email.Contains(email));
			}

			if (!string.IsNullOrEmpty(telephone))
			{
				members = members.Where(m => m.Telephone.Contains(telephone));
			}

			if (!string.IsNullOrEmpty(gender))
			{
				bool.TryParse(gender, out bool genderData);
				members = members.Where(m => m.Gender == genderData);
			}

			if (!string.IsNullOrEmpty(enabled))
			{
				bool.TryParse(enabled, out bool enabledData);
				members = members.Where(m => m.Enabled == enabledData);
			}

			if (!string.IsNullOrEmpty(isConfirmed))
			{
				bool.TryParse(isConfirmed, out bool isConfirmedData);
				members = members.Where(m => m.Enabled == isConfirmedData);
			}

			var memberDTOs = members.Select(m=>new MemberDTO
			{
				Id = m.Id,
				Name = m.Name,
				Email = m.Email,
				Telephone = m.Telephone,
				Gender = m.Gender,
				Enabled = m.Enabled,
				DateofBirth = m.DateofBirth,
				IsConfirmed = m.IsConfirmed,
				Account = m.Account,

				
			}).ToList();
			
			return memberDTOs;

		}
	}
}
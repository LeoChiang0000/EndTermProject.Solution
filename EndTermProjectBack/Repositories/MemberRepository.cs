using EndTermProjectBack.Models.EFModels;
using EndTermProjectBack.Models.ViewModels;
using EndTermProjectBack.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EndTermProjectBack.Repositories
{
	public class MemberRepository
	{
		public IEnumerable<Member> GetMember()
		{
			var db = new AppDbContext();

			return db.Members.ToList();
		}


		public EditProfileVm EditProfile(int id)
		{
			var db = new AppDbContext();

			var member = db.Members.FirstOrDefault(m => m.Id == id);
			if (member == null)
			{
				throw new Exception("帳號不存在");
			}

			var vm = member.ToEditProfileVm();

			return vm;

		}

		public void UpdateProfile(EditProfileVm vm)
		{
			var db = new AppDbContext();
			var memberInDb = db.Members.FirstOrDefault(p => p.Id == vm.Id);

			memberInDb.Account = vm.Account;
			memberInDb.Name = vm.Name;
			memberInDb.Email = vm.Email;
			memberInDb.Telephone = vm.Telephone;
			memberInDb.DateofBirth = vm.DateofBirth;
			memberInDb.Enabled = vm.Enabled;
			memberInDb.IsConfirmed = vm.IsConfirmed;

			db.SaveChanges();
		}
	}
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using EndTermProjectBack.Models.EFModels;
using EndTermProjectBack.Repositories;
using PagedList.Mvc;
using PagedList;
using EndTermProjectBack.Models.ViewModels;
using EndTermProjectBack.Models.Services;

namespace EndTermProjectBack.Controllers
{
	public class MembersController : Controller
	{
		private AppDbContext db = new AppDbContext();

		// GET: Members
		public ActionResult MemberIndex(string account, string name, string email, string telephone, string gender, string enabled, string isConfirmed, int page = 1)
		{
			int currentPage = page < 1 ? 1 : page;
			int pageSize = 5;


			var members = new MemberServices().MemberSearch(account, name, email, telephone, gender, enabled, isConfirmed);
			
			var result = members.ToPagedList(currentPage, pageSize);

			return View(result);
		}

		public ActionResult EditMember(int id)
		{
			var db = new MemberRepository();
			var member = db.EditProfile(id);
			

			return View(member);
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult EditMember(EditProfileVm vm)
		{
			var repo = new MemberRepository();

			repo.UpdateProfile(vm);
			

				return RedirectToAction("MemberIndex");
		}



		protected override void Dispose(bool disposing)
		{
			if (disposing)
			{
				db.Dispose();
			}
			base.Dispose(disposing);
		}
	}
}

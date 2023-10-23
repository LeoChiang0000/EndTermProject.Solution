using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using EndTermProjectBack.Models;
using EndTermProjectBack.Models.DTOs;
using EndTermProjectBack.Models.EFModels;
using EndTermProjectBack.Models.Services;
using EndTermProjectBack.Models.ViewModels;
using EndTermProjectBack.Models.VMModels;
using EndTermProjectBack.Repositories;
using EndTermProjectBack.Utilities;
using PagedList;

namespace EndTermProjectBack.Controllers
{
    public class OrdersController : Controller
    {
        private AppDbContext db = new AppDbContext();

        // GET: Orders
        public ActionResult Index(OrderSearchCriteria criteria, int page = 1)
        {
			var service = new OrderService();
            List<OrderDTO> orders = service.Search(criteria/*, paginationCriteria*/);
            List<OrderVm> vms = orders.Select(o => o.ToOrderVm()).ToList();

            List<OrderVm> vms2 = new OrderService()
                .Search(criteria)
                .Select(o=> o.ToOrderVm())
                .ToList();

			ViewBag.Paytype = new SelectList(db.Paytypes, "Id", "Paytype1");
            ViewBag.Status = new SelectList(db.Status, "Id", "Status1");

			int currentPage = page < 1 ? 1 : page;
			int pageSize = 5;

			var result = vms.ToPagedList(currentPage, pageSize);

			return View(result);
        }
		

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }

			ViewBag.StatusId = new SelectList(db.Status, "Id", "Status1", order.Status.Id);

			var result = new OrderStatusVm
            {
               Id = order.Id,
               Receiver = order.Receiver,
               Telephone = order.TelePhone,
               Email = order.Email,
               Address= order.District.City.Name + order.District.District1 +order.Address,
               OrderTime = order.OrderTime,
               Paytype = order.Paytype.Paytype1,
               Status = order.Status.Status1,
            };
			

			return View(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int? id, int statusId)
        {
			if (!ModelState.IsValid)
			{
				return View();
			}
			if (id == null)
            {
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
            var repo = new OrderRepository();
            repo.UpdateStatus(id, statusId);

			return RedirectToAction("Index");
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

using BookStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BookStore.Controllers
{
    public class SearchController : Controller
    {
        dbSinhVienDataContext data = new dbSinhVienDataContext();
        // GET: Search
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ResultSearch(FormCollection f)
        {
            string sTuKhoa = f["txtTimKiem"].ToString();
            List<SinhVien> lstKQTK = data.SinhViens.Where(n => n.HoTen.Contains(sTuKhoa) || n.Email.Contains(sTuKhoa) || n.Diachisv.Contains(sTuKhoa) ).ToList();
            //List<SinhVien> lstKQTK2 = data.SinhViens.Where(n => n.Email.Contains(sTuKhoa)).ToList();
            //List<SinhVien> lstKQTK3 = data.SinhViens.Where(n => n.Diachisv.Contains(sTuKhoa)).ToList();
            if (lstKQTK.Count == 0 )
            {
                ViewBag.ThongBao = "Khong co ket qua tim kiem";
                return RedirectToAction("Index", "Admin");
            }
            return View(lstKQTK.OrderBy(n => n.HoTen));
        }
    }
}
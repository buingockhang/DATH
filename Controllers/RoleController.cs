using BookStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace BookStore.Controllers
{
    public class RoleController : Controller
    {


        dbSinhVienDataContext db = new dbSinhVienDataContext();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            string TaiKhoan = f["txtTaikhoan"].ToString();
            string MatKhau = f["txtMatkhau"].ToString();
            ThanhVien tv = db.ThanhViens.SingleOrDefault(n => n.TaiKhoan == TaiKhoan && n.MatKhau == MatKhau);
            if (tv != null)
            {
                var lstQuyen = db.MaLoaiTV_Quyens.Where(n => n.ID_MaLoai == tv.ID_MaLoai);
                string Quyen = "";
                foreach (var item in lstQuyen)
                {
                    Quyen += item.Quyen.MaQuyen + ",";

                }
                Quyen = Quyen.Substring(0, Quyen.Length - 1);
                PhanQuyen(tv.TaiKhoan.ToString(), Quyen);
                return RedirectToAction("Index", "Admin");
            }


            return Content("tai khoan hoac mat khau khong dung");
        }

        public void PhanQuyen(string TaiKhoan, string Quyen)
        {
            FormsAuthentication.Initialize();
            var ticket = new FormsAuthenticationTicket(1,
                TaiKhoan,
                DateTime.Now,
                DateTime.Now.AddHours(3),
                false,
                Quyen,
                FormsAuthentication.FormsCookiePath);
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket));
            if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;
            Response.Cookies.Add(cookie);
        }

        public ActionResult DangXuat()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }

    }
}
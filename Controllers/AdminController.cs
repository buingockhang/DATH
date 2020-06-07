using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BookStore.Model;
using System.IO;

namespace BookStore.Controllers
{
    
    public class AdminController : Controller
    {
        // GET: Admin

        // GET: Admin
        dbSinhVienDataContext data = new dbSinhVienDataContext();
        public ActionResult Index()
        {
            return View();

        }
        [HttpGet]
        public ActionResult SinhVien()
        {
            return View(data.SinhViens.ToList());
        }

        [HttpGet]

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            var tendn = f["username"];
            var matkhau = f["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phai nhap ten dang nhap";

            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phai nhap mat khau";
            }
            else
            {
                ADMIN ad = data.ADMINs.SingleOrDefault(n => n.UserAdmin == tendn && n.PassAdmin == matkhau);
                if (ad != null)
                {
                    Session["Taikhoanadmin"] = ad;
                    return RedirectToAction("Index", "Admin");
                }
                else
                    ViewBag.Thongbao = "Tai khoan khong ton tai";
            }
            return View();
        }

        [HttpGet]
        public ActionResult Themmoisv()
        {
            return View();
        }
        [HttpPost]

        [ValidateInput(false)]
        public ActionResult Themmoisv(SinhVien sv)
        {
            data.SinhViens.InsertOnSubmit(sv);
            try
            {
                data.SubmitChanges();
            }
            catch
            {
                ViewBag.Error = "Không thể thêm sinh viên do trùng mã";
                return View();
            }
            return RedirectToAction("SinhVien");
        }

        [HttpGet]
        public ActionResult Xoasv(string id)
        {

            SinhVien sv = data.SinhViens.SingleOrDefault(n => id.Equals(n.Masv));

            if (sv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.Masv = sv.Masv;
            return View(sv);
        }
        [HttpPost, ActionName("Xoasv")]
        public ActionResult xacnhanxoasv(string id)
        {

            SinhVien sv = data.SinhViens.SingleOrDefault(n => id.Equals(n.Masv));

            if (sv == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            ViewBag.Masv = sv.Masv;
            data.SinhViens.DeleteOnSubmit(sv);
            data.SubmitChanges();

            return View(sv);

        }
        [HttpGet]
        public ActionResult Suasv(int id)
        {
            SinhVien sv = data.SinhViens.SingleOrDefault(n => id.Equals(n.Masv));

            if (sv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.Masv = new SelectList(data.SinhViens.ToList().OrderBy(n => n.HoTen), "Masv", "HoTen");

            return View(sv);
        }
        public SinhVien getId(string id)
        {
            return data.SinhViens.Where(x => x.Masv == id).FirstOrDefault();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suasv(SinhVien sv)
        {
            ViewBag.Masv = new SelectList(data.SinhViens.ToList().OrderBy(n => n.Masv), "Masv", "HoTen");
            //SinhVien temp = sv.Masv;
            SinhVien temp = getId(sv.Masv);
            if (ModelState.IsValid)
            {
                temp.HoTen = sv.HoTen;
                temp.Email = sv.Email;
                temp.Masv = sv.Masv;
                temp.Matkhau = sv.Matkhau;
                temp.Diachisv = sv.Diachisv;
                temp.Dienthoaisv = sv.Dienthoaisv;
                temp.Ngaysinh = sv.Ngaysinh;
                //Luu vao CSDL  
                data.SubmitChanges();
                UpdateModel(sv);


            }
            return RedirectToAction("SinhVien");
        }
        [HttpGet]
        public ActionResult Khoa()
        {
            return View(data.Khoas.ToList());
        }
        [HttpGet]
        public ActionResult Themmoikhoa()
        {
            ViewBag.MaKhoa = new SelectList(data.Khoas.ToList().OrderBy(n => n.TenKhoa), "MaKhoa", "TenKhoa");
            return View();

        }
        [HttpPost]
        public ActionResult Themmoikhoa(Khoa l)
        {
            data.Khoas.InsertOnSubmit(l);
            data.SubmitChanges();
            return RedirectToAction("Khoa");
        }
        [HttpGet]
        public ActionResult Suakhoa(string id)
        {
            //Lay ra doi tuong sach theo ma
            Khoa l = data.Khoas.SingleOrDefault(n => n.MaKhoa == id);

            if (l == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.Maloai = l.MaKhoa;
            return View(l);
        }
        public Khoa getIdkhoa(string id)
        {
            return data.Khoas.Where(x => x.MaKhoa == id).FirstOrDefault();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suakhoa(Khoa l)
        {
            ViewBag.Masv = new SelectList(data.SinhViens.ToList().OrderBy(n => n.HoTen), "Masv", "HoTen");
            Khoa temp = getIdkhoa(l.MaKhoa);
            if (ModelState.IsValid)
            {
                temp.TenKhoa = l.TenKhoa;
                //Luu vao CSDL   
                UpdateModel(l);
                data.SubmitChanges();

            }
            return RedirectToAction("Khoa");

        }
        [HttpGet]
        public ActionResult Lop()
        {
            return View(data.Lops.ToList());
        }
        [HttpGet]
        public ActionResult ThemLop()
        {
            ViewBag.DSKhoa = data.Khoas.ToList();
            return View();
        }
        [HttpPost]

        [ValidateInput(false)]
        public ActionResult ThemLop(Lop l)
        {

            data.Lops.InsertOnSubmit(l);
            data.SubmitChanges();
            return RedirectToAction("Lop");
        }
        [HttpGet]
        public ActionResult SuaLop(string id)
        {
            //Lay ra doi tuong sach theo ma
            Lop l = data.Lops.SingleOrDefault(n => n.MaLop.Equals(id));

            if (l == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaLop = l.MaLop;
            return View(l);
        }
        public Lop getIdLop(string id)
        {
            return data.Lops.Where(x => x.MaLop == id).FirstOrDefault();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SuaLop(string id, Lop l)
        {
            ViewBag.Masv = new SelectList(data.SinhViens.ToList().OrderBy(n => n.HoTen), "Masv", "HoTen");
            Lop temp = getIdLop(id);
            if (ModelState.IsValid)
            {
                temp.TenLop = l.TenLop;
                temp.MaLop = l.MaLop;
                //Luu vao CSDL   
                UpdateModel(temp);
                data.SubmitChanges();

            }
            return RedirectToAction("Lop");

        }
       

    }
}
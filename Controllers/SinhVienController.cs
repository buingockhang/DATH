using BookStore.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BookStore.Controllers
{
    public class SinhVienController : Controller
    {
        dbSinhVienDataContext data = new dbSinhVienDataContext();
        // GET: SinhVien

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

       [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            var tendn = f["txtTaikhoan"];
            var matkhau = f["txtMatkhau"];
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
                SinhVien sv = data.SinhViens.SingleOrDefault(n => n.Masv == tendn && n.Matkhau == matkhau);         
                Lop l = data.Lops.SingleOrDefault(n => n.MaLop == sv.MaLop);
                var makhoa = l.MaKhoa;
                Khoa kh = data.Khoas.SingleOrDefault(n => n.MaKhoa == makhoa);

                if (sv != null)
                {
                    Session["Taikhoanadmin"] = sv;
                    Session["UserName"] = sv.HoTen.ToString();
                    Session["MSSV"] = sv.Masv.ToString();
                    Session["Email"] = sv.Email.ToString();
                    Session["MaLop"] = sv.MaLop.ToString();
                    Session["DienThoai"] = sv.Dienthoaisv.ToString();
                    Session["Khoa"] = kh.TenKhoa.ToString();
                    return RedirectToAction("Index", "Home");
                }
                else
                    ViewBag.Thongbao = "Tai khoan khong ton tai";
            }
            return View();
        }


        [HttpGet]
        public ActionResult Suasv(string id)
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
            ViewBag.Masv = new SelectList(data.SinhViens.ToList().OrderBy(n => n.HoTen), "Masv", "HoTen");
            //SinhVien temp = sv.Masv;
            SinhVien temp = getId(sv.Masv);
            if (ModelState.IsValid)
            {
                temp.HoTen = sv.HoTen;
                //Luu vao CSDL  
                data.SubmitChanges();
                UpdateModel(sv);
            }
            return RedirectToAction("Index","Home");
        }

        [HttpGet]
        public ActionResult PhongTrao()
        {
            return View(data.PhongTraos.ToList());
        }

        [HttpPost]
        public ActionResult PhongTrao(PhongTrao pt,HttpPostedFileBase fileUpload)
        {
            if(fileUpload == null)
            {
                ViewBag.ThongBao = "Chon Hinh Anh";
                return View();
            }
            if (ModelState.IsValid)
            {
                var fileName = Path.GetFileName(fileUpload.FileName);
                var path = Path.Combine(Server.MapPath("~/HA"), fileName);
                if (System.IO.File.Exists(path))
                {
                    ViewBag.ThongBao = "Hinh Anh da ton tai";
                }
                else
                {
                    fileUpload.SaveAs(path);
                }
                pt.IM_PT = fileUpload.FileName;
                pt.TrangThai_PT = true;
                UpdateModel(pt);
                data.SubmitChanges();

            }
            return View();
        }



        [HttpGet]
        public ActionResult ThemmoiPT()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ThemmoiPT(PhongTrao pt,HttpPostedFileBase fileUpload)
        {
            if (fileUpload == null)
            {
                ViewBag.ThongBao = "Chon Hinh Anh";
                return View();
            }
            if (ModelState.IsValid)
            {
                var fileName = Path.GetFileName(fileUpload.FileName);
                var path = Path.Combine(Server.MapPath("~/HA"), fileName);
                if (System.IO.File.Exists(path))
                {
                    ViewBag.ThongBao = "Hinh Anh da ton tai";
                }
                else
                {
                    fileUpload.SaveAs(path);
                }
                pt.IM_PT = fileUpload.FileName;
                data.PhongTraos.InsertOnSubmit(pt);
                data.SubmitChanges();
            }

            return RedirectToAction("SinhVien");
        }
        public ActionResult TaiLieuHT()
        {
            return View();
        }
        public ActionResult GioiThieu()
        {
            return View();
        }
        public ActionResult TrangchuSV()
        {
            return View();
        }
        public ActionResult SVDangKy()
        {
            return View();
        }
    }
}
 
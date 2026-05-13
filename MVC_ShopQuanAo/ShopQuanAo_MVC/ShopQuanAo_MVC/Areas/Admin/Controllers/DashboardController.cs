using ShopQuanAo_MVC.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopQuanAo_MVC.Areas.Admin.Controllers
{
    public class DashboardController : Controller
    {
        ShopQuanAoEntities db = new ShopQuanAoEntities();

        // DANH SÁCH SẢN PHẨM
        public ActionResult Index()
        {
            if (Session["ChucVu"] == null) return RedirectToAction("login", "Home", new { area = "" });

            // Lấy danh sách sản phẩm từ DB
            var products = (from sp in db.SAN_PHAM
                            join dm in db.DANH_MUC on sp.MaDanhMuc equals dm.MaDanhMuc
                            where sp.TrangThai == true
                            select new AdminProductVM
                            {
                                MaSP = sp.MaSP,
                                TenSanPham = sp.TenSanPham,
                                TenDanhMuc = dm.TenDanhMuc,
                                MoTa = sp.MoTa,
                                AnhDaiDien = db.HINH_ANH_SP.Where(h => h.MaSP == sp.MaSP && h.LaAnhChinh == true).Select(h => h.DuongDan).FirstOrDefault(),
                                GiaBan = db.CHI_TIET_SP.Where(ct => ct.MaSP == sp.MaSP).OrderBy(c => c.GiaBan).Select(c => c.GiaBan).FirstOrDefault(),
                                TongTonKho = db.CHI_TIET_SP.Where(ct => ct.MaSP == sp.MaSP).Sum(c => (int?)c.SoLuong) ?? 0
                            }).OrderByDescending(x => x.MaSP).ToList();

            return View("Dashboard", products);
        }

        // THÊM SẢN PHẨM 
        public ActionResult Create()
        {
            if (Session["ChucVu"] == null) return RedirectToAction("login", "Home", new { area = "" });

            ViewBag.MaDanhMuc = new SelectList(db.DANH_MUC, "MaDanhMuc", "TenDanhMuc");

            var model = new AdminProductVM();

            // Tạo danh sách size đầy đủ để view xử lý ẩn hiện
            // Size Quần/Áo
            string[] clothesSizes = { "S", "M", "L", "XL" };
            foreach (var s in clothesSizes)
            {
                model.ChiTietSize.Add(new ProductDetailInput { SizeName = s, IsSelected = false, GiaBan = 0, SoLuong = 10 });
            }

            // Size Giày
            string[] shoeSizes = { "38", "39", "40", "41", "42", "43", "44", "45" };
            foreach (var s in shoeSizes)
            {
                model.ChiTietSize.Add(new ProductDetailInput { SizeName = s, IsSelected = false, GiaBan = 0, SoLuong = 10 });
            }

            return View(model);
        }

        // XỬ LÝ THÊM SẢN PHẨM
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(AdminProductVM model)
        {
            // Kiểm tra các điều kiện bắt buộc
            if (string.IsNullOrEmpty(model.TenSanPham)) ModelState.AddModelError("TenSanPham", "Vui lòng nhập tên sản phẩm.");
            if (model.ImageFile == null || model.ImageFile.ContentLength == 0) ModelState.AddModelError("ImageFile", "Vui lòng chọn ảnh đại diện.");

            // Kiểm tra xem đã chọn ít nhất 1 size chưa
            var selectedSizes = model.ChiTietSize.Where(x => x.IsSelected).ToList();
            if (!selectedSizes.Any())
            {
                ModelState.AddModelError("", "Vui lòng chọn ít nhất một kích thước và nhập giá/số lượng.");
            }
            else
            {
                // Kiểm tra giá và số lượng của các size đã chọn
                foreach (var item in selectedSizes)
                {
                    if (item.GiaBan <= 0) ModelState.AddModelError("", $"Size {item.SizeName}: Giá bán phải lớn hơn 0.");
                    if (item.SoLuong <= 0) ModelState.AddModelError("", $"Size {item.SizeName}: Số lượng phải lớn hơn 0.");
                }
            }

            if (ModelState.IsValid)
            {
                try
                {
                    // Tạo mã sản phẩm
                    string prefix = model.MaDanhMuc;
                    var lastSp = db.SAN_PHAM.Where(x => x.MaDanhMuc == prefix).OrderByDescending(x => x.MaSP).FirstOrDefault();
                    int nextNum = 1;
                    if (lastSp != null)
                    {
                        // Lấy phần số: A12 -> 12
                        string numStr = lastSp.MaSP.Substring(prefix.Length);
                        if (int.TryParse(numStr, out int n)) nextNum = n + 1;
                    }
                    string newMaSP = prefix + nextNum.ToString("D2");

                    // Lưu bảng SAN_PHAM
                    var sp = new SAN_PHAM();
                    sp.MaSP = newMaSP;
                    sp.TenSanPham = model.TenSanPham;
                    sp.MaDanhMuc = model.MaDanhMuc;
                    sp.MoTa = model.MoTa;
                    sp.TrangThai = true;
                    db.SAN_PHAM.Add(sp);

                    // Lưu Ảnh
                    string fileName = Path.GetFileNameWithoutExtension(model.ImageFile.FileName) + "_" + DateTime.Now.Ticks + Path.GetExtension(model.ImageFile.FileName);
                    string savePath = Server.MapPath("~/assets/img/products/");

                    if (!Directory.Exists(savePath)) Directory.CreateDirectory(savePath);
                    model.ImageFile.SaveAs(Path.Combine(savePath, fileName));

                    var img = new HINH_ANH_SP();
                    img.MaHinhAnh = newMaSP + "H01";
                    img.MaSP = newMaSP;
                    img.DuongDan = "assets/img/products/" + fileName;
                    img.LaAnhChinh = true;
                    img.TrangThai = true;
                    db.HINH_ANH_SP.Add(img);

                    // Lưu chi tiết & Kích thước
                    foreach (var item in selectedSizes)
                    {
                        // Tạo Mã Kích Thước
                        string maKichThuoc = newMaSP + "Sz" + item.SizeName;

                        // Tạo Mã Chi Tiết Sản Phẩm
                        string maCTSP = "CT" + maKichThuoc;

                        // Kiểm tra bảng KICH_THUOC 
                        var checkSize = db.KICH_THUOC.Find(maKichThuoc);
                        if (checkSize == null)
                        {
                            var kt = new KICH_THUOC();
                            kt.MaKichThuoc = maKichThuoc;
                            kt.TenKichThuoc = item.SizeName;
                            kt.TrangThai = true;
                            db.KICH_THUOC.Add(kt);
                        }

                        // Lưu bảng CHI_TIET_SP
                        var ct = new CHI_TIET_SP();
                        ct.MaCTSP = maCTSP;
                        ct.MaSP = newMaSP;
                        ct.MaKichThuoc = maKichThuoc;
                        ct.GiaBan = item.GiaBan;
                        ct.SoLuong = item.SoLuong;
                        ct.TrangThai = true;
                        db.CHI_TIET_SP.Add(ct);
                    }

                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Lỗi khi lưu dữ liệu: " + ex.Message);
                }
            }

            ViewBag.MaDanhMuc = new SelectList(db.DANH_MUC, "MaDanhMuc", "TenDanhMuc", model.MaDanhMuc);
            return View(model);
        }

        // XÓA SẢN PHẨM
        public ActionResult Delete(string id)
        {
            if (Session["ChucVu"] == null) return RedirectToAction("login", "Home", new { area = "" });

            var sp = db.SAN_PHAM.Find(id);
            if (sp != null)
            {
                // Xóa mềm (đổi trạng thái) để giữ lịch sử đơn hàng
                sp.TrangThai = false;
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        // DANH SÁCH ĐƠN HÀNG
        public ActionResult Orders()
        {
            if (Session["ChucVu"] == null) return RedirectToAction("login", "Home", new { area = "" });

            var orders = db.DON_HANG.OrderByDescending(d => d.NgayDat)
                            .Select(d => new AdminOrderVM
                            {
                                MaDonHang = d.MaDonHang,
                                TenKhachHang = d.TenNguoiNhan,
                                NgayDat = d.NgayDat,
                                TongTien = (d.TongTien ?? 0) + (d.PhiVanChuyen ?? 0) - (d.GiamGia ?? 0),
                                DaThanhToan = d.DaThanhToan ?? false,
                                TrangThaiDonHang = d.TrangThaiDonHang
                            }).ToList();

            return View(orders);
        }

        // CẬP NHẬT ĐƠN HÀNG
        [HttpPost]
        public ActionResult UpdateOrder(string id, bool daThanhToan, string trangThai)
        {
            try
            {
                var dh = db.DON_HANG.Find(id);
                if (dh != null)
                {
                    dh.DaThanhToan = daThanhToan;
                    dh.TrangThaiDonHang = trangThai;
                    if (trangThai == "Hoàn tất") dh.DaThanhToan = true;
                    db.SaveChanges();
                    TempData["Message"] = $"Cập nhật đơn {id} thành công!";
                }
            }
            catch (Exception ex)
            {
                TempData["Error"] = "Lỗi: " + ex.Message;
            }

            return RedirectToAction("Orders");
        }

        [HttpGet]
        public JsonResult GetRevenueStats()
        {
            // Chỉ tính doanh thu của đơn "Hoàn tất"
            var doneOrders = db.DON_HANG.Where(d => d.TrangThaiDonHang == "Hoàn tất").ToList();
            var processingOrders = db.DON_HANG.Where(d => d.TrangThaiDonHang == "Chờ xác nhận" || d.TrangThaiDonHang == "Đang giao").Count();
            var totalOrders = db.DON_HANG.Count();

            var stats = new RevenueStats
            {
                TongDoanhThu = doneOrders.Sum(d => d.TongTien ?? 0),
                DonHoanThanh = doneOrders.Count,
                DonDangXuLy = processingOrders,
                TyLeHoanThanh = totalOrders > 0 ? Math.Round((double)doneOrders.Count / totalOrders * 100, 1) : 0
            };

            return Json(stats, JsonRequestBehavior.AllowGet);
        }

        // TRANG THỐNG KÊ DOANH THU
        public ActionResult Revenue()
        {
            if (Session["ChucVu"] == null) return RedirectToAction("login", "Home", new { area = "" });

            // Lấy tất cả đơn hàng
            var allOrders = db.DON_HANG.ToList();

            // Phân loại
            var doneOrders = allOrders.Where(d => d.TrangThaiDonHang == "Hoàn tất").ToList();
            var processingCount = allOrders.Count(d => d.TrangThaiDonHang == "Chờ xác nhận" || d.TrangThaiDonHang == "Đang giao");
            var cancelCount = allOrders.Count(d => d.TrangThaiDonHang == "Hủy");
            var totalCount = allOrders.Count;

            // Tính toán tổng tiền thực thu (Chỉ tính trên đơn hoàn tất)
            decimal totalRevenue = doneOrders.Sum(d => (d.TongTien ?? 0) + (d.PhiVanChuyen ?? 0) - (d.GiamGia ?? 0));

            // Tạo ViewModel
            var model = new RevenueReportVM
            {
                TongDoanhThu = totalRevenue,
                DonHoanThanh = doneOrders.Count,
                DonDangXuLy = processingCount,
                DonHuy = cancelCount,
                TyLeHoanThanh = totalCount > 0 ? Math.Round((double)doneOrders.Count / totalCount * 100, 1) : 0,

                // Liệt kê chi tiết các đơn đã hoàn thành để Admin đối soát
                DSDonHoanThanh = doneOrders.OrderByDescending(d => d.NgayDat)
                                    .Select(d => new AdminOrderVM
                                    {
                                        MaDonHang = d.MaDonHang,
                                        TenKhachHang = d.TenNguoiNhan,
                                        NgayDat = d.NgayDat,
                                        TongTien = (d.TongTien ?? 0) + (d.PhiVanChuyen ?? 0) - (d.GiamGia ?? 0),
                                        DaThanhToan = d.DaThanhToan ?? false
                                    }).ToList()
            };

            return View(model);
        }
    }
}

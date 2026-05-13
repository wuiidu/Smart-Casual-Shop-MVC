using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopQuanAo_MVC.Models;
using System.Text.RegularExpressions;

namespace ShopQuanAo_MVC.Controllers
{
    public class HomeController : Controller
    {
        ShopQuanAoEntities db = new ShopQuanAoEntities();

        // TRANG CHỦ
        public ActionResult Index(int? page, string searchName, string category, string priceRange, string sortType)
        {
            int pageSize = 16;
            int pageNumber = (page ?? 1);
            var query = db.SAN_PHAM.Where(sp => sp.TrangThai == true);

            // Lọc theo tên
            if (!string.IsNullOrEmpty(searchName))
            {
                query = query.Where(sp => sp.TenSanPham.Contains(searchName));
            }
            // Lọc theo danh mục
            if (!string.IsNullOrEmpty(category))
            {
                string dbCategory = "";
                switch (category)
                {
                    case "Áo": dbCategory = "A"; break;
                    case "Quần": dbCategory = "Q"; break;
                    case "Giày": dbCategory = "G"; break;
                }
                if (!string.IsNullOrEmpty(dbCategory))
                {
                    query = query.Where(sp => sp.MaDanhMuc == dbCategory);
                }
            }
            // Lọc theo khoảng giá 
            if (!string.IsNullOrEmpty(priceRange))
            {
                string[] prices = priceRange.Split('-');
                if (prices.Length == 2)
                {
                    decimal minPrice = decimal.Parse(prices[0]);
                    decimal maxPrice = decimal.Parse(prices[1]);
                    query = query.Where(sp => db.CHI_TIET_SP.Any(ct => ct.MaSP == sp.MaSP && ct.GiaBan >= minPrice && ct.GiaBan <= maxPrice));
                }
            }

            // Mặc định sắp xếp theo danh mục như cũ nếu không chọn gì
            if (string.IsNullOrEmpty(sortType) || sortType == "default")
            {
                query = query.OrderBy(sp =>
                    sp.MaDanhMuc == "A" ? 1 :
                    sp.MaDanhMuc == "Q" ? 2 :
                    sp.MaDanhMuc == "G" ? 3 : 4
                ).ThenBy(sp => sp.MaSP);
            }
            else
            {
                switch (sortType)
                {
                    case "asc":
                        query = query.OrderBy(sp => db.CHI_TIET_SP.Where(ct => ct.MaSP == sp.MaSP).Min(ct => ct.GiaBan));
                        break;
                    case "desc":
                        query = query.OrderByDescending(sp => db.CHI_TIET_SP.Where(ct => ct.MaSP == sp.MaSP).Min(ct => ct.GiaBan));
                        break;
                    case "rating":
                        query = query.OrderByDescending(sp => db.DANH_GIA.Where(d => d.MaSP == sp.MaSP && d.TrangThai == true).Average(d => (double?)d.SoSao) ?? 0);
                        break;
                }
            }
            ViewBag.SearchName = searchName;
            ViewBag.Category = category;
            ViewBag.PriceRange = priceRange;
            ViewBag.SortType = sortType;

            // Tính toán phân trang
            int totalProducts = query.Count();
            int totalPages = (int)Math.Ceiling((double)totalProducts / pageSize);

            // Select ra ProductVM và Phân trang 
            var listProducts = query
                                .Skip((pageNumber - 1) * pageSize)
                                .Take(pageSize)
                                .Select(sp => new ProductVM
                                {
                                    MaSP = sp.MaSP,
                                    TenSanPham = sp.TenSanPham,
                                    MoTa = sp.MoTa,
                                    AnhDaiDien = db.HINH_ANH_SP.Where(h => h.MaSP == sp.MaSP && h.LaAnhChinh == true).Select(h => h.DuongDan).FirstOrDefault(),
                                    GiaBan = db.CHI_TIET_SP.Where(ct => ct.MaSP == sp.MaSP).OrderBy(ct => ct.GiaBan).Select(ct => ct.GiaBan).FirstOrDefault(),
                                    SoLuongDanhGia = db.DANH_GIA.Count(d => d.MaSP == sp.MaSP && d.TrangThai == true),
                                    DiemDanhGia = db.DANH_GIA.Where(d => d.MaSP == sp.MaSP && d.TrangThai == true)
                                                             .Select(d => (double?)d.SoSao).Average() ?? 0
                                }).ToList();
            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = pageNumber;
            ViewBag.BannerImages = new List<string> { "/assets/img/banner/Banner-1.jpg", "/assets/img/banner/Banner-2.jpg", "/assets/img/banner/Banner-3.jpg" };

            // TRANG PHỤC THỊNH HÀNH
            var fixedIds = new List<string> { "A06", "G09", "Q09", "G06" };
            // Lấy dữ liệu từ DB (Lúc này thứ tự chưa đúng, nó đang xếp theo Database)
            var rawTrending = (from sp in db.SAN_PHAM
                               where fixedIds.Contains(sp.MaSP) && sp.TrangThai == true
                               select new ProductVM
                               {
                                   MaSP = sp.MaSP,
                                   TenSanPham = sp.TenSanPham,
                                   AnhDaiDien = db.HINH_ANH_SP.Where(h => h.MaSP == sp.MaSP && h.LaAnhChinh == true).Select(h => h.DuongDan).FirstOrDefault(),
                                   GiaBan = db.CHI_TIET_SP.Where(ct => ct.MaSP == sp.MaSP).OrderBy(ct => ct.GiaBan).Select(ct => ct.GiaBan).FirstOrDefault(),
                                   SoLuongDanhGia = db.DANH_GIA.Count(d => d.MaSP == sp.MaSP && d.TrangThai == true),
                                   DiemDanhGia = db.DANH_GIA.Where(d => d.MaSP == sp.MaSP && d.TrangThai == true).Select(d => (double?)d.SoSao).Average() ?? 0
                               }).ToList();
            // Sắp xếp lại danh sách kết quả dựa theo thứ tự của fixedIds
            var trendingProducts = rawTrending
                                    .OrderBy(p => fixedIds.IndexOf(p.MaSP))
                                    .ToList();
            ViewBag.Trending = trendingProducts;

            return View(listProducts);
        }

        // CHI TIẾT SẢN PHẨM
        public ActionResult product_details(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return RedirectToAction("Index");
            }

            // Lấy thông tin sản phẩm chính
            var product = (from sp in db.SAN_PHAM
                           where sp.MaSP == id
                           select new ProductVM
                           {
                               MaSP = sp.MaSP,
                               TenSanPham = sp.TenSanPham,
                               MoTa = sp.MoTa,
                               GiaBan = db.CHI_TIET_SP.Where(ct => ct.MaSP == sp.MaSP).OrderBy(ct => ct.GiaBan).Select(ct => ct.GiaBan).FirstOrDefault(),
                               AnhDaiDien = db.HINH_ANH_SP.Where(h => h.MaSP == sp.MaSP && h.LaAnhChinh == true).Select(h => h.DuongDan).FirstOrDefault()
                           }).FirstOrDefault();

            if (product == null)
            {
                return HttpNotFound();
            }

            // Lấy danh sách HÌNH ẢNH chi tiết
            var listImages = db.HINH_ANH_SP.Where(h => h.MaSP == id).ToList();
            ViewBag.ListImages = listImages;

            // Lấy danh sách SIZE có sẵn và SẮP XẾP TÙY CHỈNH
            var rawSizes = (from ct in db.CHI_TIET_SP
                            join k in db.KICH_THUOC on ct.MaKichThuoc equals k.MaKichThuoc
                            where ct.MaSP == id && ct.SoLuong > 0
                            select new
                            {
                                MaKichThuoc = k.MaKichThuoc,
                                TenKichThuoc = k.TenKichThuoc
                            }).AsEnumerable();

            var listSizes = rawSizes.OrderBy(x =>
            {
                // Quy ước thứ tự ưu tiên cho Áo/Quần
                switch (x.TenKichThuoc)
                {
                    case "S": return 1;
                    case "M": return 2;
                    case "L": return 3;
                    case "XL": return 4;
                    // Trường hợp Giày chuyển thành số để so sánh
                    default:
                        int val;
                        if (int.TryParse(x.TenKichThuoc, out val)) return val + 10;
                        return 99;
                }
            }).ToList();

            // Tạo SelectList và chọn mặc định phần tử đầu tiên (Size nhỏ nhất: S hoặc 38)
            var defaultSize = listSizes.FirstOrDefault()?.MaKichThuoc;
            ViewBag.ListSizes = new SelectList(listSizes, "MaKichThuoc", "TenKichThuoc", defaultSize);

            // Lấy danh sách ĐÁNH GIÁ
            var listComments = db.DANH_GIA.Where(d => d.MaSP == id && d.TrangThai == true).ToList();
            ViewBag.ListComments = listComments;
            double rating = 0;
            if (listComments.Count > 0)
            {
                rating = listComments.Average(x => x.SoSao);
            }
            ViewBag.Rating = Math.Round(rating, 1);
            ViewBag.RatingCount = listComments.Count;

            // Lấy SẢN PHẨM LIÊN QUAN
            var currentCategory = db.SAN_PHAM.Find(id).MaDanhMuc;
            ViewBag.MaDanhMuc = currentCategory;
            var relatedProducts = (from sp in db.SAN_PHAM
                                   where sp.MaDanhMuc == currentCategory && sp.MaSP != id && sp.TrangThai == true
                                   select new ProductVM
                                   {
                                       MaSP = sp.MaSP,
                                       TenSanPham = sp.TenSanPham,
                                       AnhDaiDien = db.HINH_ANH_SP.Where(h => h.MaSP == sp.MaSP && h.LaAnhChinh == true).Select(h => h.DuongDan).FirstOrDefault(),
                                       GiaBan = db.CHI_TIET_SP.Where(ct => ct.MaSP == sp.MaSP).OrderBy(ct => ct.GiaBan).Select(ct => ct.GiaBan).FirstOrDefault(),
                                       SoLuongDanhGia = db.DANH_GIA.Count(d => d.MaSP == sp.MaSP && d.TrangThai == true),
                                       DiemDanhGia = db.DANH_GIA.Where(d => d.MaSP == sp.MaSP && d.TrangThai == true)
                                                                .Select(d => (double?)d.SoSao).Average() ?? 0
                                   })
                       .OrderBy(x => Guid.NewGuid()) // Random
                       .Take(4)
                       .ToList();
            ViewBag.RelatedProducts = relatedProducts;

            return View(product);
        }

        // THÊM VÀO GIỎ HÀNG TỪ TRANG CHI TIẾT SP
        [HttpPost]
        public ActionResult AddToCartFromDetails(string MaSP, string SizeId, int Quantity, string submitType)
        {
            // Kiểm tra dữ liệu đầu vào
            if (string.IsNullOrEmpty(MaSP) || string.IsNullOrEmpty(SizeId) || Quantity < 1)
            {
                return RedirectToAction("product_details", new { id = MaSP });
            }

            // Tìm thông tin sản phẩm và biến thể (chi tiết sản phẩm)
            var product = db.SAN_PHAM.FirstOrDefault(s => s.MaSP == MaSP);

            // Tìm chi tiết sản phẩm dựa trên Mã SP và Mã Kích Thước
            var variant = db.CHI_TIET_SP.FirstOrDefault(x => x.MaSP == MaSP && x.MaKichThuoc == SizeId && x.TrangThai == true);

            if (product != null && variant != null)
            {
                // Lấy tên kích thước để hiển thị
                var sizeName = db.KICH_THUOC.FirstOrDefault(k => k.MaKichThuoc == SizeId)?.TenKichThuoc;

                // Xử lý thêm vào Session Cart
                var cart = GetCart();
                var existingItem = cart.FirstOrDefault(c => c.MaCTSP == variant.MaCTSP);

                if (existingItem != null)
                {
                    existingItem.SoLuong += Quantity;
                }
                else
                {
                    var img = db.HINH_ANH_SP.FirstOrDefault(h => h.MaSP == MaSP && h.LaAnhChinh == true)?.DuongDan;
                    cart.Add(new CartItem
                    {
                        MaSP = product.MaSP,
                        TenSanPham = product.TenSanPham,
                        AnhDaiDien = img,
                        MaCTSP = variant.MaCTSP,
                        TenKichThuoc = sizeName,
                        DonGia = variant.GiaBan,
                        SoLuong = Quantity,
                        IsSelected = false
                    });
                }
                Session["Cart"] = cart;

                // Nếu đã đăng nhập thì lưu vào DB
                if (Session["MaKH"] != null)
                {
                    string maKH = Session["MaKH"].ToString();
                    var ghItem = db.GIO_HANG.FirstOrDefault(x => x.MaKH == maKH && x.MaCTSP == variant.MaCTSP);
                    if (ghItem != null)
                    {
                        ghItem.SoLuong += Quantity;
                    }
                    else
                    {
                        var newGh = new GIO_HANG();
                        newGh.MaKH = maKH;
                        newGh.MaCTSP = variant.MaCTSP;
                        newGh.SoLuong = Quantity;
                        db.GIO_HANG.Add(newGh);
                    }
                    db.SaveChanges();
                }

                // Điều hướng dựa trên nút bấm
                if (submitType == "buy")
                {
                    return RedirectToAction("cart");
                }
                else
                {
                    TempData["SuccessMessage"] = "Đã thêm sản phẩm vào giỏ hàng!";
                    return RedirectToAction("product_details", new { id = MaSP });
                }
            }

            // Nếu lỗi (không tìm thấy SP) -> Quay lại trang chi tiết
            return RedirectToAction("product_details", new { id = MaSP });
        }

        // Giống hàm trên nhưng trả về dữ liệu ngầm thay vì trả về View (tải lại trang)
        [HttpPost]
        public JsonResult AddToCartAJAX(string MaSP, string SizeId, int Quantity)
        {
            // Kiểm tra dữ liệu
            if (string.IsNullOrEmpty(MaSP) || string.IsNullOrEmpty(SizeId) || Quantity < 1)
            {
                return Json(new { success = false, message = "Dữ liệu không hợp lệ." });
            }

            // Tìm thông tin sản phẩm và biến thể
            var product = db.SAN_PHAM.FirstOrDefault(s => s.MaSP == MaSP);
            var variant = db.CHI_TIET_SP.FirstOrDefault(x => x.MaSP == MaSP && x.MaKichThuoc == SizeId && x.TrangThai == true);

            if (product != null && variant != null)
            {
                var sizeName = db.KICH_THUOC.FirstOrDefault(k => k.MaKichThuoc == SizeId)?.TenKichThuoc;

                // Xử lý thêm vào Session Cart
                var cart = GetCart();
                var existingItem = cart.FirstOrDefault(c => c.MaCTSP == variant.MaCTSP);

                if (existingItem != null)
                {
                    existingItem.SoLuong += Quantity;
                }
                else
                {
                    var img = db.HINH_ANH_SP.FirstOrDefault(h => h.MaSP == MaSP && h.LaAnhChinh == true)?.DuongDan;
                    cart.Add(new CartItem
                    {
                        MaSP = product.MaSP,
                        TenSanPham = product.TenSanPham,
                        AnhDaiDien = img,
                        MaCTSP = variant.MaCTSP,
                        TenKichThuoc = sizeName,
                        DonGia = variant.GiaBan,
                        SoLuong = Quantity,
                        IsSelected = false
                    });
                }
                Session["Cart"] = cart;

                // Nếu đã đăng nhập thì lưu vào DB
                if (Session["MaKH"] != null)
                {
                    string maKH = Session["MaKH"].ToString();
                    var ghItem = db.GIO_HANG.FirstOrDefault(x => x.MaKH == maKH && x.MaCTSP == variant.MaCTSP);
                    if (ghItem != null)
                    {
                        ghItem.SoLuong += Quantity;
                    }
                    else
                    {
                        var newGh = new GIO_HANG();
                        newGh.MaKH = maKH;
                        newGh.MaCTSP = variant.MaCTSP;
                        newGh.SoLuong = Quantity;
                        db.GIO_HANG.Add(newGh);
                    }
                    db.SaveChanges();
                }

                // Trả về JSON thành công để JS hiển thị thông báo
                return Json(new { success = true, count = cart.Count, message = "Đã thêm sản phẩm vào giỏ hàng!" });
            }

            return Json(new { success = false, message = "Sản phẩm không tồn tại hoặc hết hàng." });
        }

        // Xử lý thêm đánh giá
        [HttpPost]
        public ActionResult AddReview(string MaSP, string TenKhachHang, int SoSao, string NoiDung)
        {
            // Nếu thiếu thông tin thì load lại trang cũ
            if (string.IsNullOrEmpty(MaSP) || string.IsNullOrEmpty(TenKhachHang) || string.IsNullOrEmpty(NoiDung))
            {
                return RedirectToAction("product_details", new { id = MaSP });
            }

            // Tự động sinh Mã Đánh Giá tiếp theo
            var lastReview = db.DANH_GIA.Where(x => x.MaSP == MaSP)
                                        .OrderByDescending(x => x.MaDanhGia)
                                        .FirstOrDefault();

            // Mặc định là 1 nếu chưa có đánh giá nào
            int nextNumber = 1;
            // Thực hiện tách mã đánh giá lớn nhất hiện tại nếu sp đã có đánh giá để thêm mã đánh giá mới
            if (lastReview != null)
            {
                string numberPart = lastReview.MaDanhGia.Substring(5);
                if (int.TryParse(numberPart, out int currentNumber))
                {
                    nextNumber = currentNumber + 1;
                }
            }

            // Tạo mã mới: MaSP + "DG" + Số thứ tự (định dạng 3 chữ số: 001, 002...)
            string newReviewId = $"{MaSP}DG{nextNumber.ToString("D3")}";

            // Tạo đối tượng và lưu vào DB
            var newReview = new DANH_GIA();
            newReview.MaDanhGia = newReviewId;
            newReview.MaSP = MaSP;
            newReview.MaKH = null;
            newReview.TenKhachHang = TenKhachHang;
            newReview.SoSao = SoSao;
            newReview.NoiDung = NoiDung;
            newReview.TrangThai = true;

            db.DANH_GIA.Add(newReview);
            db.SaveChanges();

            // Quay lại trang chi tiết sản phẩm
            return RedirectToAction("product_details", new { id = MaSP, review = "success" });
        }

        // Lấy session giỏ hàng
        public List<CartItem> GetCart()
        {
            List<CartItem> cart = Session["Cart"] as List<CartItem>;
            if (cart == null)
            {
                cart = new List<CartItem>();
                Session["Cart"] = cart;
            }
            return cart;
        }

        // Thêm vào giỏ hàng 
        [HttpPost]
        public JsonResult AddToCart(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return Json(new { success = false, message = "Sản phẩm không tồn tại." });
            }

            // Tìm sản phẩm và lấy danh sách chi tiết (Size)
            var product = db.SAN_PHAM.FirstOrDefault(s => s.MaSP == id);
            if (product == null) return Json(new { success = false, message = "Sản phẩm không tồn tại." });

            // Lấy tất cả biến thể của sản phẩm này
            var variants = db.CHI_TIET_SP.Where(ct => ct.MaSP == id && ct.TrangThai == true).ToList();

            if (variants.Count == 0)
            {
                return Json(new { success = false, message = "Sản phẩm này đã hết hàng." });
            }

            // Logic tìm Size nhỏ nhất (Sử dụng lại logic sắp xếp của bạn)
            var sortedVariant = variants.Select(v => new
            {
                Variant = v,
                SizeName = db.KICH_THUOC.FirstOrDefault(k => k.MaKichThuoc == v.MaKichThuoc)?.TenKichThuoc
            })
            .OrderBy(x =>
            {
                switch (x.SizeName)
                {
                    case "S": return 1;
                    case "M": return 2;
                    case "L": return 3;
                    case "XL": return 4;
                    default:
                        int val;
                        if (int.TryParse(x.SizeName, out val)) return val + 10;
                        return 99;
                }
            }).FirstOrDefault();

            if (sortedVariant == null) return Json(new { success = false, message = "Lỗi xác định kích thước." });

            var targetVariant = sortedVariant.Variant;
            var sizeName = sortedVariant.SizeName;

            // Thêm vào Session Cart
            var cart = GetCart();
            var existingItem = cart.FirstOrDefault(c => c.MaCTSP == targetVariant.MaCTSP);

            // Nếu sản phẩm đã có trong giỏ hàng rồi thì tăng số lượng, chưa thì tạo mới
            if (existingItem != null)
            {
                existingItem.SoLuong++;
            }
            else
            {
                var img = db.HINH_ANH_SP.FirstOrDefault(h => h.MaSP == id && h.LaAnhChinh == true)?.DuongDan;
                cart.Add(new CartItem
                {
                    MaSP = product.MaSP,
                    TenSanPham = product.TenSanPham,
                    AnhDaiDien = img,
                    MaCTSP = targetVariant.MaCTSP,
                    TenKichThuoc = sizeName,
                    DonGia = targetVariant.GiaBan,
                    SoLuong = 1
                });
            }

            // Lưu lại session
            Session["Cart"] = cart;

            // Nếu đã đăng nhập thì lưu vào DB
            if (Session["MaKH"] != null)
            {
                string maKH = Session["MaKH"].ToString();
                var ghItem = db.GIO_HANG.FirstOrDefault(x => x.MaKH == maKH && x.MaCTSP == targetVariant.MaCTSP);

                if (ghItem != null)
                {
                    ghItem.SoLuong += 1;
                }
                else
                {
                    var newGh = new GIO_HANG();
                    newGh.MaKH = maKH;
                    newGh.MaCTSP = targetVariant.MaCTSP;
                    newGh.SoLuong = 1;
                    db.GIO_HANG.Add(newGh);
                }
                db.SaveChanges();
            }

            // Trả về tổng số lượng để update Header
            return Json(new { success = true, count = cart.Count, message = "Đã thêm sản phẩm vào giỏ hàng!" });
        }

        // Lấy số lượng giỏ hàng hiện tại (Để hiển thị khi load trang lại)
        [HttpGet]
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public JsonResult GetCartCount()
        {
            var cart = GetCart();
            return Json(new { count = cart.Count }, JsonRequestBehavior.AllowGet);
        }

        // Đăng ký
        [HttpGet]
        public ActionResult register()
        {
            return View();
        }

        // Xử lý Đăng ký
        [HttpPost]
        public ActionResult register(string fullName, string email, string password, string confirmPassword)
        {
            // Kiểm tra dữ liệu nhập vào
            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(confirmPassword))
            {
                ViewBag.Error = "Vui lòng nhập đầy đủ thông tin.";
                return View();
            }

            if (password != confirmPassword)
            {
                ViewBag.Error = "Mật khẩu xác nhận không khớp.";
                return View();
            }

            // Kiểm tra định dạng Email (...@....com)
            if (!Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.com$"))
            {
                ViewBag.Error = "Email không hợp lệ.";
                return View();
            }

            // Kiểm tra độ mạnh Mật khẩu
            string passPattern = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$";
            if (!Regex.IsMatch(password, passPattern))
            {
                ViewBag.Error = "Mật khẩu phải từ 8 ký tự, có chữ hoa, chữ thường, số và ký tự đặc biệt.";
                return View();
            }

            // Kiểm tra Email đã tồn tại chưa
            var checkEmail = db.KHACH_HANG.FirstOrDefault(x => x.Email == email);
            if (checkEmail != null)
            {
                ViewBag.Error = "Email này đã được đăng ký.";
                return View();
            }

            // Tạo Mã Khách Hàng tự động (KHxxx)
            var lastCustomer = db.KHACH_HANG.OrderByDescending(x => x.MaKH).FirstOrDefault();
            string newMaKH = "KH001";
            if (lastCustomer != null)
            {
                // Lấy phần số: KH001 -> 001
                string numberPart = lastCustomer.MaKH.Substring(2);
                if (int.TryParse(numberPart, out int currentNumber))
                {
                    newMaKH = "KH" + (currentNumber + 1).ToString("D3");
                }
            }

            // Lưu vào Database
            try
            {
                var user = new KHACH_HANG();
                user.MaKH = newMaKH;
                user.TenDangNhap = email;
                user.Email = email;
                user.MatKhau = password;
                user.HoTen = fullName;
                user.TrangThai = true;

                db.KHACH_HANG.Add(user);
                db.SaveChanges();

                // Đăng ký thành công -> Chuyển sang trang đăng nhập
                TempData["Success"] = "Đăng ký thành công! Vui lòng đăng nhập.";
                return RedirectToAction("login");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Có lỗi xảy ra: " + ex.Message;
                return View();
            }
        }

        // Đăng nhập
        [HttpGet]
        public ActionResult login()
        {
            return View();
        }

        // Xử lý Đăng nhập
        [HttpPost]
        public ActionResult login(string email, string password)
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ViewBag.Error = "Vui lòng nhập email và mật khẩu.";
                return View();
            }

            // Kiểm tra bảng KHACH_HANG trước
            var khach = db.KHACH_HANG.FirstOrDefault(x => x.Email == email && x.MatKhau == password);
            if (khach != null)
            {
                if (khach.TrangThai == false)
                {
                    ViewBag.Error = "Tài khoản khách hàng đã bị khóa.";
                    return View();
                }

                // Logic của khách
                if (Session["GuestCart"] == null) Session["GuestCart"] = Session["Cart"];

                Session["MaKH"] = khach.MaKH;
                Session["TenKhachHang"] = khach.HoTen;
                Session["Email"] = khach.Email;
                Session["ChucVu"] = null;

                LoadCartFromDb(khach.MaKH);
                return RedirectToAction("Index");
            }

            // Nếu không phải là khách -> Kiểm tra bảng NHAN_VIEN
            var nhanvien = db.NHAN_VIEN.FirstOrDefault(x => x.TenDangNhap == email && x.MatKhau == password);
            if (nhanvien != null)
            {
                if (nhanvien.TrangThai == false)
                {
                    ViewBag.Error = "Tài khoản nhân viên đã bị khóa.";
                    return View();
                }

                // Lưu Session cho nhân viên
                Session["MaNV"] = nhanvien.MaNV;
                Session["TenHienThi"] = nhanvien.HoTen;
                Session["ChucVu"] = nhanvien.ChucVu;

                // Chuyển hướng sang khu vực Admin
                return RedirectToAction("Index", "Dashboard", new { area = "Admin" });
            }

            // Thông báo khi không tìm thấy ở cả 2 bảng
            ViewBag.Error = "Tên đăng nhập hoặc mật khẩu không chính xác.";
            return View();
        }

        // Đăng xuất
        public ActionResult Logout()
        {
            // Khôi phục giỏ hàng Khách vãng lai (nếu có)
            if (Session["GuestCart"] != null)
            {
                Session["Cart"] = Session["GuestCart"];
                Session["GuestCart"] = null;
            }
            else
            {
                Session["Cart"] = new List<CartItem>();
            }

            // Chỉ xóa các Session liên quan đến thông tin đăng nhập
            Session["MaKH"] = null;
            Session["TenKhachHang"] = null;
            Session["Email"] = null;

            // Xóa các mã giảm giá/ship đang áp dụng của thành viên (để Guest nhập mới)
            Session["CurrentCoupon"] = null;
            Session["CurrentShipping"] = null;

            return RedirectToAction("Index");
        }

        // Giới Thiệu
        public ActionResult about()
        {
            return View();
        }

        // Đơn Hàng
        public ActionResult order()
        {
            List<DON_HANG> listDonHang;

            // Kiểm tra trạng thái đăng nhập
            if (Session["MaKH"] != null)
            {
                // THÀNH VIÊN: Lấy đơn hàng theo MaKH
                string maKH = Session["MaKH"].ToString();
                listDonHang = db.DON_HANG.Where(d => d.MaKH == maKH)
                                         .OrderByDescending(d => d.NgayDat)
                                         .ToList();
            }
            else
            {
                // KHÁCH VÃNG LAI: Lấy đơn hàng có mã bắt đầu bằng "GUEST"
                listDonHang = db.DON_HANG.Where(d => d.MaDonHang.StartsWith("GUEST"))
                                         .OrderByDescending(d => d.NgayDat)
                                         .ToList();
            }

            var listOrderVM = new List<OrderVM>();

            foreach (var dh in listDonHang)
            {
                // Lấy chi tiết đơn hàng & tạo ViewModel
                var chiTietItems = (from ctdh in db.CHI_TIET_DON_HANG
                                    join ctsp in db.CHI_TIET_SP on ctdh.MaCTSP equals ctsp.MaCTSP
                                    join sp in db.SAN_PHAM on ctsp.MaSP equals sp.MaSP
                                    join k in db.KICH_THUOC on ctsp.MaKichThuoc equals k.MaKichThuoc
                                    where ctdh.MaDonHang == dh.MaDonHang
                                    select new OrderItemVM
                                    {
                                        MaSP = sp.MaSP,
                                        TenSanPham = sp.TenSanPham,
                                        AnhDaiDien = db.HINH_ANH_SP.Where(h => h.MaSP == sp.MaSP && h.LaAnhChinh == true).Select(h => h.DuongDan).FirstOrDefault(),
                                        TenKichThuoc = k.TenKichThuoc,
                                        SoLuong = ctdh.SoLuong,
                                        DonGia = ctdh.DonGia
                                    }).ToList();

                var orderVM = new OrderVM
                {
                    MaDonHang = dh.MaDonHang,
                    NgayDat = dh.NgayDat,
                    TrangThai = dh.TrangThaiDonHang,
                    TenNguoiNhan = dh.TenNguoiNhan,
                    SoDienThoai = dh.SoDienThoai,
                    DiaChiGiao = dh.DiaChiGiao,
                    GhiChu = dh.GhiChu,
                    TamTinh = chiTietItems.Sum(x => x.ThanhTien),
                    PhiVanChuyen = dh.PhiVanChuyen ?? 0,
                    GiamGia = dh.GiamGia ?? 0,
                    TongTien = (chiTietItems.Sum(x => x.ThanhTien) + (dh.PhiVanChuyen ?? 0)) - (dh.GiamGia ?? 0),
                    ChiTiet = chiTietItems
                };

                listOrderVM.Add(orderVM);
            }

            return View(listOrderVM);
        }

        // Xử lý "Đã nhận hàng"
        [HttpPost]
        public JsonResult ConfirmReceived(string maDonHang)
        {
            var dh = db.DON_HANG.FirstOrDefault(d => d.MaDonHang == maDonHang);
            if (dh != null)
            {
                // Chỉ cho phép đổi trạng thái nếu đang là "Đang giao"
                if (dh.TrangThaiDonHang == "Đang giao")
                {
                    dh.TrangThaiDonHang = "Hoàn tất";
                    dh.DaThanhToan = true;
                    db.SaveChanges();
                    return Json(new { success = true, message = "Cập nhật thành công!" });
                }
                return Json(new { success = false, message = "Đơn hàng không ở trạng thái đang giao." });
            }
            return Json(new { success = false, message = "Không tìm thấy đơn hàng." });
        }

        // Lấy số lượng đơn hàng đã đặt
        [HttpGet]
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public JsonResult GetOrderCount()
        {
            int count = 0;

            if (Session["MaKH"] != null)
            {
                // Đếm đơn của Thành viên
                string maKH = Session["MaKH"].ToString();
                count = db.DON_HANG.Count(d => d.MaKH == maKH && d.TrangThaiDonHang != "Hoàn tất" && d.TrangThaiDonHang != "Hủy");
            }
            else
            {
                // Đếm đơn của GUEST
                string prefix = "GUEST";
                count = db.DON_HANG.Count(d => d.MaDonHang.StartsWith(prefix) && d.TrangThaiDonHang != "Hoàn tất" && d.TrangThaiDonHang != "Hủy");
            }

            return Json(new { count = count }, JsonRequestBehavior.AllowGet);
        }

        // Giỏ Hàng
        public ActionResult cart()
        {
            var cart = GetCart();

            // Chuẩn bị danh sách Size cho từng sản phẩm trong giỏ
            var sizeListDict = new Dictionary<string, SelectList>();

            foreach (var item in cart)
            {
                // Lấy list size của sản phẩm này từ DB
                var sizes = (from ct in db.CHI_TIET_SP
                             join k in db.KICH_THUOC on ct.MaKichThuoc equals k.MaKichThuoc
                             where ct.MaSP == item.MaSP && ct.TrangThai == true && ct.SoLuong > 0
                             select new { k.MaKichThuoc, k.TenKichThuoc })
                             .ToList();

                // Sắp xếp size
                var sortedSizes = sizes.OrderBy(x =>
                {
                    switch (x.TenKichThuoc)
                    {
                        case "S": return 1;
                        case "M": return 2;
                        case "L": return 3;
                        case "XL": return 4;
                        default:
                            int val;
                            if (int.TryParse(x.TenKichThuoc, out val)) return val + 10;
                            return 99;
                    }
                }).ToList();

                // Lấy MaKichThuoc hiện tại của item trong giỏ để set selected
                var currentSizeId = db.CHI_TIET_SP.FirstOrDefault(x => x.MaCTSP == item.MaCTSP)?.MaKichThuoc;

                sizeListDict[item.MaCTSP] = new SelectList(sortedSizes, "MaKichThuoc", "TenKichThuoc", currentSizeId);
            }
            ViewBag.CurrentCoupon = Session["CurrentCoupon"] as string;
            ViewBag.CurrentShipping = Session["CurrentShipping"] as string;
            ViewBag.SizeDict = sizeListDict;

            return View(cart);
        }

        // Cập nhật trạng thái chọn (Tích checkbox)
        [HttpPost]
        public JsonResult UpdateCartSelection(string maCTSP, bool isSelected)
        {
            var cart = GetCart();
            var item = cart.FirstOrDefault(x => x.MaCTSP == maCTSP);
            if (item != null)
            {
                item.IsSelected = isSelected;
                Session["Cart"] = cart;
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }

        // Cập nhật chọn tất cả
        [HttpPost]
        public JsonResult UpdateCartSelectionAll(bool isSelected)
        {
            var cart = GetCart();
            foreach (var item in cart)
            {
                item.IsSelected = isSelected;
            }
            Session["Cart"] = cart;
            return Json(new { success = true });
        }

        // Xử lý đổi Size trong giỏ hàng
        [HttpPost]
        public JsonResult UpdateCartSize(string maSP, string oldMaCTSP, string newSizeId)
        {
            var cart = GetCart();
            var item = cart.FirstOrDefault(x => x.MaCTSP == oldMaCTSP);

            if (item != null)
            {
                var newVariant = db.CHI_TIET_SP.FirstOrDefault(x => x.MaSP == maSP && x.MaKichThuoc == newSizeId);
                if (newVariant != null)
                {
                    // Logic Session
                    var duplicateItem = cart.FirstOrDefault(x => x.MaCTSP == newVariant.MaCTSP);
                    if (duplicateItem != null && duplicateItem != item)
                    {
                        duplicateItem.SoLuong += item.SoLuong;
                        cart.Remove(item);
                    }
                    else
                    {
                        item.MaCTSP = newVariant.MaCTSP;
                        item.TenKichThuoc = db.KICH_THUOC.FirstOrDefault(k => k.MaKichThuoc == newSizeId)?.TenKichThuoc;
                        item.DonGia = newVariant.GiaBan;
                    }
                    Session["Cart"] = cart;

                    // Cập nhật DB
                    if (Session["MaKH"] != null)
                    {
                        string maKH = Session["MaKH"].ToString();

                        // Xóa item cũ trong DB
                        var oldGhItem = db.GIO_HANG.FirstOrDefault(x => x.MaKH == maKH && x.MaCTSP == oldMaCTSP);
                        if (oldGhItem != null) db.GIO_HANG.Remove(oldGhItem);

                        // Kiểm tra item mới đã có chưa, nếu có rồi thì cộng dồn số lượng, chưa có thì thêm mới
                        var newGhItem = db.GIO_HANG.FirstOrDefault(x => x.MaKH == maKH && x.MaCTSP == newVariant.MaCTSP);
                        if (newGhItem != null)
                        {
                            newGhItem.SoLuong += item.SoLuong;
                        }
                        else
                        {
                            var addItem = new GIO_HANG();
                            addItem.MaKH = maKH;
                            addItem.MaCTSP = newVariant.MaCTSP;
                            addItem.SoLuong = item.SoLuong;
                            db.GIO_HANG.Add(addItem);
                        }
                        db.SaveChanges();
                    }

                    return Json(new { success = true, message = "Cập nhật thành công" });
                }
            }
            return Json(new { success = false, message = "Lỗi cập nhật" });
        }

        // Cập nhật số lượng sản phẩm
        [HttpPost]
        public JsonResult UpdateCartQuantity(string maCTSP, int quantity)
        {
            var cart = GetCart();
            var item = cart.FirstOrDefault(x => x.MaCTSP == maCTSP);
            if (item != null)
            {
                item.SoLuong = quantity;
                Session["Cart"] = cart;

                if (Session["MaKH"] != null)
                {
                    string maKH = Session["MaKH"].ToString();
                    var ghItem = db.GIO_HANG.FirstOrDefault(x => x.MaKH == maKH && x.MaCTSP == maCTSP);
                    if (ghItem != null)
                    {
                        ghItem.SoLuong = quantity;
                        db.SaveChanges();
                    }
                }

                return Json(new { success = true });
            }
            return Json(new { success = false, message = "Không tìm thấy sản phẩm" });
        }

        // Xóa sản phẩm khỏi giỏ
        [HttpPost]
        public JsonResult RemoveFromCart(string maCTSP)
        {
            var cart = GetCart();
            var item = cart.FirstOrDefault(x => x.MaCTSP == maCTSP);
            if (item != null)
            {
                cart.Remove(item);
                Session["Cart"] = cart;

                if (Session["MaKH"] != null)
                {
                    string maKH = Session["MaKH"].ToString();
                    var ghItem = db.GIO_HANG.FirstOrDefault(x => x.MaKH == maKH && x.MaCTSP == maCTSP);
                    if (ghItem != null)
                    {
                        db.GIO_HANG.Remove(ghItem);
                        db.SaveChanges();
                    }
                }

                return Json(new { success = true });
            }
            return Json(new { success = false, message = "Lỗi khi xóa" });
        }

        // HÀM TÍNH TOÁN CHI TIẾT HÓA ĐƠN
        [HttpPost]
        public JsonResult GetOrderSummary(List<string> selectedIds, string shippingMethod, string couponCode, bool clearCoupon = false)
        {
            var cart = GetCart();
            decimal subTotal = 0;
            decimal shippingFee = 0;
            decimal discountAmount = 0;
            string msg = "";

            // Biến này để báo cho JS biết mã VỪA GỬI LÊN có hợp lệ hay không (để hiện Toast)
            bool isInputValid = false;

            // Biến này lưu mã sẽ được DÙNG để tính tiền (có thể là mã cũ nếu mã mới sai)
            string activeCode = null;

            // Xử lý yêu cầu xóa mã
            if (clearCoupon)
            {
                Session["CurrentCoupon"] = null;
            }

            // Tính Tạm tính
            if (selectedIds != null && selectedIds.Count > 0)
            {
                foreach (var item in cart)
                {
                    if (selectedIds.Contains(item.MaCTSP))
                    {
                        item.IsSelected = true;
                        subTotal += item.ThanhTien;
                    }
                    else item.IsSelected = false;
                }
                Session["Cart"] = cart;
            }
            else
            {
                cart.ForEach(x => x.IsSelected = false);
                Session["Cart"] = cart;
            }

            // Xử lý Vận chuyển
            if (!string.IsNullOrEmpty(shippingMethod)) Session["CurrentShipping"] = shippingMethod;
            else
            {
                if (Session["CurrentShipping"] != null) shippingMethod = Session["CurrentShipping"].ToString();
                else shippingMethod = "BD";
            }

            if (!string.IsNullOrEmpty(shippingMethod))
            {
                var method = db.PHUONG_THUC_VAN_CHUYEN.FirstOrDefault(p => p.MaPTVC == shippingMethod);
                if (method != null) shippingFee = method.GiaVanChuyen ?? 0;
            }

            // Xử lý Mã giảm giá
            if (!string.IsNullOrEmpty(couponCode) && !clearCoupon)
            {
                var coupon = db.MA_GIAM_GIA.FirstOrDefault(c => c.MaCode == couponCode && c.TrangThai == true);
                if (coupon != null && coupon.SoLuong > 0)
                {
                    // TRƯỜNG HỢP 1: Mã mới NGON -> Dùng mã mới, Lưu Session
                    activeCode = couponCode;
                    Session["CurrentCoupon"] = couponCode;
                    isInputValid = true;
                }
                else
                {
                    // TRƯỜNG HỢP 2: Mã mới SAI -> Báo lỗi, NHƯNG KHÔNG XÓA SESSION
                    msg = "Mã giảm giá không tồn tại hoặc đã hết hạn.";
                    isInputValid = false;

                    // FALLBACK: Lấy lại mã cũ trong Session ra để tính tiền (nếu có)
                    if (Session["CurrentCoupon"] != null)
                    {
                        activeCode = Session["CurrentCoupon"].ToString();
                    }
                }
            }
            else
            {
                // TRƯỜNG HỢP 3: Không nhập gì (Reload trang hoặc đổi số lượng)
                if (!clearCoupon && Session["CurrentCoupon"] != null)
                {
                    activeCode = Session["CurrentCoupon"].ToString();
                    var check = db.MA_GIAM_GIA.FirstOrDefault(c => c.MaCode == activeCode && c.TrangThai == true && c.SoLuong > 0);
                    if (check != null) isInputValid = true;
                    else
                    {
                        activeCode = null;
                        Session["CurrentCoupon"] = null;
                    }
                }
            }

            // Tính toán
            if (!string.IsNullOrEmpty(activeCode))
            {
                var coupon = db.MA_GIAM_GIA.FirstOrDefault(c => c.MaCode == activeCode);
                if (coupon != null)
                {
                    if (coupon.LoaiGiamGia == "percent")
                        discountAmount = subTotal * (coupon.GiaTri / 100);
                    else if (coupon.LoaiGiamGia == "cash")
                        discountAmount = coupon.GiaTri;
                    else if (coupon.LoaiGiamGia == "shipping")
                        discountAmount = shippingFee;
                }
            }

            // Tổng cộng
            decimal grandTotal = (subTotal + shippingFee) - discountAmount;
            if (grandTotal < 0) grandTotal = 0;

            return Json(new
            {
                TamTinh = subTotal,
                PhiVanChuyen = shippingFee,
                GiamGia = discountAmount,
                TongCong = grandTotal,
                Message = msg,
                CouponValid = isInputValid,
                AppliedCode = activeCode
            });
        }

        // Thanh Toán
        public ActionResult checkout()
        {
            var cart = GetCart();
            var selectedItems = cart.Where(x => x.IsSelected).ToList();

            if (selectedItems.Count == 0)
            {
                return RedirectToAction("cart");
            }

            // Tính toán tiền
            decimal tamTinh = selectedItems.Sum(x => x.ThanhTien);
            string maPTVC = Session["CurrentShipping"] as string ?? "BD";
            var method = db.PHUONG_THUC_VAN_CHUYEN.FirstOrDefault(p => p.MaPTVC == maPTVC);
            decimal phiShip = method != null ? (method.GiaVanChuyen ?? 0) : 0;

            decimal giamGia = 0;
            string couponCode = Session["CurrentCoupon"] as string;
            if (!string.IsNullOrEmpty(couponCode))
            {
                var coupon = db.MA_GIAM_GIA.FirstOrDefault(c => c.MaCode == couponCode && c.TrangThai == true);
                if (coupon != null)
                {
                    if (coupon.LoaiGiamGia == "percent") giamGia = tamTinh * (coupon.GiaTri / 100);
                    else if (coupon.LoaiGiamGia == "cash") giamGia = coupon.GiaTri;
                    else if (coupon.LoaiGiamGia == "shipping") giamGia = phiShip;
                }
            }

            ViewBag.TamTinh = tamTinh;
            ViewBag.PhiShip = phiShip;
            ViewBag.GiamGia = giamGia;
            ViewBag.TongCong = (tamTinh + phiShip) - giamGia;
            ViewBag.MaPTVC = maPTVC;

            // Lấy thông tin khách hàng nếu đã đăng nhập
            if (Session["MaKH"] != null)
            {
                string maKH = Session["MaKH"].ToString();
                var kh = db.KHACH_HANG.FirstOrDefault(k => k.MaKH == maKH);
                if (kh != null)
                {
                    ViewBag.UserTen = kh.HoTen;
                    ViewBag.UserSdt = kh.SoDienThoai;
                    ViewBag.UserDiaChi = kh.DiaChi;
                    ViewBag.UserEmail = kh.Email;
                }
            }

            return View(selectedItems);
        }

        // Xử lý logic đặt hàng
        [HttpPost]
        public JsonResult PlaceOrder(string tenNguoiNhan, string soDienThoai, string diaChi, string ghiChu, string phuongThucThanhToan)
        {
            try
            {
                // Kiểm tra sđt
                if (string.IsNullOrEmpty(soDienThoai) || soDienThoai.Length != 10 || !soDienThoai.StartsWith("0") || !soDienThoai.All(char.IsDigit))
                {
                    return Json(new { success = false, message = "Số điện thoại không hợp lệ! (Phải là 10 số)" });
                }

                var cart = GetCart();
                var selectedItems = cart.Where(x => x.IsSelected).ToList();

                if (selectedItems.Count == 0)
                    return Json(new { success = false, message = "Vui lòng chọn sản phẩm để thanh toán." });

                // Xác định tiền tố mã đơn hàng & Mã khách hàng
                string maKH = Session["MaKH"] as string;
                string prefixID = "GUEST";
                // Nếu đăng nhập thì dùng mã KH (Ví dụ: KH001)
                if (!string.IsNullOrEmpty(maKH))
                {
                    prefixID = maKH;
                }
                // Ví dụ: GUESTDH hoặc KH001DH
                string prefixOrder = prefixID + "DH";

                // Tạo Mã Đơn Hàng (Tăng dần)
                var lastOrder = db.DON_HANG
                                  .Where(x => x.MaDonHang.StartsWith(prefixOrder))
                                  .OrderByDescending(x => x.MaDonHang)
                                  .FirstOrDefault();

                int nextNumber = 1;
                if (lastOrder != null)
                {
                    // Cắt bỏ 7 mã tiền tố đầu, lấy phần số còn lại
                    string numberPart = lastOrder.MaDonHang.Substring(prefixOrder.Length);
                    if (int.TryParse(numberPart, out int currentNumber))
                    {
                        nextNumber = currentNumber + 1;
                    }
                }

                // Format số thứ tự thành 3 chữ số (001, 002...)
                string maDonHang = prefixOrder + nextNumber.ToString("D3");

                // lấy Session mã giảm giá, ship giữ nguyên
                string maCode = Session["CurrentCoupon"] as string;
                string maPTVC = Session["CurrentShipping"] as string ?? "BD";

                // Tạo đối tượng Đơn Hàng
                var donHang = new DON_HANG();
                donHang.MaDonHang = maDonHang;
                donHang.MaKH = maKH;
                donHang.TenNguoiNhan = tenNguoiNhan;
                donHang.SoDienThoai = soDienThoai;
                string email = "guest@email.com";
                if (!string.IsNullOrEmpty(maKH))
                {
                    var kh = db.KHACH_HANG.Find(maKH);
                    if (kh != null) email = kh.Email;
                }
                donHang.Email = email;
                donHang.DiaChiGiao = diaChi;
                donHang.GhiChu = ghiChu;
                donHang.MaCode = maCode;
                donHang.MaPTVC = maPTVC;
                donHang.NgayDat = DateTime.Now;
                donHang.NgayGiaoDuKien = DateTime.Now.AddDays(3);
                donHang.PhuongThucThanhToan = phuongThucThanhToan;
                donHang.TrangThaiDonHang = "Chờ xác nhận";
                donHang.TrangThai = true;

                // Các giá trị tiền mặc định (Trigger sẽ tính lại)
                donHang.TongTien = 0;
                donHang.TongSoLuong = 0;
                donHang.PhiVanChuyen = 0;
                donHang.GiamGia = 0;

                // Xử lý giảm giá
                decimal phiVanChuyenThucTe = 0;
                var phuongThucVC = db.PHUONG_THUC_VAN_CHUYEN.FirstOrDefault(p => p.MaPTVC == maPTVC);
                if (phuongThucVC != null) phiVanChuyenThucTe = phuongThucVC.GiaVanChuyen ?? 0;

                decimal tamTinh = selectedItems.Sum(x => x.ThanhTien);
                if (!string.IsNullOrEmpty(maCode))
                {
                    var coupon = db.MA_GIAM_GIA.FirstOrDefault(c => c.MaCode == maCode);
                    if (coupon != null)
                    {
                        if (coupon.LoaiGiamGia == "percent") donHang.GiamGia = tamTinh * (coupon.GiaTri / 100);
                        else if (coupon.LoaiGiamGia == "cash") donHang.GiamGia = coupon.GiaTri;
                        else if (coupon.LoaiGiamGia == "shipping") donHang.GiamGia = phiVanChuyenThucTe;
                    }
                }

                db.DON_HANG.Add(donHang);

                // Lưu Chi Tiết & Trừ Kho
                foreach (var item in selectedItems)
                {
                    var variant = db.CHI_TIET_SP.FirstOrDefault(x => x.MaCTSP == item.MaCTSP);
                    if (variant == null || variant.SoLuong < item.SoLuong)
                    {
                        return Json(new { success = false, message = $"Sản phẩm {item.TenSanPham} - {item.TenKichThuoc} không đủ hàng." });
                    }

                    variant.SoLuong -= item.SoLuong; // Trừ kho

                    var ctdh = new CHI_TIET_DON_HANG();
                    ctdh.MaDonHang = maDonHang;
                    ctdh.MaCTSP = item.MaCTSP;
                    ctdh.SoLuong = item.SoLuong;
                    ctdh.DonGia = item.DonGia;
                    ctdh.TrangThai = true;

                    db.CHI_TIET_DON_HANG.Add(ctdh);
                }

                // Lưu DB
                db.SaveChanges();

                // Xử lý xóa giỏ hàng
                foreach (var item in selectedItems)
                {
                    cart.Remove(item);
                }
                Session["Cart"] = cart;
                Session["CurrentCoupon"] = null;

                // NẾU LÀ THÀNH VIÊN: Xóa các món đã mua trong Database (Bảng GIO_HANG)
                if (!string.IsNullOrEmpty(maKH))
                {
                    foreach (var item in selectedItems)
                    {
                        var ghItem = db.GIO_HANG.FirstOrDefault(x => x.MaKH == maKH && x.MaCTSP == item.MaCTSP);
                        if (ghItem != null)
                        {
                            db.GIO_HANG.Remove(ghItem);
                        }
                    }
                    db.SaveChanges();
                }

                return Json(new { success = true, maDonHang = maDonHang });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Có lỗi xảy ra: " + ex.Message });
            }
        }

        // Hàm phụ: Tải giỏ hàng từ Database lên Session (Dùng khi đăng nhập)
        private void LoadCartFromDb(string maKH)
        {
            var listGioHang = (from gh in db.GIO_HANG
                               join ct in db.CHI_TIET_SP on gh.MaCTSP equals ct.MaCTSP
                               join sp in db.SAN_PHAM on ct.MaSP equals sp.MaSP
                               join k in db.KICH_THUOC on ct.MaKichThuoc equals k.MaKichThuoc
                               join img in db.HINH_ANH_SP on sp.MaSP equals img.MaSP
                               where gh.MaKH == maKH && img.LaAnhChinh == true
                               select new CartItem
                               {
                                   MaSP = sp.MaSP,
                                   TenSanPham = sp.TenSanPham,
                                   AnhDaiDien = img.DuongDan,
                                   MaCTSP = gh.MaCTSP,
                                   TenKichThuoc = k.TenKichThuoc,
                                   DonGia = ct.GiaBan,
                                   SoLuong = gh.SoLuong,
                                   IsSelected = false
                               }).ToList();

            Session["Cart"] = listGioHang;
        }
    }
}

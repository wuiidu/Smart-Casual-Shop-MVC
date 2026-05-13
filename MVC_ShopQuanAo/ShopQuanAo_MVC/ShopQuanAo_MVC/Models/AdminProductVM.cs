using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopQuanAo_MVC.Models
{
    public class AdminProductVM
    {
        public string MaSP { get; set; }
        public string TenSanPham { get; set; }
        public string TenDanhMuc { get; set; }
        public string AnhDaiDien { get; set; }
        public string MoTa { get; set; }
        public decimal GiaBan { get; set; }
        public int TongTonKho { get; set; }
        public HttpPostedFileBase ImageFile { get; set; }
        public string MaDanhMuc { get; set; }
        public List<ProductDetailInput> ChiTietSize { get; set; }
        public AdminProductVM()
        {
            ChiTietSize = new List<ProductDetailInput>();
        }
    }

    // Class phụ để hứng dữ liệu từng size từ Form
    public class ProductDetailInput
    {
        public string SizeName { get; set; }
        public decimal GiaBan { get; set; }
        public int SoLuong { get; set; }
        public bool IsSelected { get; set; }
    }
}

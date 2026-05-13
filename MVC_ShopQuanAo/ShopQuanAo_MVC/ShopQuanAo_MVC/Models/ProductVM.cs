using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopQuanAo_MVC.Models
{
    public class ProductVM
    {
        public string MaSP { get; set; }
        public string TenSanPham { get; set; }
        public string AnhDaiDien { get; set; }
        public decimal GiaBan { get; set; }
        public string MoTa { get; set; }
        public double DiemDanhGia { get; set; }
        public int SoLuongDanhGia { get; set; }
    }
}

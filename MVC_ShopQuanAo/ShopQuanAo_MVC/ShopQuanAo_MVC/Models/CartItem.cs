using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopQuanAo_MVC.Models
{
    [Serializable]
    public class CartItem
    {
        public string MaSP { get; set; }
        public string TenSanPham { get; set; }
        public string AnhDaiDien { get; set; }
        public string MaCTSP { get; set; }
        public string TenKichThuoc { get; set; }
        public decimal DonGia { get; set; }
        public int SoLuong { get; set; }
        public decimal ThanhTien { get { return SoLuong * DonGia; } }
        public bool IsSelected { get; set; } = false;
    }
}
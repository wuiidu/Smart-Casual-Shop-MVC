using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopQuanAo_MVC.Models
{
    // Thông tin tổng quan đơn hàng
    public class OrderVM
    {
        public string MaDonHang { get; set; }
        public DateTime NgayDat { get; set; }
        public string TrangThai { get; set; }
        public string TenNguoiNhan { get; set; }
        public string SoDienThoai { get; set; }
        public string DiaChiGiao { get; set; }
        public string GhiChu { get; set; }
        public decimal TamTinh { get; set; }
        public decimal PhiVanChuyen { get; set; }
        public decimal GiamGia { get; set; }
        public decimal TongTien { get; set; }
        public List<OrderItemVM> ChiTiet { get; set; }
    }

    // Thông tin từng sản phẩm trong đơn
    public class OrderItemVM
    {
        public string MaSP { get; set; }
        public string TenSanPham { get; set; }
        public string AnhDaiDien { get; set; }
        public string TenKichThuoc { get; set; }
        public int SoLuong { get; set; }
        public decimal DonGia { get; set; }
        public decimal ThanhTien { get { return SoLuong * DonGia; } }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopQuanAo_MVC.Models
{
    public class AdminOrderVM
    {
        public string MaDonHang { get; set; }
        public string TenKhachHang { get; set; }
        public DateTime NgayDat { get; set; }
        public decimal TongTien { get; set; }
        public bool DaThanhToan { get; set; }
        public string TrangThaiDonHang { get; set; }
    }

    // Class chứa thống kê doanh thu
    public class RevenueStats
    {
        public decimal TongDoanhThu { get; set; }
        public int DonHoanThanh { get; set; }
        public int DonDangXuLy { get; set; }
        public double TyLeHoanThanh { get; set; }
    }

    public class RevenueReportVM
    {
        public decimal TongDoanhThu { get; set; }
        public int DonHoanThanh { get; set; }
        public int DonDangXuLy { get; set; }
        public int DonHuy { get; set; }
        public double TyLeHoanThanh { get; set; }

        // Danh sách các đơn hàng đã đóng góp vào doanh thu (Đơn hoàn tất)
        public List<AdminOrderVM> DSDonHoanThanh { get; set; }
    }
}

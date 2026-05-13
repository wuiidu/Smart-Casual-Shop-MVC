using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopQuanAo_MVC.Models
{
    public class OrderSummaryVM
    {
        public decimal TamTinh { get; set; }
        public decimal PhiVanChuyen { get; set; }
        public decimal GiamGia { get; set; }
        public decimal TongCong { get; set; }
        public string Message { get; set; }
    }
}

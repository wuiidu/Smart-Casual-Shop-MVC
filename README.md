**🛒 Smart Casual Clothing Store (MVC \& SQL Server)**

Hệ thống website thời trang được xây dựng trên nền tảng ASP.NET MVC.

&#x09;**Lưu ý:** Để tối ưu dung lượng, dự án đã lược bỏ các thư mục packages, bin và obj. Vui lòng thực hiện các bước dưới đây để khôi phục và chạy dự án.



\-----------------------------------------------------------------------------------------------------------------------------------



**🗄️ BƯỚC 1: CẤU HÌNH CƠ SỞ DỮ LIỆU (SQL SERVER)**

Trong thư mục SQL\_ShopQuanAo, bạn vui lòng chạy lần lượt các file SQL theo thứ tự sau để đảm bảo cấu trúc và dữ liệu:

&#x09;1. **1\_TaoBang.sql**: Tạo cấu trúc các bảng.

&#x09;2. **2\_Trigger.sql**: Thiết lập các Trigger nghiệp vụ.

&#x09;3. **3\_DuLieu.sql**: Thêm dữ liệu mẫu để trải nghiệm.



\-----------------------------------------------------------------------------------------------------------------------------------



**📦 BƯỚC 2: KHÔI PHỤC THƯ VIỆN TRONG VISUAL STUDIO**

Do thư mục packages đã được lược bỏ, bạn cần cài đặt lại compiler platform để tránh lỗi khi build:

&#x09;1. Mở Solution (.sln) bằng **Visual Studio Community**.

&#x09;2. Vào menu: **Tools > NuGet Package Manager > Package Manager Console.**

&#x09;3. Tại dòng lệnh PM>, dán và chạy lệnh sau:  Update-Package -Reinstall Microsoft.CodeDom.Providers.DotNetCompilerPlatform

&#x09;4. Đợi quá trình cài đặt hoàn tất.



\-----------------------------------------------------------------------------------------------------------------------------------



**🚀 BƯỚC 3: BUILD VÀ CHẠY DỰ ÁN**

&#x09;1. Tại bảng **Solution Explorer**, click chuột phải vào Solution chọn **Rebuild Solution** để tái tạo lại các thư mục hệ thống (bin/obj).

&#x09;2. Nhấn **F5** (hoặc **Ctrl + F5**) để khởi chạy chương trình trên trình duyệt.



\-----------------------------------------------------------------------------------------------------------------------------------



**🔑 THÔNG TIN TÀI KHOẢN TRẢI NGHIỆM**

Hệ thống sử dụng **giao diện đăng nhập chung** cho cả khách hàng và nhân viên quản lý. Tùy vào tài khoản đăng nhập mà hệ thống sẽ điều hướng đến trang bán hàng hoặc trang quản trị tương ứng.

|**Vai trò**|**Tên đăng nhập**|**Mật khẩu**|
|-|-|-|
|**Quản lý (Admin)**|admin|Admin@123|
|**Nhân viên (Staff)**|staff|Staff@123|
|**Khách hàng Demo**|demo1@gmail.com|Demo@123|

(Dữ liệu chi tiết nằm trong bảng NHAN\_VIEN và KHACH\_HANG)



\-----------------------------------------------------------------------------------------------------------------------------------



**🎟️ HỆ THỐNG MÃ GIẢM GIÁ**

Để trải nghiệm tính năng tính toán khuyến mãi trong giỏ hàng, bạn có thể sử dụng các mã sau:

* **SAVE10**: Giảm 10% tổng hóa đơn.
* **CASH5**: Giảm trực tiếp 5.000đ.
* **CASH20**: Giảm trực tiếp 20.000đ.
* **FREESHIP**: Miễn phí vận chuyển.
* **NEW25**: Giảm 25% cho khách hàng mới.



\-----------------------------------------------------------------------------------------------------------------------------------



**Cảm ơn bạn đã quan tâm đến dự án!**


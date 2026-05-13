**🛒 Smart Casual Clothing Store (MVC \& SQL Server)**

Hệ thống website thời trang được xây dựng trên nền tảng ASP.NET MVC.

&#x09;**Lưu ý:** Để tối ưu dung lượng, dự án đã lược bỏ các thư mục packages, bin và obj. Vui lòng thực hiện các bước dưới đây để khôi phục và chạy dự án.



\--------------------------------------------------------------------------------------------------------------------



**🗄️BƯỚC 1: CẤU HÌNH CƠ SỞ DỮ LIỆU (SQL SERVER)**

Trong thư mục SQL\_ShopQuanAo\_v0.28, bạn vui lòng chạy lần lượt các file SQL theo thứ tự sau để đảm bảo cấu trúc và dữ liệu:

&#x09;1. **1\_TaoBang.sql**: Tạo cấu trúc các bảng.

&#x09;2. **2\_Trigger.sql**: Thiết lập các Trigger nghiệp vụ.

&#x09;3. **3\_DuLieu.sql**: Thêm dữ liệu mẫu để trải nghiệm.



\--------------------------------------------------------------------------------------------------------------------



**📦BƯỚC 2: KHÔI PHỤC THƯ VIỆN TRONG VISUAL STUDIO**

Do thư mục packages đã được lược bỏ, bạn cần cài đặt lại compiler platform để tránh lỗi khi build:

&#x09;1. Mở Solution (.sln) bằng **Visual Studio Community**.

&#x09;2. Vào menu: **Tools > NuGet Package Manager > Package Manager Console.**

&#x09;3. Tại dòng lệnh PM>, dán và chạy lệnh sau:  Update-Package -Reinstall Microsoft.CodeDom.Providers.DotNetCompilerPlatform

&#x09;4. Đợi quá trình cài đặt hoàn tất.



\--------------------------------------------------------------------------------------------------------------------



**🚀BƯỚC 3: BUILD VÀ CHẠY DỰ ÁN**

&#x09;1. Tại bảng **Solution Explorer**, click chuột phải vào Solution chọn **Rebuild Solution** để tái tạo lại các thư mục hệ thống (bin/obj).

&#x09;2. Nhấn **F5** (hoặc **Ctrl + F5**) để khởi chạy chương trình trên trình duyệt.



\--------------------------------------------------------------------------------------------------------------------



**Cảm ơn bạn đã quan tâm đến dự án!**


============================================================
HƯỚNG DẪN CÀI ĐẶT VÀ TRIỂN KHAI PROJECT
============================================================
LƯU Ý: 
Để tối ưu dung lượng file nộp, em đã lược bỏ các thư mục "packages", "bin" và "obj". 
Kính mong thầy thực hiện các bước sau để khôi phục và chạy dự án.

------------------------------------------------------------
BƯỚC 1: CẤU HÌNH CƠ SỞ DỮ LIỆU (SQL SERVER)
------------------------------------------------------------
Trong thư mục "SQL_ShopQuanAo_v0.28", vui lòng chạy lần lượt các file sql theo thứ tự sau để đảm bảo cấu trúc và dữ liệu:

1. Chạy file "1_TaoBang.sql" -> Để tạo cấu trúc bảng.
2. Chạy file "2_Trigger.sql" -> Để thiết lập các Trigger.
3. Chạy file "3_DuLieu.sql" -> Để thêm dữ liệu mẫu.

------------------------------------------------------------
BƯỚC 2: KHÔI PHỤC THƯ VIỆN VÀ COMPILER TRONG VISUAL STUDIO
------------------------------------------------------------
Do thư mục packages đã bị xóa, compiler platform cần được cài đặt lại để tránh lỗi build.

1. Mở Solution (.sln) bằng Visual Studio Community.
2. Vào menu: Tools > NuGet Package Manager > Package Manager Console.
3. Tại dòng lệnh "PM>", dán và chạy lệnh sau:

   Update-Package -Reinstall Microsoft.CodeDom.Providers.DotNetCompilerPlatform

4. Đợi quá trình cài đặt hoàn tất.

------------------------------------------------------------
BƯỚC 3: BUILD VÀ CHẠY PROJECT
------------------------------------------------------------
1. Bảng Solution Explorer: click chuột trái vào Solution '...' (ngay dưới ô Search Solution Explorer) > Rebuild Solution (để tái tạo lại folder bin/obj).
2. Nhấn F5 (hoặc Ctrl + F5) để chạy chương trình.

Em xin cảm ơn thầy ạ!
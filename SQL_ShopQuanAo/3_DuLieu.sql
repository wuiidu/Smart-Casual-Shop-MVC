USE ShopQuanAo
GO

-- ============================================================================================================================================================
-- DỮ LIỆU


-- Bảng KHACH_HANG
INSERT INTO KHACH_HANG (MaKH, TenDangNhap, MatKhau, HoTen, SoDienThoai, Email, TrangThai) VALUES 
('KH001', 'demo1@gmail.com', 'Demo@123', N'Nguyễn Văn A', '0901234567', 'demo1@gmail.com', 1),
('KH002', 'demo2@gmail.com', 'User#456', N'Trần Thị B', '0909888777', 'demo2@gmail.com', 1),
('KH003', 'demo3@gmail.com', 'Pass$789', N'Lê Văn C', '0912345678', 'demo3@gmail.com', 1);


-- Bảng NHAN_VIEN
INSERT INTO NHAN_VIEN (MaNV, TenDangNhap, MatKhau, HoTen, ChucVu, TrangThai) VALUES 
('NV001', 'admin', 'Admin@123', N'Quản Lý Cửa Hàng', N'Quản lý', 1),
('NV002', 'staff', 'Staff@123', N'Nhân Viên Bán Hàng', N'Nhân viên', 1);


-- Bảng DANH_MUC
INSERT INTO DANH_MUC (MaDanhMuc, TenDanhMuc, TrangThai) VALUES 
('A', N'Áo', 1),
('Q', N'Quần', 1),
('G', N'Giày', 1);


-- Bảng KICH_THUOC
INSERT INTO KICH_THUOC (MaKichThuoc, TenKichThuoc, TrangThai) VALUES 
-- Áo 1
('A01SzS', 'S', 1), ('A01SzM', 'M', 1), ('A01SzL', 'L', 1), ('A01SzXL', 'XL', 1),
-- Áo 2
('A02SzS', 'S', 1), ('A02SzM', 'M', 1), ('A02SzL', 'L', 1), ('A02SzXL', 'XL', 1),
-- Áo 3
('A03SzS', 'S', 1), ('A03SzM', 'M', 1), ('A03SzL', 'L', 1), ('A03SzXL', 'XL', 1),
-- Áo 4
('A04SzS', 'S', 1), ('A04SzM', 'M', 1), ('A04SzL', 'L', 1), ('A04SzXL', 'XL', 1),
-- Áo 5
('A05SzS', 'S', 1), ('A05SzM', 'M', 1), ('A05SzL', 'L', 1), ('A05SzXL', 'XL', 1),
-- Áo 6
('A06SzS', 'S', 1), ('A06SzM', 'M', 1), ('A06SzL', 'L', 1), ('A06SzXL', 'XL', 1),
-- Áo 7
('A07SzS', 'S', 1), ('A07SzM', 'M', 1), ('A07SzL', 'L', 1), ('A07SzXL', 'XL', 1),
-- Áo 8
('A08SzS', 'S', 1), ('A08SzM', 'M', 1), ('A08SzL', 'L', 1), ('A08SzXL', 'XL', 1),
-- Áo 9
('A09SzS', 'S', 1), ('A09SzM', 'M', 1), ('A09SzL', 'L', 1), ('A09SzXL', 'XL', 1),
-- Áo 10
('A10SzS', 'S', 1), ('A10SzM', 'M', 1), ('A10SzL', 'L', 1), ('A10SzXL', 'XL', 1),
-- Áo 11
('A11SzS', 'S', 1), ('A11SzM', 'M', 1), ('A11SzL', 'L', 1), ('A11SzXL', 'XL', 1),
-- Áo 12
('A12SzS', 'S', 1), ('A12SzM', 'M', 1), ('A12SzL', 'L', 1), ('A12SzXL', 'XL', 1),
-- Áo 13
('A13SzS', 'S', 1), ('A13SzM', 'M', 1), ('A13SzL', 'L', 1), ('A13SzXL', 'XL', 1),
-- Áo 14
('A14SzS', 'S', 1), ('A14SzM', 'M', 1), ('A14SzL', 'L', 1), ('A14SzXL', 'XL', 1),
-- Áo 15
('A15SzS', 'S', 1), ('A15SzM', 'M', 1), ('A15SzL', 'L', 1), ('A15SzXL', 'XL', 1),
-- Áo 16
('A16SzS', 'S', 1), ('A16SzM', 'M', 1), ('A16SzL', 'L', 1), ('A16SzXL', 'XL', 1),
-- Quần 1
('Q01SzS', 'S', 1), ('Q01SzM', 'M', 1), ('Q01SzL', 'L', 1), ('Q01SzXL', 'XL', 1),
-- Quần 2
('Q02SzS', 'S', 1), ('Q02SzM', 'M', 1), ('Q02SzL', 'L', 1), ('Q02SzXL', 'XL', 1),
-- Quần 3
('Q03SzS', 'S', 1), ('Q03SzM', 'M', 1), ('Q03SzL', 'L', 1), ('Q03SzXL', 'XL', 1),
-- Quần 4
('Q04SzS', 'S', 1), ('Q04SzM', 'M', 1), ('Q04SzL', 'L', 1), ('Q04SzXL', 'XL', 1),
-- Quần 5
('Q05SzS', 'S', 1), ('Q05SzM', 'M', 1), ('Q05SzL', 'L', 1), ('Q05SzXL', 'XL', 1),
-- Quần 6
('Q06SzS', 'S', 1), ('Q06SzM', 'M', 1), ('Q06SzL', 'L', 1), ('Q06SzXL', 'XL', 1),
-- Quần 7
('Q07SzS', 'S', 1), ('Q07SzM', 'M', 1), ('Q07SzL', 'L', 1), ('Q07SzXL', 'XL', 1),
-- Quần 8
('Q08SzS', 'S', 1), ('Q08SzM', 'M', 1), ('Q08SzL', 'L', 1), ('Q08SzXL', 'XL', 1),
-- Quần 9
('Q09SzS', 'S', 1), ('Q09SzM', 'M', 1), ('Q09SzL', 'L', 1), ('Q09SzXL', 'XL', 1),
-- Quần 10
('Q10SzS', 'S', 1), ('Q10SzM', 'M', 1), ('Q10SzL', 'L', 1), ('Q10SzXL', 'XL', 1),
-- Quần 11
('Q11SzS', 'S', 1), ('Q11SzM', 'M', 1), ('Q11SzL', 'L', 1), ('Q11SzXL', 'XL', 1),
-- Quần 12
('Q12SzS', 'S', 1), ('Q12SzM', 'M', 1), ('Q12SzL', 'L', 1), ('Q12SzXL', 'XL', 1),
-- Quần 13
('Q13SzS', 'S', 1), ('Q13SzM', 'M', 1), ('Q13SzL', 'L', 1), ('Q13SzXL', 'XL', 1),
-- Quần 14
('Q14SzS', 'S', 1), ('Q14SzM', 'M', 1), ('Q14SzL', 'L', 1), ('Q14SzXL', 'XL', 1),
-- Quần 15
('Q15SzS', 'S', 1), ('Q15SzM', 'M', 1), ('Q15SzL', 'L', 1), ('Q15SzXL', 'XL', 1),
-- Quần 16
('Q16SzS', 'S', 1), ('Q16SzM', 'M', 1), ('Q16SzL', 'L', 1), ('Q16SzXL', 'XL', 1),
-- Giày 1
('G01Sz38', '38', 1), ('G01Sz39', '39', 1), ('G01Sz40', '40', 1), ('G01Sz41', '41', 1), ('G01Sz42', '42', 1), ('G01Sz43', '43', 1), ('G01Sz44', '44', 1), ('G01Sz45', '45', 1),
-- Giày 2
('G02Sz38', '38', 1), ('G02Sz39', '39', 1), ('G02Sz40', '40', 1), ('G02Sz41', '41', 1), ('G02Sz42', '42', 1), ('G02Sz43', '43', 1), ('G02Sz44', '44', 1), ('G02Sz45', '45', 1),
-- Giày 3
('G03Sz38', '38', 1), ('G03Sz39', '39', 1), ('G03Sz40', '40', 1), ('G03Sz41', '41', 1), ('G03Sz42', '42', 1), ('G03Sz43', '43', 1), ('G03Sz44', '44', 1), ('G03Sz45', '45', 1),
-- Giày 4
('G04Sz38', '38', 1), ('G04Sz39', '39', 1), ('G04Sz40', '40', 1), ('G04Sz41', '41', 1), ('G04Sz42', '42', 1), ('G04Sz43', '43', 1), ('G04Sz44', '44', 1), ('G04Sz45', '45', 1),
-- Giày 5
('G05Sz38', '38', 1), ('G05Sz39', '39', 1), ('G05Sz40', '40', 1), ('G05Sz41', '41', 1), ('G05Sz42', '42', 1), ('G05Sz43', '43', 1), ('G05Sz44', '44', 1), ('G05Sz45', '45', 1),
-- Giày 6
('G06Sz38', '38', 1), ('G06Sz39', '39', 1), ('G06Sz40', '40', 1), ('G06Sz41', '41', 1), ('G06Sz42', '42', 1), ('G06Sz43', '43', 1), ('G06Sz44', '44', 1), ('G06Sz45', '45', 1),
-- Giày 7
('G07Sz38', '38', 1), ('G07Sz39', '39', 1), ('G07Sz40', '40', 1), ('G07Sz41', '41', 1), ('G07Sz42', '42', 1), ('G07Sz43', '43', 1), ('G07Sz44', '44', 1), ('G07Sz45', '45', 1),
-- Giày 8
('G08Sz38', '38', 1), ('G08Sz39', '39', 1), ('G08Sz40', '40', 1), ('G08Sz41', '41', 1), ('G08Sz42', '42', 1), ('G08Sz43', '43', 1), ('G08Sz44', '44', 1), ('G08Sz45', '45', 1),
-- Giày 9
('G09Sz38', '38', 1), ('G09Sz39', '39', 1), ('G09Sz40', '40', 1), ('G09Sz41', '41', 1), ('G09Sz42', '42', 1), ('G09Sz43', '43', 1), ('G09Sz44', '44', 1), ('G09Sz45', '45', 1),
-- Giày 10
('G10Sz38', '38', 1), ('G10Sz39', '39', 1), ('G10Sz40', '40', 1), ('G10Sz41', '41', 1), ('G10Sz42', '42', 1), ('G10Sz43', '43', 1), ('G10Sz44', '44', 1), ('G10Sz45', '45', 1),
-- Giày 11
('G11Sz38', '38', 1), ('G11Sz39', '39', 1), ('G11Sz40', '40', 1), ('G11Sz41', '41', 1), ('G11Sz42', '42', 1), ('G11Sz43', '43', 1), ('G11Sz44', '44', 1), ('G11Sz45', '45', 1),
-- Giày 12
('G12Sz38', '38', 1), ('G12Sz39', '39', 1), ('G12Sz40', '40', 1), ('G12Sz41', '41', 1), ('G12Sz42', '42', 1), ('G12Sz43', '43', 1), ('G12Sz44', '44', 1), ('G12Sz45', '45', 1),
-- Giày 13
('G13Sz38', '38', 1), ('G13Sz39', '39', 1), ('G13Sz40', '40', 1), ('G13Sz41', '41', 1), ('G13Sz42', '42', 1), ('G13Sz43', '43', 1), ('G13Sz44', '44', 1), ('G13Sz45', '45', 1),
-- Giày 14
('G14Sz38', '38', 1), ('G14Sz39', '39', 1), ('G14Sz40', '40', 1), ('G14Sz41', '41', 1), ('G14Sz42', '42', 1), ('G14Sz43', '43', 1), ('G14Sz44', '44', 1), ('G14Sz45', '45', 1),
-- Giày 15
('G15Sz38', '38', 1), ('G15Sz39', '39', 1), ('G15Sz40', '40', 1), ('G15Sz41', '41', 1), ('G15Sz42', '42', 1), ('G15Sz43', '43', 1), ('G15Sz44', '44', 1), ('G15Sz45', '45', 1),
-- Giày 16
('G16Sz38', '38', 1), ('G16Sz39', '39', 1), ('G16Sz40', '40', 1), ('G16Sz41', '41', 1), ('G16Sz42', '42', 1), ('G16Sz43', '43', 1), ('G16Sz44', '44', 1), ('G16Sz45', '45', 1);


-- Bảng SAN_PHAM
INSERT INTO SAN_PHAM (MaSP, MaDanhMuc, TenSanPham, MoTa, TrangThai) VALUES 
-- ÁO
('A01', 'A', N'Áo NY Thêu Ngực', N'Form áo rộng rãi, thoải mái vận động, thấm rút mồ hôi tốt. Hình in sắc nét, Logo trước ngực được thêu tỉ mỉ.', 1),
('A02', 'A', N'Áo LA Navy Thêu Ngực', N'Thiết kế đơn giản, dễ phối đồ, phù hợp cho mọi phong cách hằng ngày.', 1),
('A03', 'A', N'Áo NY BaseBall Đen', N'Form rộng cá tính, mang lại cảm giác thoải mái và hiện đại.', 1),
('A04', 'A', N'Áo World Wide Đen', N'Chất cotton co giãn nhẹ, thích hợp cho cả nam và nữ.', 1),
('A05', 'A', N'Áo MLB B01 Đen', N'Họa tiết độc đáo, nổi bật cá tính riêng biệt.', 1),
('A06', 'A', N'Áo MLB NY Trắng Thêu Trơn', N'Thiết kế trẻ trung, dễ phối với quần jean hoặc short.', 1),
('A07', 'A', N'Áo MLB Boston Mono Kem', N'Ôm dáng nhẹ nhàng, tôn lên thân hình cân đối.', 1),
('A08', 'A', N'Áo MLB LA Xanh Dương', N'Áo thun cổ tròn mềm mại, thoáng khí.', 1),
('A09', 'A', N'Áo MLB NY Xanh Logo Thêu', N'Thời trang và đẳng cấp với điểm nhấn thương hiệu.', 1),
('A10', 'A', N'Áo MLB LA Trắng Logo Xanh', N'Sự kết hợp màu sắc tinh tế, tạo nên tổng thể hài hòa và bắt mắt.', 1),
('A11', 'A', N'Áo NY MLB', N'Áo thun in hình trẻ trung, phù hợp với giới trẻ.', 1),
('A12', 'A', N'Áo Adidas 3 Sọc ADICOLOR Màu Đen', N'Dáng regular fit, cổ tròn, viền tay áo bo gân, logo 3 sọc thiết kế độc đáo dọc cánh tay.', 1),
('A13', 'A', N'Áo Adidas Sọc Trắng', N'Thiết kế thể thao cổ điển, logo 3 lá cá tính, dễ phối đồ.', 1),
('A14', 'A', N'Áo Boston Thun Dệt Đen', N' Logo B nổi bật, phong cách streetwear mạnh mẽ.', 1),
('A15', 'A', N'Áo Convernat Xanh Coban', N' Local brand tối giản, màu trung tính, cotton dày mịn.', 1),
('A16', 'A', N'Áo COLDSTONE REDEEMER', N'Dễ thương, trẻ trung, vải mát nhẹ, mặc đi chơi.', 1),
-- QUẦN
('Q01', 'Q', N'Quần Cargo', N'Quần tây ống đứng, form chuẩn, dễ phối với áo sơ mi hoặc polo.', 1),
('Q02', 'Q', N'Quần Dài Túi Hộp Đen', N'Quần tây co giãn nhẹ, thoải mái di chuyển cả ngày dài.', 1),
('Q03', 'Q', N'Quần Jean Spao Cargo', N'Quần tôn dáng và tạo cảm giác chân dài hơn.', 1),
('Q04', 'Q', N'Quần Dài Nam Men Trousers', N'United Colors of Benetton gây ấn tượng bởi các thiết kế đa dạng màu sắc được chế tác từ vải dệt kim thoáng nhẹ.', 1),
('Q05', 'Q', N'Quần Slim Fit Chinos', N'Quần tây vải lạnh, không nhăn, luôn giữ form phẳng đẹp.', 1),
('Q06', 'Q', N'Quần ARMANI EXCHANGE', N'Lấy cảm hứng từ phong cách sống thành thị giữa hai thành phố Milan và New York, kết hợp cùng những nét đặc trưng trong văn hóa đường phố và âm nhạc', 1),
('Q07', 'Q', N'Quần Danito Black', N'Quần tây lưng cao, tôn dáng và tạo cảm giác chân dài hơn.', 1),
('Q08', 'Q', N'Quần MasCuline Beggi', N'Quần tây đen basic, không thể thiếu trong tủ đồ nam thanh lịch.', 1),
('Q09', 'Q', N'Quần Kaki Chino', N'Quần kaki ống suông, thoáng mát, mang lại vẻ ngoài trẻ trung.', 1),
('Q10', 'Q', N'Quần Tommy Hilfiger', N'Quần kaki co giãn 4 chiều, vừa vặn và linh hoạt.', 1),
('Q11', 'Q', N'Quần Stretch-Fabric Slim-Fit Suit Trousers', N'Quần kaki màu be thanh lịch, dễ phối với nhiều phong cách.', 1),
('Q12', 'Q', N'Quần Slim Fit Serge Chino', N'Quần tây dáng slim-fit, ôm nhẹ tôn dáng, phù hợp môi trường công sở.', 1),
('Q13', 'Q', N'Quần Ultra Stretch Denim Leggings Pants', N'Quần kaki wash nhẹ, tạo hiệu ứng màu tự nhiên và cá tính.', 1),
('Q14', 'Q', N'Quần Dài Piccola', N'Quần kaki ống đứng truyền thống, chuẩn dáng nam tính.', 1),
('Q15', 'Q', N'Quần Slim Fit Twill', N'Quần kaki slim-fit co giãn nhẹ, tôn dáng mà không gò bó.', 1),
('Q16', 'Q', N'Quần Kaki Levi Crago Stay Loose', N'Jogger lưng cao tôn dáng, dễ vận động.', 1),
-- GIÀY
('G01', 'G', N'Giày Superstar', N'Giày Adidas Superstar có họa tiết ren trang trí.', 1),
('G02', 'G', N'Giày Court Refit', N'Giày mang phong cách sân đấu cổ điển, được làm một phần từ vật liệu tái chế.', 1),
('G03', 'G', N'Giày Samba OG', N'Giày cổ điển làm bằng da mềm có mũi chữ T bằng da lộn.', 1),
('G04', 'G', N'Giày Barreda', N'Giày thể thao cổ điển làm bằng da tổng hợp và da lộn.', 1),
('G05', 'G', N'Giày Nike Air Force 1 ''07', N'Thoải mái, bền bỉ và vượt thời gian—nó là số một vì một lý do. Thiết kế cổ điển của thập niên 80 kết hợp da mịn với các chi tiết nổi bật để tạo nên phong cách phù hợp cho dù bạn đang ở trên sân hay đang di chuyển.', 1),
('G06', 'G', N'Giày NikeCourt Lite 4', N'Cho dù bạn đang đào, đánh bóng hay cố gắng đưa bóng xuống đường biên sau khi thoát khỏi một set đấu chia đôi, NikeCourt Lite 4 đều có thể giúp bạn giữ giao bóng.', 1),
('G07', 'G', N'Giày Jordan Stadium 90', N'Sự thoải mái là điều quan trọng nhất, nhưng điều đó không có nghĩa là bạn phải hy sinh phong cách.', 1),
('G08', 'G', N'Giày Air Jordan 1 Low', N'Lấy cảm hứng từ phiên bản gốc ra mắt năm 1985, Air Jordan 1 Low mang đến vẻ ngoài cổ điển, sạch sẽ, quen thuộc nhưng luôn mới mẻ.', 1),
('G09', 'G', N'Giày Nike Full Force Low', N'Một đôi giày mới với sức hấp dẫn của trường phái cũ—giấc mơ hoài cổ của bạn vừa trở thành hiện thực.', 1),
('G10', 'G', N'Giày SIGOURNEY SIG-33', N'Giày nam tăng chiều cao 6cm Sigourney SIG-33 có thiết kế dáng Oxford cổ điển với màu đen bóng sang trọng, dễ mang, dễ phối đồ, mang đến vẻ sang trọng và chỉn chu cho người mang.', 1),
('G11', 'G', N'Giày Loafer SIGOURNEY SIG-45', N'Giới thiệu đến mọi người một mẫu Loafer với phong cách hoàn toàn khác biệt.', 1),
('G12', 'G', N'Giày Cao Gót Nữ EHE006Z0', N'Thiết kế form dáng Basic cổ điển, với quai phần quai thanh lịch, giữ chân cố định và tạo điểm nhấn thẩm mỹ.', 1),
('G13', 'G', N'Giày Cao Gót Nữ EHE044S0', N'Phù hợp cho các dịp công sở, sự kiện trang trọng hoặc dạo phố thanh lịch.', 1),
('G14', 'G', N'Giày Cao Gót Nữ EHE017Z0', N'Thiết kế form dáng cổ điển Mary Jane, với quai ngang qua mu bàn chân, giữ chân cố định và tạo điểm nhấn thẩm mỹ.', 1),
('G15', 'G', N'Giày Cao Gót Nữ EFL010Z0', N'Loafers chunky, với phần mũi giày tròn, tạo cảm giác thanh lịch nhưng không quá cứng nhắc.', 1),
('G16', 'G', N'Giày Boots Nữ E44005Z0', N'Knee-high boots (boots cao đến đầu gối) mang phong cách cá tính và thời thượng.', 1);


-- Bảng CHI_TIET_SP
INSERT INTO CHI_TIET_SP (MaCTSP, MaSP, MaKichThuoc, GiaBan, SoLuong, TrangThai) VALUES 
-- Áo 1 (Giá: 150.000)
('CTA01SzS', 'A01', 'A01SzS', 150000, 50, 1),
('CTA01SzM', 'A01', 'A01SzM', 150000, 25, 1),
('CTA01SzL', 'A01', 'A01SzL', 150000, 78, 1),
('CTA01SzXL', 'A01', 'A01SzXL', 150000, 42, 1),
-- Áo 2 (Giá: 250.000)
('CTA02SzS', 'A02', 'A02SzS', 250000, 15, 1),
('CTA02SzM', 'A02', 'A02SzM', 250000, 66, 1),
('CTA02SzL', 'A02', 'A02SzL', 250000, 89, 1),
('CTA02SzXL', 'A02', 'A02SzXL', 250000, 33, 1),
-- Áo 3 (Giá: 320.000)
('CTA03SzS', 'A03', 'A03SzS', 320000, 91, 1),
('CTA03SzM', 'A03', 'A03SzM', 320000, 12, 1),
('CTA03SzL', 'A03', 'A03SzL', 320000, 55, 1),
('CTA03SzXL', 'A03', 'A03SzXL', 320000, 47, 1),
-- Áo 4 (Giá: 220.000)
('CTA04SzS', 'A04', 'A04SzS', 220000, 88, 1),
('CTA04SzM', 'A04', 'A04SzM', 220000, 34, 1),
('CTA04SzL', 'A04', 'A04SzL', 220000, 29, 1),
('CTA04SzXL', 'A04', 'A04SzXL', 220000, 61, 1),
-- Áo 5 (Giá: 450.000)
('CTA05SzS', 'A05', 'A05SzS', 450000, 72, 1),
('CTA05SzM', 'A05', 'A05SzM', 450000, 19, 1),
('CTA05SzL', 'A05', 'A05SzL', 450000, 54, 1),
('CTA05SzXL', 'A05', 'A05SzXL', 450000, 83, 1),
-- Áo 6 (Giá: 380.000)
('CTA06SzS', 'A06', 'A06SzS', 380000, 45, 1),
('CTA06SzM', 'A06', 'A06SzM', 380000, 99, 1),
('CTA06SzL', 'A06', 'A06SzL', 380000, 21, 1),
('CTA06SzXL', 'A06', 'A06SzXL', 380000, 67, 1),
-- Áo 7 (Giá: 260.000)
('CTA07SzS', 'A07', 'A07SzS', 260000, 38, 1),
('CTA07SzM', 'A07', 'A07SzM', 260000, 52, 1),
('CTA07SzL', 'A07', 'A07SzL', 260000, 77, 1),
('CTA07SzXL', 'A07', 'A07SzXL', 260000, 14, 1),
-- Áo 8 (Giá: 170.000)
('CTA08SzS', 'A08', 'A08SzS', 170000, 95, 1),
('CTA08SzM', 'A08', 'A08SzM', 170000, 41, 1),
('CTA08SzL', 'A08', 'A08SzL', 170000, 63, 1),
('CTA08SzXL', 'A08', 'A08SzXL', 170000, 28, 1),
-- Áo 9 (Giá: 350.000)
('CTA09SzS', 'A09', 'A09SzS', 350000, 56, 1),
('CTA09SzM', 'A09', 'A09SzM', 350000, 82, 1),
('CTA09SzL', 'A09', 'A09SzL', 350000, 11, 1),
('CTA09SzXL', 'A09', 'A09SzXL', 350000, 93, 1),
-- Áo 10 (Giá: 400.000)
('CTA10SzS', 'A10', 'A10SzS', 400000, 70, 1),
('CTA10SzM', 'A10', 'A10SzM', 400000, 48, 1),
('CTA10SzL', 'A10', 'A10SzL', 400000, 22, 1),
('CTA10SzXL', 'A10', 'A10SzXL', 400000, 59, 1),
-- Áo 11 (Giá: 280.000)
('CTA11SzS', 'A11', 'A11SzS', 280000, 35, 1),
('CTA11SzM', 'A11', 'A11SzM', 280000, 87, 1),
('CTA11SzL', 'A11', 'A11SzL', 280000, 64, 1),
('CTA11SzXL', 'A11', 'A11SzXL', 280000, 16, 1),
-- Áo 12 (Giá: 210.000)
('CTA12SzS', 'A12', 'A12SzS', 210000, 92, 1),
('CTA12SzM', 'A12', 'A12SzM', 210000, 57, 1),
('CTA12SzL', 'A12', 'A12SzL', 210000, 43, 1),
('CTA12SzXL', 'A12', 'A12SzXL', 210000, 76, 1),
-- Áo 13 (Giá: 180.000)
('CTA13SzS', 'A13', 'A13SzS', 180000, 24, 1),
('CTA13SzM', 'A13', 'A13SzM', 180000, 69, 1),
('CTA13SzL', 'A13', 'A13SzL', 180000, 81, 1),
('CTA13SzXL', 'A13', 'A13SzXL', 180000, 39, 1),
-- Áo 14 (Giá: 300.000)
('CTA14SzS', 'A14', 'A14SzS', 300000, 53, 1),
('CTA14SzM', 'A14', 'A14SzM', 300000, 18, 1),
('CTA14SzL', 'A14', 'A14SzL', 300000, 96, 1),
('CTA14SzXL', 'A14', 'A14SzXL', 300000, 44, 1),
-- Áo 15 (Giá: 270.000)
('CTA15SzS', 'A15', 'A15SzS', 270000, 62, 1),
('CTA15SzM', 'A15', 'A15SzM', 270000, 85, 1),
('CTA15SzL', 'A15', 'A15SzL', 270000, 27, 1),
('CTA15SzXL', 'A15', 'A15SzXL', 270000, 71, 1),
-- Áo 16 (Giá: 460.000)
('CTA16SzS', 'A16', 'A16SzS', 460000, 30, 1),
('CTA16SzM', 'A16', 'A16SzM', 460000, 58, 1),
('CTA16SzL', 'A16', 'A16SzL', 460000, 94, 1),
('CTA16SzXL', 'A16', 'A16SzXL', 460000, 13, 1),
-- Quần 1 (Giá: 400.000)
('CTQ01SzS', 'Q01', 'Q01SzS', 400000, 65, 1),
('CTQ01SzM', 'Q01', 'Q01SzM', 400000, 23, 1),
('CTQ01SzL', 'Q01', 'Q01SzL', 400000, 84, 1),
('CTQ01SzXL', 'Q01', 'Q01SzXL', 400000, 49, 1),
-- Quần 2 (Giá: 180.000)
('CTQ02SzS', 'Q02', 'Q02SzS', 180000, 73, 1),
('CTQ02SzM', 'Q02', 'Q02SzM', 180000, 36, 1),
('CTQ02SzL', 'Q02', 'Q02SzL', 180000, 17, 1),
('CTQ02SzXL', 'Q02', 'Q02SzXL', 180000, 98, 1),
-- Quần 3 (Giá: 350.000)
('CTQ03SzS', 'Q03', 'Q03SzS', 350000, 51, 1),
('CTQ03SzM', 'Q03', 'Q03SzM', 350000, 86, 1),
('CTQ03SzL', 'Q03', 'Q03SzL', 350000, 29, 1),
('CTQ03SzXL', 'Q03', 'Q03SzXL', 350000, 60, 1),
-- Quần 4 (Giá: 270.000)
('CTQ04SzS', 'Q04', 'Q04SzS', 270000, 42, 1),
('CTQ04SzM', 'Q04', 'Q04SzM', 270000, 93, 1),
('CTQ04SzL', 'Q04', 'Q04SzL', 270000, 15, 1),
('CTQ04SzXL', 'Q04', 'Q04SzXL', 270000, 79, 1),
-- Quần 5 (Giá: 300.000)
('CTQ05SzS', 'Q05', 'Q05SzS', 300000, 68, 1),
('CTQ05SzM', 'Q05', 'Q05SzM', 300000, 32, 1),
('CTQ05SzL', 'Q05', 'Q05SzL', 300000, 87, 1),
('CTQ05SzXL', 'Q05', 'Q05SzXL', 300000, 24, 1),
-- Quần 6 (Giá: 420.000)
('CTQ06SzS', 'Q06', 'Q06SzS', 420000, 55, 1),
('CTQ06SzM', 'Q06', 'Q06SzM', 420000, 90, 1),
('CTQ06SzL', 'Q06', 'Q06SzL', 420000, 11, 1),
('CTQ06SzXL', 'Q06', 'Q06SzXL', 420000, 74, 1),
-- Quần 7 (Giá: 220.000)
('CTQ07SzS', 'Q07', 'Q07SzS', 220000, 39, 1),
('CTQ07SzM', 'Q07', 'Q07SzM', 220000, 83, 1),
('CTQ07SzL', 'Q07', 'Q07SzL', 220000, 66, 1),
('CTQ07SzXL', 'Q07', 'Q07SzXL', 220000, 47, 1),
-- Quần 8 (Giá: 280.000)
('CTQ08SzS', 'Q08', 'Q08SzS', 280000, 14, 1),
('CTQ08SzM', 'Q08', 'Q08SzM', 280000, 59, 1),
('CTQ08SzL', 'Q08', 'Q08SzL', 280000, 92, 1),
('CTQ08SzXL', 'Q08', 'Q08SzXL', 280000, 37, 1),
-- Quần 9 (Giá: 360.000)
('CTQ09SzS', 'Q09', 'Q09SzS', 360000, 76, 1),
('CTQ09SzM', 'Q09', 'Q09SzM', 360000, 25, 1),
('CTQ09SzL', 'Q09', 'Q09SzL', 360000, 53, 1),
('CTQ09SzXL', 'Q09', 'Q09SzXL', 360000, 89, 1),
-- Quần 10 (Giá: 410.000)
('CTQ10SzS', 'Q10', 'Q10SzS', 410000, 46, 1),
('CTQ10SzM', 'Q10', 'Q10SzM', 410000, 19, 1),
('CTQ10SzL', 'Q10', 'Q10SzL', 410000, 62, 1),
('CTQ10SzXL', 'Q10', 'Q10SzXL', 410000, 95, 1),
-- Quần 11 (Giá: 190.000)
('CTQ11SzS', 'Q11', 'Q11SzS', 190000, 22, 1),
('CTQ11SzM', 'Q11', 'Q11SzM', 190000, 58, 1),
('CTQ11SzL', 'Q11', 'Q11SzL', 190000, 81, 1),
('CTQ11SzXL', 'Q11', 'Q11SzXL', 190000, 34, 1),
-- Quần 12 (Giá: 260.000)
('CTQ12SzS', 'Q12', 'Q12SzS', 260000, 71, 1),
('CTQ12SzM', 'Q12', 'Q12SzM', 260000, 44, 1),
('CTQ12SzL', 'Q12', 'Q12SzL', 260000, 97, 1),
('CTQ12SzXL', 'Q12', 'Q12SzXL', 260000, 13, 1),
-- Quần 13 (Giá: 370.000)
('CTQ13SzS', 'Q13', 'Q13SzS', 370000, 50, 1),
('CTQ13SzM', 'Q13', 'Q13SzM', 370000, 85, 1),
('CTQ13SzL', 'Q13', 'Q13SzL', 370000, 28, 1),
('CTQ13SzXL', 'Q13', 'Q13SzXL', 370000, 67, 1),
-- Quần 14 (Giá: 430.000)
('CTQ14SzS', 'Q14', 'Q14SzS', 430000, 16, 1),
('CTQ14SzM', 'Q14', 'Q14SzM', 430000, 94, 1),
('CTQ14SzL', 'Q14', 'Q14SzL', 430000, 31, 1),
('CTQ14SzXL', 'Q14', 'Q14SzXL', 430000, 75, 1),
-- Quần 15 (Giá: 200.000)
('CTQ15SzS', 'Q15', 'Q15SzS', 200000, 57, 1),
('CTQ15SzM', 'Q15', 'Q15SzM', 200000, 40, 1),
('CTQ15SzL', 'Q15', 'Q15SzL', 200000, 88, 1),
('CTQ15SzXL', 'Q15', 'Q15SzXL', 200000, 26, 1),
-- Quần 16 (Giá: 290.000)
('CTQ16SzS', 'Q16', 'Q16SzS', 290000, 69, 1),
('CTQ16SzM', 'Q16', 'Q16SzM', 290000, 18, 1),
('CTQ16SzL', 'Q16', 'Q16SzL', 290000, 54, 1),
('CTQ16SzXL', 'Q16', 'Q16SzXL', 290000, 91, 1),
-- Giày 1 (Giá: 750.000)
('CTG01Sz38', 'G01', 'G01Sz38', 750000, 20, 1),
('CTG01Sz39', 'G01', 'G01Sz39', 750000, 35, 1),
('CTG01Sz40', 'G01', 'G01Sz40', 750000, 50, 1),
('CTG01Sz41', 'G01', 'G01Sz41', 750000, 60, 1),
('CTG01Sz42', 'G01', 'G01Sz42', 750000, 55, 1),
('CTG01Sz43', 'G01', 'G01Sz43', 750000, 40, 1),
('CTG01Sz44', 'G01', 'G01Sz44', 750000, 25, 1),
('CTG01Sz45', 'G01', 'G01Sz45', 750000, 15, 1),
-- Giày 2 (Giá: 1.200.000)
('CTG02Sz38', 'G02', 'G02Sz38', 1200000, 18, 1),
('CTG02Sz39', 'G02', 'G02Sz39', 1200000, 30, 1),
('CTG02Sz40', 'G02', 'G02Sz40', 1200000, 45, 1),
('CTG02Sz41', 'G02', 'G02Sz41', 1200000, 55, 1),
('CTG02Sz42', 'G02', 'G02Sz42', 1200000, 65, 1),
('CTG02Sz43', 'G02', 'G02Sz43', 1200000, 48, 1),
('CTG02Sz44', 'G02', 'G02Sz44', 1200000, 32, 1),
('CTG02Sz45', 'G02', 'G02Sz45', 1200000, 12, 1),
-- Giày 3 (Giá: 850.000)
('CTG03Sz38', 'G03', 'G03Sz38', 850000, 25, 1),
('CTG03Sz39', 'G03', 'G03Sz39', 850000, 40, 1),
('CTG03Sz40', 'G03', 'G03Sz40', 850000, 60, 1),
('CTG03Sz41', 'G03', 'G03Sz41', 850000, 75, 1),
('CTG03Sz42', 'G03', 'G03Sz42', 850000, 50, 1),
('CTG03Sz43', 'G03', 'G03Sz43', 850000, 35, 1),
('CTG03Sz44', 'G03', 'G03Sz44', 850000, 20, 1),
('CTG03Sz45', 'G03', 'G03Sz45', 850000, 10, 1),
-- Giày 4 (Giá: 1.100.000)
('CTG04Sz38', 'G04', 'G04Sz38', 1100000, 22, 1),
('CTG04Sz39', 'G04', 'G04Sz39', 1100000, 38, 1),
('CTG04Sz40', 'G04', 'G04Sz40', 1100000, 55, 1),
('CTG04Sz41', 'G04', 'G04Sz41', 1100000, 62, 1),
('CTG04Sz42', 'G04', 'G04Sz42', 1100000, 45, 1),
('CTG04Sz43', 'G04', 'G04Sz43', 1100000, 30, 1),
('CTG04Sz44', 'G04', 'G04Sz44', 1100000, 18, 1),
('CTG04Sz45', 'G04', 'G04Sz45', 1100000, 14, 1),
-- Giày 5 (Giá: 350.000)
('CTG05Sz38', 'G05', 'G05Sz38', 350000, 40, 1),
('CTG05Sz39', 'G05', 'G05Sz39', 350000, 55, 1),
('CTG05Sz40', 'G05', 'G05Sz40', 350000, 70, 1),
('CTG05Sz41', 'G05', 'G05Sz41', 350000, 85, 1),
('CTG05Sz42', 'G05', 'G05Sz42', 350000, 60, 1),
('CTG05Sz43', 'G05', 'G05Sz43', 350000, 50, 1),
('CTG05Sz44', 'G05', 'G05Sz44', 350000, 35, 1),
('CTG05Sz45', 'G05', 'G05Sz45', 350000, 20, 1),
-- Giày 6 (Giá: 700.000)
('CTG06Sz38', 'G06', 'G06Sz38', 700000, 30, 1),
('CTG06Sz39', 'G06', 'G06Sz39', 700000, 45, 1),
('CTG06Sz40', 'G06', 'G06Sz40', 700000, 58, 1),
('CTG06Sz41', 'G06', 'G06Sz41', 700000, 72, 1),
('CTG06Sz42', 'G06', 'G06Sz42', 700000, 64, 1),
('CTG06Sz43', 'G06', 'G06Sz43', 700000, 50, 1),
('CTG06Sz44', 'G06', 'G06Sz44', 700000, 28, 1),
('CTG06Sz45', 'G06', 'G06Sz45', 700000, 15, 1),
-- Giày 7 (Giá: 1.300.000)
('CTG07Sz38', 'G07', 'G07Sz38', 1300000, 15, 1),
('CTG07Sz39', 'G07', 'G07Sz39', 1300000, 28, 1),
('CTG07Sz40', 'G07', 'G07Sz40', 1300000, 40, 1),
('CTG07Sz41', 'G07', 'G07Sz41', 1300000, 52, 1),
('CTG07Sz42', 'G07', 'G07Sz42', 1300000, 48, 1),
('CTG07Sz43', 'G07', 'G07Sz43', 1300000, 36, 1),
('CTG07Sz44', 'G07', 'G07Sz44', 1300000, 20, 1),
('CTG07Sz45', 'G07', 'G07Sz45', 1300000, 10, 1),
-- Giày 8 (Giá: 900.000)
('CTG08Sz38', 'G08', 'G08Sz38', 900000, 35, 1),
('CTG08Sz39', 'G08', 'G08Sz39', 900000, 50, 1),
('CTG08Sz40', 'G08', 'G08Sz40', 900000, 65, 1),
('CTG08Sz41', 'G08', 'G08Sz41', 900000, 80, 1),
('CTG08Sz42', 'G08', 'G08Sz42', 900000, 70, 1),
('CTG08Sz43', 'G08', 'G08Sz43', 900000, 55, 1),
('CTG08Sz44', 'G08', 'G08Sz44', 900000, 40, 1),
('CTG08Sz45', 'G08', 'G08Sz45', 900000, 25, 1),
-- Giày 9 (Giá: 1.050.000)
('CTG09Sz38', 'G09', 'G09Sz38', 1050000, 20, 1),
('CTG09Sz39', 'G09', 'G09Sz39', 1050000, 32, 1),
('CTG09Sz40', 'G09', 'G09Sz40', 1050000, 48, 1),
('CTG09Sz41', 'G09', 'G09Sz41', 1050000, 60, 1),
('CTG09Sz42', 'G09', 'G09Sz42', 1050000, 55, 1),
('CTG09Sz43', 'G09', 'G09Sz43', 1050000, 42, 1),
('CTG09Sz44', 'G09', 'G09Sz44', 1050000, 28, 1),
('CTG09Sz45', 'G09', 'G09Sz45', 1050000, 15, 1),
-- Giày 10 (Giá: 400.000)
('CTG10Sz38', 'G10', 'G10Sz38', 400000, 45, 1),
('CTG10Sz39', 'G10', 'G10Sz39', 400000, 60, 1),
('CTG10Sz40', 'G10', 'G10Sz40', 400000, 80, 1),
('CTG10Sz41', 'G10', 'G10Sz41', 400000, 90, 1),
('CTG10Sz42', 'G10', 'G10Sz42', 400000, 75, 1),
('CTG10Sz43', 'G10', 'G10Sz43', 400000, 65, 1),
('CTG10Sz44', 'G10', 'G10Sz44', 400000, 40, 1),
('CTG10Sz45', 'G10', 'G10Sz45', 400000, 25, 1),
-- Giày 11 (Giá: 850.000)
('CTG11Sz38', 'G11', 'G11Sz38', 850000, 28, 1),
('CTG11Sz39', 'G11', 'G11Sz39', 850000, 42, 1),
('CTG11Sz40', 'G11', 'G11Sz40', 850000, 58, 1),
('CTG11Sz41', 'G11', 'G11Sz41', 850000, 70, 1),
('CTG11Sz42', 'G11', 'G11Sz42', 850000, 62, 1),
('CTG11Sz43', 'G11', 'G11Sz43', 850000, 48, 1),
('CTG11Sz44', 'G11', 'G11Sz44', 850000, 30, 1),
('CTG11Sz45', 'G11', 'G11Sz45', 850000, 18, 1),
-- Giày 12 (Giá: 1.250.000)
('CTG12Sz38', 'G12', 'G12Sz38', 1250000, 16, 1),
('CTG12Sz39', 'G12', 'G12Sz39', 1250000, 25, 1),
('CTG12Sz40', 'G12', 'G12Sz40', 1250000, 38, 1),
('CTG12Sz41', 'G12', 'G12Sz41', 1250000, 50, 1),
('CTG12Sz42', 'G12', 'G12Sz42', 1250000, 45, 1),
('CTG12Sz43', 'G12', 'G12Sz43', 1250000, 35, 1),
('CTG12Sz44', 'G12', 'G12Sz44', 1250000, 22, 1),
('CTG12Sz45', 'G12', 'G12Sz45', 1250000, 12, 1),
-- Giày 13 (Giá: 900.000)
('CTG13Sz38', 'G13', 'G13Sz38', 900000, 32, 1),
('CTG13Sz39', 'G13', 'G13Sz39', 900000, 48, 1),
('CTG13Sz40', 'G13', 'G13Sz40', 900000, 64, 1),
('CTG13Sz41', 'G13', 'G13Sz41', 900000, 78, 1),
('CTG13Sz42', 'G13', 'G13Sz42', 900000, 68, 1),
('CTG13Sz43', 'G13', 'G13Sz43', 900000, 52, 1),
('CTG13Sz44', 'G13', 'G13Sz44', 900000, 36, 1),
('CTG13Sz45', 'G13', 'G13Sz45', 900000, 20, 1),
-- Giày 14 (Giá: 1.100.000)
('CTG14Sz38', 'G14', 'G14Sz38', 1100000, 24, 1),
('CTG14Sz39', 'G14', 'G14Sz39', 1100000, 36, 1),
('CTG14Sz40', 'G14', 'G14Sz40', 1100000, 52, 1),
('CTG14Sz41', 'G14', 'G14Sz41', 1100000, 66, 1),
('CTG14Sz42', 'G14', 'G14Sz42', 1100000, 58, 1),
('CTG14Sz43', 'G14', 'G14Sz43', 1100000, 44, 1),
('CTG14Sz44', 'G14', 'G14Sz44', 1100000, 26, 1),
('CTG14Sz45', 'G14', 'G14Sz45', 1100000, 14, 1),
-- Giày 15 (Giá: 370.000)
('CTG15Sz38', 'G15', 'G15Sz38', 370000, 42, 1),
('CTG15Sz39', 'G15', 'G15Sz39', 370000, 58, 1),
('CTG15Sz40', 'G15', 'G15Sz40', 370000, 74, 1),
('CTG15Sz41', 'G15', 'G15Sz41', 370000, 88, 1),
('CTG15Sz42', 'G15', 'G15Sz42', 370000, 76, 1),
('CTG15Sz43', 'G15', 'G15Sz43', 370000, 62, 1),
('CTG15Sz44', 'G15', 'G15Sz44', 370000, 45, 1),
('CTG15Sz45', 'G15', 'G15Sz45', 370000, 30, 1),
-- Giày 16 (Giá: 1.100.000)
('CTG16Sz38', 'G16', 'G16Sz38', 1100000, 26, 1),
('CTG16Sz39', 'G16', 'G16Sz39', 1100000, 40, 1),
('CTG16Sz40', 'G16', 'G16Sz40', 1100000, 56, 1),
('CTG16Sz41', 'G16', 'G16Sz41', 1100000, 72, 1),
('CTG16Sz42', 'G16', 'G16Sz42', 1100000, 66, 1),
('CTG16Sz43', 'G16', 'G16Sz43', 1100000, 54, 1),
('CTG16Sz44', 'G16', 'G16Sz44', 1100000, 38, 1),
('CTG16Sz45', 'G16', 'G16Sz45', 1100000, 22, 1);


-- Bảng HINH_ANH_SP
INSERT INTO HINH_ANH_SP (MaHinhAnh, MaSP, DuongDan, LaAnhChinh, TrangThai) VALUES 
-- Áo 1
('A01H01', 'A01', N'assets/img/product-details/product-details-1-1/product-1-1.png', 1, 1),
('A01H02', 'A01', N'assets/img/product-details/product-details-1-1/product-1-2.png', 0, 1),
('A01H03', 'A01', N'assets/img/product-details/product-details-1-1/product-1-3.png', 0, 1),
('A01H04', 'A01', N'assets/img/product-details/product-details-1-1/product-1-4.png', 0, 1),
-- Áo 2
('A02H01', 'A02', N'assets/img/product-details/product-details-1-2/product-1-1.png', 1, 1),
('A02H02', 'A02', N'assets/img/product-details/product-details-1-2/product-1-2.png', 0, 1),
('A02H03', 'A02', N'assets/img/product-details/product-details-1-2/product-1-3.png', 0, 1),
('A02H04', 'A02', N'assets/img/product-details/product-details-1-2/product-1-4.png', 0, 1),
-- Áo 3
('A03H01', 'A03', N'assets/img/product-details/product-details-1-3/product-1-1.png', 1, 1),
('A03H02', 'A03', N'assets/img/product-details/product-details-1-3/product-1-2.png', 0, 1),
('A03H03', 'A03', N'assets/img/product-details/product-details-1-3/product-1-3.png', 0, 1),
('A03H04', 'A03', N'assets/img/product-details/product-details-1-3/product-1-4.png', 0, 1),
-- Áo 4
('A04H01', 'A04', N'assets/img/product-details/product-details-1-4/product-1-1.png', 1, 1),
('A04H02', 'A04', N'assets/img/product-details/product-details-1-4/product-1-2.png', 0, 1),
('A04H03', 'A04', N'assets/img/product-details/product-details-1-4/product-1-3.png', 0, 1),
('A04H04', 'A04', N'assets/img/product-details/product-details-1-4/product-1-4.png', 0, 1),
-- Áo 5
('A05H01', 'A05', N'assets/img/product-details/product-details-1-5/product-1-1.png', 1, 1),
('A05H02', 'A05', N'assets/img/product-details/product-details-1-5/product-1-2.png', 0, 1),
('A05H03', 'A05', N'assets/img/product-details/product-details-1-5/product-1-3.png', 0, 1),
('A05H04', 'A05', N'assets/img/product-details/product-details-1-5/product-1-4.png', 0, 1),
-- Áo 6
('A06H01', 'A06', N'assets/img/product-details/product-details-1-6/product-1-1.png', 1, 1),
('A06H02', 'A06', N'assets/img/product-details/product-details-1-6/product-1-2.png', 0, 1),
('A06H03', 'A06', N'assets/img/product-details/product-details-1-6/product-1-3.png', 0, 1),
('A06H04', 'A06', N'assets/img/product-details/product-details-1-6/product-1-4.png', 0, 1),
-- Áo 7
('A07H01', 'A07', N'assets/img/product-details/product-details-1-7/product-1-1.png', 1, 1),
('A07H02', 'A07', N'assets/img/product-details/product-details-1-7/product-1-2.png', 0, 1),
('A07H03', 'A07', N'assets/img/product-details/product-details-1-7/product-1-3.png', 0, 1),
('A07H04', 'A07', N'assets/img/product-details/product-details-1-7/product-1-4.png', 0, 1),
-- Áo 8
('A08H01', 'A08', N'assets/img/product-details/product-details-1-8/product-1-1.png', 1, 1),
('A08H02', 'A08', N'assets/img/product-details/product-details-1-8/product-1-2.png', 0, 1),
('A08H03', 'A08', N'assets/img/product-details/product-details-1-8/product-1-3.png', 0, 1),
('A08H04', 'A08', N'assets/img/product-details/product-details-1-8/product-1-4.png', 0, 1),
-- Áo 9
('A09H01', 'A09', N'assets/img/product-details/product-details-1-9/product-1-1.png', 1, 1),
('A09H02', 'A09', N'assets/img/product-details/product-details-1-9/product-1-2.png', 0, 1),
('A09H03', 'A09', N'assets/img/product-details/product-details-1-9/product-1-3.png', 0, 1),
('A09H04', 'A09', N'assets/img/product-details/product-details-1-9/product-1-4.png', 0, 1),
-- Áo 10
('A10H01', 'A10', N'assets/img/product-details/product-details-1-10/product-1-1.png', 1, 1),
('A10H02', 'A10', N'assets/img/product-details/product-details-1-10/product-1-2.png', 0, 1),
('A10H03', 'A10', N'assets/img/product-details/product-details-1-10/product-1-3.png', 0, 1),
('A10H04', 'A10', N'assets/img/product-details/product-details-1-10/product-1-4.png', 0, 1),
-- Áo 11
('A11H01', 'A11', N'assets/img/product-details/product-details-1-11/product-1-1.png', 1, 1),
('A11H02', 'A11', N'assets/img/product-details/product-details-1-11/product-1-2.png', 0, 1),
('A11H03', 'A11', N'assets/img/product-details/product-details-1-11/product-1-3.png', 0, 1),
('A11H04', 'A11', N'assets/img/product-details/product-details-1-11/product-1-4.png', 0, 1),
-- Áo 12
('A12H01', 'A12', N'assets/img/product-details/product-details-1-12/product-1-1.png', 1, 1),
('A12H02', 'A12', N'assets/img/product-details/product-details-1-12/product-1-2.png', 0, 1),
('A12H03', 'A12', N'assets/img/product-details/product-details-1-12/product-1-3.png', 0, 1),
('A12H04', 'A12', N'assets/img/product-details/product-details-1-12/product-1-4.png', 0, 1),
-- Áo 13
('A13H01', 'A13', N'assets/img/product-details/product-details-1-13/product-1-1.png', 1, 1),
('A13H02', 'A13', N'assets/img/product-details/product-details-1-13/product-1-2.png', 0, 1),
('A13H03', 'A13', N'assets/img/product-details/product-details-1-13/product-1-3.png', 0, 1),
('A13H04', 'A13', N'assets/img/product-details/product-details-1-13/product-1-4.png', 0, 1),
-- Áo 14
('A14H01', 'A14', N'assets/img/product-details/product-details-1-14/product-1-1.png', 1, 1),
('A14H02', 'A14', N'assets/img/product-details/product-details-1-14/product-1-2.png', 0, 1),
('A14H03', 'A14', N'assets/img/product-details/product-details-1-14/product-1-3.png', 0, 1),
('A14H04', 'A14', N'assets/img/product-details/product-details-1-14/product-1-4.png', 0, 1),
-- Áo 15
('A15H01', 'A15', N'assets/img/product-details/product-details-1-15/product-1-1.png', 1, 1),
('A15H02', 'A15', N'assets/img/product-details/product-details-1-15/product-1-2.png', 0, 1),
('A15H03', 'A15', N'assets/img/product-details/product-details-1-15/product-1-3.png', 0, 1),
('A15H04', 'A15', N'assets/img/product-details/product-details-1-15/product-1-4.png', 0, 1),
-- Áo 16
('A16H01', 'A16', N'assets/img/product-details/product-details-1-16/product-1-1.png', 1, 1),
('A16H02', 'A16', N'assets/img/product-details/product-details-1-16/product-1-2.png', 0, 1),
('A16H03', 'A16', N'assets/img/product-details/product-details-1-16/product-1-3.png', 0, 1),
('A16H04', 'A16', N'assets/img/product-details/product-details-1-16/product-1-4.png', 0, 1),
-- Quần 1
('Q01H01', 'Q01', N'assets/img/product-details/product-details-2-1/product-2-1.png', 1, 1),
('Q01H02', 'Q01', N'assets/img/product-details/product-details-2-1/product-2-2.png', 0, 1),
('Q01H03', 'Q01', N'assets/img/product-details/product-details-2-1/product-2-3.png', 0, 1),
('Q01H04', 'Q01', N'assets/img/product-details/product-details-2-1/product-2-4.png', 0, 1),
-- Quần 2
('Q02H01', 'Q02', N'assets/img/product-details/product-details-2-2/product-2-1.png', 1, 1),
('Q02H02', 'Q02', N'assets/img/product-details/product-details-2-2/product-2-2.png', 0, 1),
('Q02H03', 'Q02', N'assets/img/product-details/product-details-2-2/product-2-3.png', 0, 1),
('Q02H04', 'Q02', N'assets/img/product-details/product-details-2-2/product-2-4.png', 0, 1),
-- Quần 3
('Q03H01', 'Q03', N'assets/img/product-details/product-details-2-3/product-2-1.png', 1, 1),
('Q03H02', 'Q03', N'assets/img/product-details/product-details-2-3/product-2-2.png', 0, 1),
('Q03H03', 'Q03', N'assets/img/product-details/product-details-2-3/product-2-3.png', 0, 1),
('Q03H04', 'Q03', N'assets/img/product-details/product-details-2-3/product-2-4.png', 0, 1),
-- Quần 4
('Q04H01', 'Q04', N'assets/img/product-details/product-details-2-4/product-2-1.png', 1, 1),
('Q04H02', 'Q04', N'assets/img/product-details/product-details-2-4/product-2-2.png', 0, 1),
('Q04H03', 'Q04', N'assets/img/product-details/product-details-2-4/product-2-3.png', 0, 1),
('Q04H04', 'Q04', N'assets/img/product-details/product-details-2-4/product-2-4.png', 0, 1),
-- Quần 5
('Q05H01', 'Q05', N'assets/img/product-details/product-details-2-5/product-2-1.png', 1, 1),
('Q05H02', 'Q05', N'assets/img/product-details/product-details-2-5/product-2-2.png', 0, 1),
('Q05H03', 'Q05', N'assets/img/product-details/product-details-2-5/product-2-3.png', 0, 1),
('Q05H04', 'Q05', N'assets/img/product-details/product-details-2-5/product-2-4.png', 0, 1),
-- Quần 6
('Q06H01', 'Q06', N'assets/img/product-details/product-details-2-6/product-2-1.png', 1, 1),
('Q06H02', 'Q06', N'assets/img/product-details/product-details-2-6/product-2-2.png', 0, 1),
('Q06H03', 'Q06', N'assets/img/product-details/product-details-2-6/product-2-3.png', 0, 1),
('Q06H04', 'Q06', N'assets/img/product-details/product-details-2-6/product-2-4.png', 0, 1),
-- Quần 7
('Q07H01', 'Q07', N'assets/img/product-details/product-details-2-7/product-2-1.png', 1, 1),
('Q07H02', 'Q07', N'assets/img/product-details/product-details-2-7/product-2-2.png', 0, 1),
('Q07H03', 'Q07', N'assets/img/product-details/product-details-2-7/product-2-3.png', 0, 1),
('Q07H04', 'Q07', N'assets/img/product-details/product-details-2-7/product-2-4.png', 0, 1),
-- Quần 8
('Q08H01', 'Q08', N'assets/img/product-details/product-details-2-8/product-2-1.png', 1, 1),
('Q08H02', 'Q08', N'assets/img/product-details/product-details-2-8/product-2-2.png', 0, 1),
('Q08H03', 'Q08', N'assets/img/product-details/product-details-2-8/product-2-3.png', 0, 1),
('Q08H04', 'Q08', N'assets/img/product-details/product-details-2-8/product-2-4.png', 0, 1),
-- Quần 9
('Q09H01', 'Q09', N'assets/img/product-details/product-details-2-9/product-2-1.png', 1, 1),
('Q09H02', 'Q09', N'assets/img/product-details/product-details-2-9/product-2-2.png', 0, 1),
('Q09H03', 'Q09', N'assets/img/product-details/product-details-2-9/product-2-3.png', 0, 1),
('Q09H04', 'Q09', N'assets/img/product-details/product-details-2-9/product-2-4.png', 0, 1),
-- Quần 10
('Q10H01', 'Q10', N'assets/img/product-details/product-details-2-10/product-2-1.png', 1, 1),
('Q10H02', 'Q10', N'assets/img/product-details/product-details-2-10/product-2-2.png', 0, 1),
('Q10H03', 'Q10', N'assets/img/product-details/product-details-2-10/product-2-3.png', 0, 1),
('Q10H04', 'Q10', N'assets/img/product-details/product-details-2-10/product-2-4.png', 0, 1),
-- Quần 11
('Q11H01', 'Q11', N'assets/img/product-details/product-details-2-11/product-2-1.png', 1, 1),
('Q11H02', 'Q11', N'assets/img/product-details/product-details-2-11/product-2-2.png', 0, 1),
('Q11H03', 'Q11', N'assets/img/product-details/product-details-2-11/product-2-3.png', 0, 1),
('Q11H04', 'Q11', N'assets/img/product-details/product-details-2-11/product-2-4.png', 0, 1),
-- Quần 12
('Q12H01', 'Q12', N'assets/img/product-details/product-details-2-12/product-2-1.png', 1, 1),
('Q12H02', 'Q12', N'assets/img/product-details/product-details-2-12/product-2-2.png', 0, 1),
('Q12H03', 'Q12', N'assets/img/product-details/product-details-2-12/product-2-3.png', 0, 1),
('Q12H04', 'Q12', N'assets/img/product-details/product-details-2-12/product-2-4.png', 0, 1),
-- Quần 13
('Q13H01', 'Q13', N'assets/img/product-details/product-details-2-13/product-2-1.png', 1, 1),
('Q13H02', 'Q13', N'assets/img/product-details/product-details-2-13/product-2-2.png', 0, 1),
('Q13H03', 'Q13', N'assets/img/product-details/product-details-2-13/product-2-3.png', 0, 1),
('Q13H04', 'Q13', N'assets/img/product-details/product-details-2-13/product-2-4.png', 0, 1),
-- Quần 14
('Q14H01', 'Q14', N'assets/img/product-details/product-details-2-14/product-2-1.png', 1, 1),
('Q14H02', 'Q14', N'assets/img/product-details/product-details-2-14/product-2-2.png', 0, 1),
('Q14H03', 'Q14', N'assets/img/product-details/product-details-2-14/product-2-3.png', 0, 1),
('Q14H04', 'Q14', N'assets/img/product-details/product-details-2-14/product-2-4.png', 0, 1),
-- Quần 15
('Q15H01', 'Q15', N'assets/img/product-details/product-details-2-15/product-2-1.png', 1, 1),
('Q15H02', 'Q15', N'assets/img/product-details/product-details-2-15/product-2-2.png', 0, 1),
('Q15H03', 'Q15', N'assets/img/product-details/product-details-2-15/product-2-3.png', 0, 1),
('Q15H04', 'Q15', N'assets/img/product-details/product-details-2-15/product-2-4.png', 0, 1),
-- Quần 16
('Q16H01', 'Q16', N'assets/img/product-details/product-details-2-16/product-2-1.png', 1, 1),
('Q16H02', 'Q16', N'assets/img/product-details/product-details-2-16/product-2-2.png', 0, 1),
('Q16H03', 'Q16', N'assets/img/product-details/product-details-2-16/product-2-3.png', 0, 1),
('Q16H04', 'Q16', N'assets/img/product-details/product-details-2-16/product-2-4.png', 0, 1),
-- Giày 1
('G01H01', 'G01', N'assets/img/product-details/product-details-3-1/product-3-1.png', 1, 1),
('G01H02', 'G01', N'assets/img/product-details/product-details-3-1/product-3-2.png', 0, 1),
('G01H03', 'G01', N'assets/img/product-details/product-details-3-1/product-3-3.png', 0, 1),
('G01H04', 'G01', N'assets/img/product-details/product-details-3-1/product-3-4.png', 0, 1),
-- Giày 2
('G02H01', 'G02', N'assets/img/product-details/product-details-3-2/product-3-1.png', 1, 1),
('G02H02', 'G02', N'assets/img/product-details/product-details-3-2/product-3-2.png', 0, 1),
('G02H03', 'G02', N'assets/img/product-details/product-details-3-2/product-3-3.png', 0, 1),
('G02H04', 'G02', N'assets/img/product-details/product-details-3-2/product-3-4.png', 0, 1),
-- Giày 3
('G03H01', 'G03', N'assets/img/product-details/product-details-3-3/product-3-1.png', 1, 1),
('G03H02', 'G03', N'assets/img/product-details/product-details-3-3/product-3-2.png', 0, 1),
('G03H03', 'G03', N'assets/img/product-details/product-details-3-3/product-3-3.png', 0, 1),
('G03H04', 'G03', N'assets/img/product-details/product-details-3-3/product-3-4.png', 0, 1),
-- Giày 4
('G04H01', 'G04', N'assets/img/product-details/product-details-3-4/product-3-1.png', 1, 1),
('G04H02', 'G04', N'assets/img/product-details/product-details-3-4/product-3-2.png', 0, 1),
('G04H03', 'G04', N'assets/img/product-details/product-details-3-4/product-3-3.png', 0, 1),
('G04H04', 'G04', N'assets/img/product-details/product-details-3-4/product-3-4.png', 0, 1),
-- Giày 5
('G05H01', 'G05', N'assets/img/product-details/product-details-3-5/product-3-1.png', 1, 1),
('G05H02', 'G05', N'assets/img/product-details/product-details-3-5/product-3-2.png', 0, 1),
('G05H03', 'G05', N'assets/img/product-details/product-details-3-5/product-3-3.png', 0, 1),
('G05H04', 'G05', N'assets/img/product-details/product-details-3-5/product-3-4.png', 0, 1),
-- Giày 6
('G06H01', 'G06', N'assets/img/product-details/product-details-3-6/product-3-1.png', 1, 1),
('G06H02', 'G06', N'assets/img/product-details/product-details-3-6/product-3-2.png', 0, 1),
('G06H03', 'G06', N'assets/img/product-details/product-details-3-6/product-3-3.png', 0, 1),
('G06H04', 'G06', N'assets/img/product-details/product-details-3-6/product-3-4.png', 0, 1),
-- Giày 7
('G07H01', 'G07', N'assets/img/product-details/product-details-3-7/product-3-1.png', 1, 1),
('G07H02', 'G07', N'assets/img/product-details/product-details-3-7/product-3-2.png', 0, 1),
('G07H03', 'G07', N'assets/img/product-details/product-details-3-7/product-3-3.png', 0, 1),
('G07H04', 'G07', N'assets/img/product-details/product-details-3-7/product-3-4.png', 0, 1),
-- Giày 8
('G08H01', 'G08', N'assets/img/product-details/product-details-3-8/product-3-1.png', 1, 1),
('G08H02', 'G08', N'assets/img/product-details/product-details-3-8/product-3-2.png', 0, 1),
('G08H03', 'G08', N'assets/img/product-details/product-details-3-8/product-3-3.png', 0, 1),
('G08H04', 'G08', N'assets/img/product-details/product-details-3-8/product-3-4.png', 0, 1),
-- Giày 9
('G09H01', 'G09', N'assets/img/product-details/product-details-3-9/product-3-1.png', 1, 1),
('G09H02', 'G09', N'assets/img/product-details/product-details-3-9/product-3-2.png', 0, 1),
('G09H03', 'G09', N'assets/img/product-details/product-details-3-9/product-3-3.png', 0, 1),
('G09H04', 'G09', N'assets/img/product-details/product-details-3-9/product-3-4.png', 0, 1),
-- Giày 10
('G10H01', 'G10', N'assets/img/product-details/product-details-3-10/product-3-1.png', 1, 1),
('G10H02', 'G10', N'assets/img/product-details/product-details-3-10/product-3-2.png', 0, 1),
('G10H03', 'G10', N'assets/img/product-details/product-details-3-10/product-3-3.png', 0, 1),
('G10H04', 'G10', N'assets/img/product-details/product-details-3-10/product-3-4.png', 0, 1),
-- Giày 11
('G11H01', 'G11', N'assets/img/product-details/product-details-3-11/product-3-1.png', 1, 1),
('G11H02', 'G11', N'assets/img/product-details/product-details-3-11/product-3-2.png', 0, 1),
('G11H03', 'G11', N'assets/img/product-details/product-details-3-11/product-3-3.png', 0, 1),
('G11H04', 'G11', N'assets/img/product-details/product-details-3-11/product-3-4.png', 0, 1),
-- Giày 12
('G12H01', 'G12', N'assets/img/product-details/product-details-3-12/product-3-1.png', 1, 1),
('G12H02', 'G12', N'assets/img/product-details/product-details-3-12/product-3-2.png', 0, 1),
('G12H03', 'G12', N'assets/img/product-details/product-details-3-12/product-3-3.png', 0, 1),
('G12H04', 'G12', N'assets/img/product-details/product-details-3-12/product-3-4.png', 0, 1),
-- Giày 13
('G13H01', 'G13', N'assets/img/product-details/product-details-3-13/product-3-1.png', 1, 1),
('G13H02', 'G13', N'assets/img/product-details/product-details-3-13/product-3-2.png', 0, 1),
('G13H03', 'G13', N'assets/img/product-details/product-details-3-13/product-3-3.png', 0, 1),
('G13H04', 'G13', N'assets/img/product-details/product-details-3-13/product-3-4.png', 0, 1),
-- Giày 14
('G14H01', 'G14', N'assets/img/product-details/product-details-3-14/product-3-1.png', 1, 1),
('G14H02', 'G14', N'assets/img/product-details/product-details-3-14/product-3-2.png', 0, 1),
('G14H03', 'G14', N'assets/img/product-details/product-details-3-14/product-3-3.png', 0, 1),
('G14H04', 'G14', N'assets/img/product-details/product-details-3-14/product-3-4.png', 0, 1),
-- Giày 15
('G15H01', 'G15', N'assets/img/product-details/product-details-3-15/product-3-1.png', 1, 1),
('G15H02', 'G15', N'assets/img/product-details/product-details-3-15/product-3-2.png', 0, 1),
('G15H03', 'G15', N'assets/img/product-details/product-details-3-15/product-3-3.png', 0, 1),
('G15H04', 'G15', N'assets/img/product-details/product-details-3-15/product-3-4.png', 0, 1),
-- Giày 16
('G16H01', 'G16', N'assets/img/product-details/product-details-3-16/product-3-1.png', 1, 1),
('G16H02', 'G16', N'assets/img/product-details/product-details-3-16/product-3-2.png', 0, 1),
('G16H03', 'G16', N'assets/img/product-details/product-details-3-16/product-3-3.png', 0, 1),
('G16H04', 'G16', N'assets/img/product-details/product-details-3-16/product-3-4.png', 0, 1);


-- Bảng MA_GIAM_GIA
INSERT INTO MA_GIAM_GIA (MaCode, GiaTri, LoaiGiamGia, SoLuong, TrangThai) VALUES 
('SAVE10', 10, 'percent', 8, 1),
('CASH5', 5000, 'cash', 3, 1),
('FREESHIP', 0, 'shipping', 10, 1),
('NEW25', 25, 'percent', 5, 1),
('CASH20', 20000, 'cash', 2, 1);


-- Bảng PHUONG_THUC_VAN_CHUYEN
INSERT INTO PHUONG_THUC_VAN_CHUYEN (MaPTVC, TenPTVC, GiaVanChuyen, TrangThai) VALUES 
('HT', N'Hỏa tốc', 30000, 1),
('BD', N'Bưu điện', 20000, 1);


-- Bảng GIO_HANG
INSERT INTO GIO_HANG (MaKH, MaCTSP, SoLuong) VALUES 
('KH001', 'CTA01SzM', 2), 
('KH001', 'CTQ05SzL', 1),  
('KH001', 'CTG02Sz38', 1), 
('KH001', 'CTA10SzXL', 3),  
('KH002', 'CTG10Sz40', 1), 
('KH002', 'CTQ16SzXL', 2), 
('KH002', 'CTA05SzS', 1),  
('KH003', 'CTA16SzL', 3),  
('KH003', 'CTQ01SzM', 2),
('KH003', 'CTG15Sz39', 1), 
('KH003', 'CTQ08SzXL', 1), 
('KH003', 'CTA02SzM', 2);


-- Bảng DON_HANG
INSERT INTO DON_HANG (MaDonHang, MaKH, MaNV, TenNguoiNhan, SoDienThoai, Email, MaCode, MaPTVC, NgayDat, NgayGiaoDuKien, DiaChiGiao, GhiChu, GiamGia, PhuongThucThanhToan, DaThanhToan, TrangThaiDonHang, TrangThai) VALUES 
-- 1. Thành viên (KH001)
('KH001DH001', 'KH001', NULL, N'Nguyễn Văn A', '0901234567', 'demo1@gmail.com', 'SAVE10', 'HT', '2025-11-20', '2025-11-23', N'123 Nguyễn Huệ, Quận 1, TP.HCM', N'Giao giờ hành chính', 75000, N'Thanh toán khi nhận hàng', 1, N'Hoàn tất', 1),
('KH001DH002', 'KH001', NULL, N'Nguyễn Văn A', '0901234567', 'demo1@gmail.com', 'CASH20', 'BD', '2025-12-08', '2025-12-11', N'123 Nguyễn Huệ, Quận 1, TP.HCM', NULL, 20000, N'Chuyển khoản', 1, N'Đang giao', 1),
('KH001DH003', 'KH001', NULL, N'Nguyễn Văn A', '0901234567', 'demo1@gmail.com', NULL, 'HT', '2025-12-11', '2025-12-14', N'45 Lê Lợi, Quận 1, TP.HCM', N'Gọi trước khi giao 30p', 0, N'Thẻ tín dụng/ghi nợ', 0, N'Chờ xác nhận', 1),
-- 2. Thành viên (KH002)
('KH002DH001', 'KH002', NULL, N'Trần Thị B', '0909888777', 'demo2@gmail.com', NULL, 'BD', '2025-11-15', '2025-11-19', N'88 Trần Hưng Đạo, Quận 5, TP.HCM', N'Giao buổi chiều', 0, N'Thanh toán khi nhận hàng', 0, N'Hủy', 1),
('KH002DH002', 'KH002', NULL, N'Trần Thị B', '0909888777', 'demo2@gmail.com', 'NEW25', 'HT', '2025-12-07', '2025-12-10', N'Số 9 đường 3/2, Quận 10, TP.HCM', NULL, 750000, N'Chuyển khoản', 1, N'Đang giao', 1),
-- 3. Thành viên (KH003)
('KH003DH001', 'KH003', NULL, N'Lê Văn C', '0912345678', 'demo3@gmail.com', 'CASH5', 'BD', '2025-10-30', '2025-11-03', N'Vinhome Central Park, Bình Thạnh', NULL, 5000, N'Thanh toán khi nhận hàng', 1, N'Hoàn tất', 1),
('KH003DH002', 'KH003', NULL, N'Lê Văn C', '0912345678', 'demo3@gmail.com', NULL, 'HT', '2025-11-10', '2025-11-14', N'Vinhome Central Park, Bình Thạnh', N'Gửi ở lễ tân tòa nhà', 0, N'Thẻ tín dụng/ghi nợ', 1, N'Hoàn tất', 1),
('KH003DH003', 'KH003', NULL, N'Lê Văn C', '0912345678', 'demo3@gmail.com', 'NEW25', 'BD', '2025-12-10', '2025-12-13', N'Tòa nhà Bitexco, Quận 1, TP.HCM', NULL, 250000, N'Chuyển khoản', 1, N'Chờ xác nhận', 1),
('KH003DH004', 'KH003', NULL, N'Lê Văn C', '0912345678', 'demo3@gmail.com', NULL, 'BD', '2025-12-01', '2025-12-05', N'Vinhome Central Park, Bình Thạnh', NULL, 0, N'Thanh toán khi nhận hàng', 0, N'Hủy', 1),
-- 4. Khách vãng lai (GUEST)
('GUESTDH001', NULL, NULL, N'Phạm Khách Lạ', '0999111222', 'guest1@email.com', NULL, 'HT', '2025-12-20', '2025-12-21', N'100 Pasteur, Quận 1, TP.HCM', N'Nhà trong hẻm nhỏ', 0, N'Thanh toán khi nhận hàng', 0, N'Chờ xác nhận', 1),
('GUESTDH002', NULL, NULL, N'Hoàng Vãng Lai', '0888555666', 'guest2@email.com', 'SAVE10', 'BD', '2025-12-21', '2025-12-25', N'200 Võ Văn Kiệt, Quận 1, TP.HCM', NULL, 35000, N'Chuyển khoản', 1, N'Đang giao', 1),
('GUESTDH003', NULL, NULL, N'Trần Văn Khách', '0912345678', 'guest3@email.com', NULL, 'HT', '2025-11-01', '2025-11-04', N'123 Đường Láng, Hà Nội', N'Giao hàng nhanh giúp mình', 0, N'Thanh toán khi nhận hàng', 1, N'Hoàn tất', 1),
('GUESTDH004', NULL, NULL, N'Lê Thị Vãng', '0987654321', 'guest4@email.com', NULL, 'BD', '2025-12-05', '2025-12-09', N'456 Lê Duẩn, Đà Nẵng', NULL, 0, N'Chuyển khoản', 0, N'Hủy', 1);


-- Bảng CHI_TIET_DON_HANG
INSERT INTO CHI_TIET_DON_HANG (MaDonHang, MaCTSP, SoLuong, DonGia, TrangThai) VALUES 
-- 1. Thành viên (KH001)
('KH001DH001', 'CTG01Sz38', 1, 750000, 1),
('KH001DH002', 'CTG02Sz40', 1, 1200000, 1),
('KH001DH002', 'CTQ01SzL', 1, 400000, 1),
('KH001DH003', 'CTG04Sz42', 1, 1100000, 1),
('KH001DH003', 'CTQ01SzS', 2, 400000, 1),
('KH001DH003', 'CTQ15SzM', 1, 200000, 1),
-- 2. Thành viên (KH002)
('KH002DH001', 'CTG08Sz44', 1, 900000, 1), 
('KH002DH002', 'CTG07Sz38', 1, 1300000, 1),
('KH002DH002', 'CTG14Sz40', 1, 1100000, 1), 
('KH002DH002', 'CTQ05SzL', 2, 300000, 1),
-- 3. Thành viên (KH003)
('KH003DH001', 'CTG01Sz40', 2, 750000, 1), 
('KH003DH002', 'CTG03Sz42', 1, 850000, 1), 
('KH003DH003', 'CTG12Sz45', 2, 1250000, 1), 
('KH003DH004', 'CTA02SzS', 2, 250000, 1),
-- 4. Khách vãng lai (GUEST)
('GUESTDH001', 'CTA06SzM', 1, 380000, 1),
('GUESTDH001', 'CTQ09SzL', 1, 360000, 1),
('GUESTDH002', 'CTG05Sz41', 1, 350000, 1),
('GUESTDH003', 'CTA01SzL', 2, 150000, 1),
('GUESTDH003', 'CTQ02SzM', 1, 180000, 1),
('GUESTDH004', 'CTG01Sz40', 1, 750000, 1);


-- Bảng DANH_GIA
INSERT INTO DANH_GIA (MaDanhGia, MaSP, MaKH, TenKhachHang, SoSao, NoiDung, TrangThai) VALUES 
-- Áo 1
('A01DG001', 'A01', NULL, N'Nguyễn Văn A', 3, N'Không như mong đợi lắm.', 1),
('A01DG002', 'A01', NULL, N'Trịnh Văn I', 3, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('A01DG003', 'A01', NULL, N'Đỗ Văn G', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('A01DG004', 'A01', NULL, N'Lê Văn C', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('A01DG005', 'A01', NULL, N'Hoàng Văn E', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('A01DG006', 'A01', NULL, N'Trần Thị B', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
-- Áo 2
('A02DG001', 'A02', NULL, N'Lê Văn C', 4, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('A02DG002', 'A02', NULL, N'Nguyễn Văn A', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('A02DG003', 'A02', NULL, N'Lê Văn C', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('A02DG004', 'A02', NULL, N'Đỗ Văn G', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('A02DG005', 'A02', NULL, N'Lý Thị H', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('A02DG006', 'A02', NULL, N'Nguyễn Văn A', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('A02DG007', 'A02', NULL, N'Trịnh Văn I', 3, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('A02DG008', 'A02', NULL, N'Bùi Thị J', 4, N'Chưa dùng thử nhưng thấy ổn.', 1),
-- Áo 3
('A03DG001', 'A03', NULL, N'Trần Thị B', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
-- Áo 4
('A04DG001', 'A04', NULL, N'Hoàng Văn E', 3, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('A04DG002', 'A04', NULL, N'Đỗ Văn G', 3, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('A04DG003', 'A04', NULL, N'Phạm Thị D', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('A04DG004', 'A04', NULL, N'Trịnh Văn I', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('A04DG005', 'A04', NULL, N'Lê Văn C', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('A04DG006', 'A04', NULL, N'Hoàng Văn E', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('A04DG007', 'A04', NULL, N'Lý Thị H', 3, N'Không như mong đợi lắm.', 1),
-- Áo 5
('A05DG001', 'A05', NULL, N'Bùi Thị J', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('A05DG002', 'A05', NULL, N'Phạm Thị D', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('A05DG003', 'A05', NULL, N'Trịnh Văn I', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('A05DG004', 'A05', NULL, N'Bùi Thị J', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('A05DG005', 'A05', NULL, N'Lý Thị H', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('A05DG006', 'A05', NULL, N'Hoàng Văn E', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('A05DG007', 'A05', NULL, N'Hoàng Văn E', 4, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('A05DG008', 'A05', NULL, N'Phạm Thị D', 4, N'Chưa dùng thử nhưng thấy ổn.', 1),
('A05DG009', 'A05', NULL, N'Trần Thị B', 3, N'Không như mong đợi lắm.', 1),
('A05DG010', 'A05', NULL, N'Hoàng Văn E', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
-- Áo 6
('A06DG001', 'A06', NULL, N'Vũ Thị F', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('A06DG002', 'A06', NULL, N'Hoàng Văn E', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('A06DG003', 'A06', NULL, N'Trịnh Văn I', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('A06DG004', 'A06', NULL, N'Lê Văn C', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('A06DG005', 'A06', NULL, N'Lý Thị H', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
-- Áo 7
('A07DG001', 'A07', NULL, N'Hoàng Văn E', 4, N'Chưa dùng thử nhưng thấy ổn.', 1),
('A07DG002', 'A07', NULL, N'Trần Thị B', 3, N'Chưa dùng thử nhưng thấy ổn.', 1),
('A07DG003', 'A07', NULL, N'Phạm Thị D', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('A07DG004', 'A07', NULL, N'Hoàng Văn E', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('A07DG005', 'A07', NULL, N'Nguyễn Văn A', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
-- Áo 8
('A08DG001', 'A08', NULL, N'Đỗ Văn G', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('A08DG002', 'A08', NULL, N'Hoàng Văn E', 3, N'Chưa dùng thử nhưng thấy ổn.', 1),
('A08DG003', 'A08', NULL, N'Lê Văn C', 4, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('A08DG004', 'A08', NULL, N'Vũ Thị F', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('A08DG005', 'A08', NULL, N'Trần Thị B', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('A08DG006', 'A08', NULL, N'Vũ Thị F', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('A08DG007', 'A08', NULL, N'Trần Thị B', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('A08DG008', 'A08', NULL, N'Vũ Thị F', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
-- Áo 9
('A09DG001', 'A09', NULL, N'Đỗ Văn G', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('A09DG002', 'A09', NULL, N'Bùi Thị J', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('A09DG003', 'A09', NULL, N'Phạm Thị D', 3, N'Chưa dùng thử nhưng thấy ổn.', 1),
-- Áo 10
('A10DG001', 'A10', NULL, N'Bùi Thị J', 4, N'Không như mong đợi lắm.', 1),
('A10DG002', 'A10', NULL, N'Lý Thị H', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
-- Áo 11
('A11DG001', 'A11', NULL, N'Vũ Thị F', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('A11DG002', 'A11', NULL, N'Lý Thị H', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
-- Áo 12
('A12DG001', 'A12', NULL, N'Lê Văn C', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('A12DG002', 'A12', NULL, N'Phạm Thị D', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('A12DG003', 'A12', NULL, N'Trịnh Văn I', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('A12DG004', 'A12', NULL, N'Phạm Thị D', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('A12DG005', 'A12', NULL, N'Lý Thị H', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('A12DG006', 'A12', NULL, N'Nguyễn Văn A', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('A12DG007', 'A12', NULL, N'Nguyễn Văn A', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('A12DG008', 'A12', NULL, N'Trịnh Văn I', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('A12DG009', 'A12', NULL, N'Bùi Thị J', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
-- Áo 13
('A13DG001', 'A13', NULL, N'Vũ Thị F', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('A13DG002', 'A13', NULL, N'Bùi Thị J', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
-- Áo 14
('A14DG001', 'A14', NULL, N'Lê Văn C', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('A14DG002', 'A14', NULL, N'Hoàng Văn E', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
-- Áo 15
('A15DG001', 'A15', NULL, N'Phạm Thị D', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('A15DG002', 'A15', NULL, N'Lê Văn C', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
-- Áo 16
('A16DG001', 'A16', NULL, N'Vũ Thị F', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('A16DG002', 'A16', NULL, N'Trần Thị B', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('A16DG003', 'A16', NULL, N'Trịnh Văn I', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('A16DG004', 'A16', NULL, N'Bùi Thị J', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
-- Quần 1
('Q01DG001', 'Q01', NULL, N'Trần Thị B', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('Q01DG002', 'Q01', NULL, N'Bùi Thị J', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('Q01DG003', 'Q01', NULL, N'Vũ Thị F', 4, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('Q01DG004', 'Q01', NULL, N'Lý Thị H', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('Q01DG005', 'Q01', NULL, N'Phạm Thị D', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('Q01DG006', 'Q01', NULL, N'Vũ Thị F', 3, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('Q01DG007', 'Q01', NULL, N'Vũ Thị F', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
-- Quần 2
('Q02DG001', 'Q02', NULL, N'Phạm Thị D', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q02DG002', 'Q02', NULL, N'Trần Thị B', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('Q02DG003', 'Q02', NULL, N'Lý Thị H', 3, N'Không như mong đợi lắm.', 1),
-- Quần 3
('Q03DG001', 'Q03', NULL, N'Trịnh Văn I', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
-- Quần 4
('Q04DG001', 'Q04', NULL, N'Hoàng Văn E', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('Q04DG002', 'Q04', NULL, N'Bùi Thị J', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('Q04DG003', 'Q04', NULL, N'Trần Thị B', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('Q04DG004', 'Q04', NULL, N'Lê Văn C', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('Q04DG005', 'Q04', NULL, N'Bùi Thị J', 4, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('Q04DG006', 'Q04', NULL, N'Lê Văn C', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('Q04DG007', 'Q04', NULL, N'Vũ Thị F', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('Q04DG008', 'Q04', NULL, N'Lê Văn C', 3, N'Chưa dùng thử nhưng thấy ổn.', 1),
('Q04DG009', 'Q04', NULL, N'Trịnh Văn I', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
-- Quần 5
('Q05DG001', 'Q05', NULL, N'Hoàng Văn E', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('Q05DG002', 'Q05', NULL, N'Phạm Thị D', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q05DG003', 'Q05', NULL, N'Bùi Thị J', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('Q05DG004', 'Q05', NULL, N'Lý Thị H', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q05DG005', 'Q05', NULL, N'Bùi Thị J', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q05DG006', 'Q05', NULL, N'Bùi Thị J', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
-- Quần 6
('Q06DG001', 'Q06', NULL, N'Hoàng Văn E', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('Q06DG002', 'Q06', NULL, N'Nguyễn Văn A', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('Q06DG003', 'Q06', NULL, N'Vũ Thị F', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('Q06DG004', 'Q06', NULL, N'Vũ Thị F', 3, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('Q06DG005', 'Q06', NULL, N'Trịnh Văn I', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('Q06DG006', 'Q06', NULL, N'Lê Văn C', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('Q06DG007', 'Q06', NULL, N'Trần Thị B', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('Q06DG008', 'Q06', NULL, N'Hoàng Văn E', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
-- Quần 7
('Q07DG001', 'Q07', NULL, N'Nguyễn Văn A', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('Q07DG002', 'Q07', NULL, N'Hoàng Văn E', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('Q07DG003', 'Q07', NULL, N'Trần Thị B', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('Q07DG004', 'Q07', NULL, N'Lý Thị H', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('Q07DG005', 'Q07', NULL, N'Trịnh Văn I', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q07DG006', 'Q07', NULL, N'Phạm Thị D', 4, N'Không như mong đợi lắm.', 1),
('Q07DG007', 'Q07', NULL, N'Nguyễn Văn A', 4, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('Q07DG008', 'Q07', NULL, N'Phạm Thị D', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('Q07DG009', 'Q07', NULL, N'Phạm Thị D', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q07DG010', 'Q07', NULL, N'Lê Văn C', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
-- Quần 8
('Q08DG001', 'Q08', NULL, N'Vũ Thị F', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('Q08DG002', 'Q08', NULL, N'Trịnh Văn I', 3, N'Không như mong đợi lắm.', 1),
('Q08DG003', 'Q08', NULL, N'Lý Thị H', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('Q08DG004', 'Q08', NULL, N'Lý Thị H', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('Q08DG005', 'Q08', NULL, N'Hoàng Văn E', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('Q08DG006', 'Q08', NULL, N'Vũ Thị F', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q08DG007', 'Q08', NULL, N'Trịnh Văn I', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('Q08DG008', 'Q08', NULL, N'Trần Thị B', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
-- Quần 9
('Q09DG001', 'Q09', NULL, N'Trần Thị B', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('Q09DG002', 'Q09', NULL, N'Lý Thị H', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q09DG003', 'Q09', NULL, N'Vũ Thị F', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
-- Quần 10
('Q10DG001', 'Q10', NULL, N'Hoàng Văn E', 3, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('Q10DG002', 'Q10', NULL, N'Phạm Thị D', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('Q10DG003', 'Q10', NULL, N'Trần Thị B', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('Q10DG004', 'Q10', NULL, N'Vũ Thị F', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('Q10DG005', 'Q10', NULL, N'Bùi Thị J', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q10DG006', 'Q10', NULL, N'Bùi Thị J', 4, N'Không như mong đợi lắm.', 1),
-- Quần 11
('Q11DG001', 'Q11', NULL, N'Trịnh Văn I', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q11DG002', 'Q11', NULL, N'Đỗ Văn G', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('Q11DG003', 'Q11', NULL, N'Phạm Thị D', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('Q11DG004', 'Q11', NULL, N'Trịnh Văn I', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('Q11DG005', 'Q11', NULL, N'Trần Thị B', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('Q11DG006', 'Q11', NULL, N'Phạm Thị D', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q11DG007', 'Q11', NULL, N'Vũ Thị F', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('Q11DG008', 'Q11', NULL, N'Phạm Thị D', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('Q11DG009', 'Q11', NULL, N'Trịnh Văn I', 4, N'Chưa dùng thử nhưng thấy ổn.', 1),
('Q11DG010', 'Q11', NULL, N'Nguyễn Văn A', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
-- Quần 12
('Q12DG001', 'Q12', NULL, N'Bùi Thị J', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q12DG002', 'Q12', NULL, N'Vũ Thị F', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('Q12DG003', 'Q12', NULL, N'Phạm Thị D', 3, N'Chưa dùng thử nhưng thấy ổn.', 1),
-- Quần 13
('Q13DG001', 'Q13', NULL, N'Trịnh Văn I', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('Q13DG002', 'Q13', NULL, N'Đỗ Văn G', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('Q13DG003', 'Q13', NULL, N'Lê Văn C', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('Q13DG004', 'Q13', NULL, N'Nguyễn Văn A', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
-- Quần 14
('Q14DG001', 'Q14', NULL, N'Trần Thị B', 3, N'Chưa dùng thử nhưng thấy ổn.', 1),
('Q14DG002', 'Q14', NULL, N'Phạm Thị D', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('Q14DG003', 'Q14', NULL, N'Trần Thị B', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q14DG004', 'Q14', NULL, N'Bùi Thị J', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('Q14DG005', 'Q14', NULL, N'Hoàng Văn E', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('Q14DG006', 'Q14', NULL, N'Hoàng Văn E', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('Q14DG007', 'Q14', NULL, N'Lê Văn C', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('Q14DG008', 'Q14', NULL, N'Trần Thị B', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('Q14DG009', 'Q14', NULL, N'Đỗ Văn G', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
-- Quần 15
('Q15DG001', 'Q15', NULL, N'Bùi Thị J', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('Q15DG002', 'Q15', NULL, N'Bùi Thị J', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('Q15DG003', 'Q15', NULL, N'Hoàng Văn E', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('Q15DG004', 'Q15', NULL, N'Vũ Thị F', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('Q15DG005', 'Q15', NULL, N'Lê Văn C', 3, N'Chưa dùng thử nhưng thấy ổn.', 1),
('Q15DG006', 'Q15', NULL, N'Đỗ Văn G', 4, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('Q15DG007', 'Q15', NULL, N'Phạm Thị D', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
-- Quần 16
('Q16DG001', 'Q16', NULL, N'Hoàng Văn E', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q16DG002', 'Q16', NULL, N'Đỗ Văn G', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('Q16DG003', 'Q16', NULL, N'Vũ Thị F', 4, N'Không như mong đợi lắm.', 1),
('Q16DG004', 'Q16', NULL, N'Lý Thị H', 3, N'Chưa dùng thử nhưng thấy ổn.', 1),
('Q16DG005', 'Q16', NULL, N'Vũ Thị F', 3, N'Chưa dùng thử nhưng thấy ổn.', 1),
('Q16DG006', 'Q16', NULL, N'Phạm Thị D', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('Q16DG007', 'Q16', NULL, N'Đỗ Văn G', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('Q16DG008', 'Q16', NULL, N'Lý Thị H', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
-- Giày 1
('G01DG001', 'G01', NULL, N'Hoàng Văn E', 3, N'Không như mong đợi lắm.', 1),
('G01DG002', 'G01', NULL, N'Bùi Thị J', 4, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('G01DG003', 'G01', NULL, N'Nguyễn Văn A', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('G01DG004', 'G01', NULL, N'Vũ Thị F', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('G01DG005', 'G01', NULL, N'Nguyễn Văn A', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('G01DG006', 'G01', NULL, N'Lý Thị H', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('G01DG007', 'G01', NULL, N'Trần Thị B', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('G01DG008', 'G01', NULL, N'Lê Văn C', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
-- Giày 2
('G02DG001', 'G02', NULL, N'Trần Thị B', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('G02DG002', 'G02', NULL, N'Lê Văn C', 3, N'Không như mong đợi lắm.', 1),
('G02DG003', 'G02', NULL, N'Nguyễn Văn A', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('G02DG004', 'G02', NULL, N'Hoàng Văn E', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('G02DG005', 'G02', NULL, N'Lê Văn C', 4, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('G02DG006', 'G02', NULL, N'Nguyễn Văn A', 4, N'Chưa dùng thử nhưng thấy ổn.', 1),
('G02DG007', 'G02', NULL, N'Nguyễn Văn A', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('G02DG008', 'G02', NULL, N'Lê Văn C', 4, N'Không như mong đợi lắm.', 1),
-- Giày 3
('G03DG001', 'G03', NULL, N'Đỗ Văn G', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('G03DG002', 'G03', NULL, N'Bùi Thị J', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
-- Giày 4
('G04DG001', 'G04', NULL, N'Vũ Thị F', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('G04DG002', 'G04', NULL, N'Phạm Thị D', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('G04DG003', 'G04', NULL, N'Trịnh Văn I', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('G04DG004', 'G04', NULL, N'Lê Văn C', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('G04DG005', 'G04', NULL, N'Hoàng Văn E', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
-- Giày 5
('G05DG001', 'G05', NULL, N'Lê Văn C', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('G05DG002', 'G05', NULL, N'Nguyễn Văn A', 3, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('G05DG003', 'G05', NULL, N'Đỗ Văn G', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('G05DG004', 'G05', NULL, N'Phạm Thị D', 3, N'Không như mong đợi lắm.', 1),
('G05DG005', 'G05', NULL, N'Nguyễn Văn A', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('G05DG006', 'G05', NULL, N'Hoàng Văn E', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('G05DG007', 'G05', NULL, N'Lý Thị H', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('G05DG008', 'G05', NULL, N'Nguyễn Văn A', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('G05DG009', 'G05', NULL, N'Nguyễn Văn A', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('G05DG010', 'G05', NULL, N'Đỗ Văn G', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
-- Giày 6
('G06DG001', 'G06', NULL, N'Lê Văn C', 3, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('G06DG002', 'G06', NULL, N'Trần Thị B', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('G06DG003', 'G06', NULL, N'Bùi Thị J', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
-- Giày 7
('G07DG001', 'G07', NULL, N'Bùi Thị J', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('G07DG002', 'G07', NULL, N'Vũ Thị F', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('G07DG003', 'G07', NULL, N'Trịnh Văn I', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('G07DG004', 'G07', NULL, N'Đỗ Văn G', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('G07DG005', 'G07', NULL, N'Lê Văn C', 4, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('G07DG006', 'G07', NULL, N'Lê Văn C', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('G07DG007', 'G07', NULL, N'Trịnh Văn I', 4, N'Chưa dùng thử nhưng thấy ổn.', 1),
('G07DG008', 'G07', NULL, N'Lý Thị H', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('G07DG009', 'G07', NULL, N'Hoàng Văn E', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
-- Giày 8
('G08DG001', 'G08', NULL, N'Đỗ Văn G', 3, N'Không như mong đợi lắm.', 1),
('G08DG002', 'G08', NULL, N'Lý Thị H', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('G08DG003', 'G08', NULL, N'Trần Thị B', 4, N'Không như mong đợi lắm.', 1),
('G08DG004', 'G08', NULL, N'Bùi Thị J', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
-- Giày 9
('G09DG001', 'G09', NULL, N'Trịnh Văn I', 3, N'Chưa dùng thử nhưng thấy ổn.', 1),
('G09DG002', 'G09', NULL, N'Vũ Thị F', 3, N'Không như mong đợi lắm.', 1),
-- Giày 10
('G10DG001', 'G10', NULL, N'Trần Thị B', 4, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('G10DG002', 'G10', NULL, N'Lê Văn C', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
-- Giày 11
('G11DG001', 'G11', NULL, N'Bùi Thị J', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('G11DG002', 'G11', NULL, N'Nguyễn Văn A', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('G11DG003', 'G11', NULL, N'Vũ Thị F', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('G11DG004', 'G11', NULL, N'Đỗ Văn G', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
-- Giày 12
('G12DG001', 'G12', NULL, N'Lý Thị H', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('G12DG002', 'G12', NULL, N'Vũ Thị F', 3, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('G12DG003', 'G12', NULL, N'Nguyễn Văn A', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('G12DG004', 'G12', NULL, N'Trịnh Văn I', 3, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('G12DG005', 'G12', NULL, N'Đỗ Văn G', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
-- Giày 13
('G13DG001', 'G13', NULL, N'Nguyễn Văn A', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('G13DG002', 'G13', NULL, N'Đỗ Văn G', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('G13DG003', 'G13', NULL, N'Phạm Thị D', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
-- Giày 14
('G14DG001', 'G14', NULL, N'Lý Thị H', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('G14DG002', 'G14', NULL, N'Lê Văn C', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('G14DG003', 'G14', NULL, N'Bùi Thị J', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('G14DG004', 'G14', NULL, N'Hoàng Văn E', 4, N'Không như mong đợi lắm.', 1),
('G14DG005', 'G14', NULL, N'Trịnh Văn I', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('G14DG006', 'G14', NULL, N'Phạm Thị D', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('G14DG007', 'G14', NULL, N'Nguyễn Văn A', 3, N'Size hơi nhỏ, lần sau chọn size lớn hơn.', 1),
('G14DG008', 'G14', NULL, N'Đỗ Văn G', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('G14DG009', 'G14', NULL, N'Đỗ Văn G', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
('G14DG010', 'G14', NULL, N'Trần Thị B', 4, N'Sản phẩm hơi khác ảnh mô tả.', 1),
-- Giày 15
('G15DG001', 'G15', NULL, N'Bùi Thị J', 3, N'Không như mong đợi lắm.', 1),
('G15DG002', 'G15', NULL, N'Phạm Thị D', 3, N'Không như mong đợi lắm.', 1),
('G15DG003', 'G15', NULL, N'Đỗ Văn G', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('G15DG004', 'G15', NULL, N'Trịnh Văn I', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('G15DG005', 'G15', NULL, N'Hoàng Văn E', 4, N'Không như mong đợi lắm.', 1),
('G15DG006', 'G15', NULL, N'Trần Thị B', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('G15DG007', 'G15', NULL, N'Hoàng Văn E', 3, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('G15DG008', 'G15', NULL, N'Bùi Thị J', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
-- Giày 16
('G16DG001', 'G16', NULL, N'Lý Thị H', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1),
('G16DG002', 'G16', NULL, N'Lê Văn C', 4, N'Chưa dùng thử nhưng thấy ổn.', 1),
('G16DG003', 'G16', NULL, N'Lý Thị H', 5, N'Rất hài lòng, sẽ mua thêm.', 1),
('G16DG004', 'G16', NULL, N'Trần Thị B', 5, N'Giá cả hợp lý, chất liệu tốt.', 1),
('G16DG005', 'G16', NULL, N'Lê Văn C', 4, N'Tạm ổn, đóng gói chưa đẹp lắm.', 1),
('G16DG006', 'G16', NULL, N'Lý Thị H', 5, N'Màu sắc đẹp, đúng mô tả.', 1),
('G16DG007', 'G16', NULL, N'Vũ Thị F', 5, N'Chất lượng ổn, sẽ ủng hộ lần sau.', 1),
('G16DG008', 'G16', NULL, N'Bùi Thị J', 4, N'Chưa dùng thử nhưng thấy ổn.', 1),
('G16DG009', 'G16', NULL, N'Hoàng Văn E', 5, N'Sản phẩm rất tốt, giao hàng nhanh!', 1);


-- ============================================================================================================================================================

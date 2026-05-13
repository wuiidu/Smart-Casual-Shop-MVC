CREATE DATABASE ShopQuanAo
GO
USE ShopQuanAo
GO

-- ============================================================================================================================================================
-- TẠO BẢNG

-- Bảng KHACH_HANG
CREATE TABLE KHACH_HANG (
    MaKH         VARCHAR(5)   PRIMARY KEY,
    TenDangNhap  VARCHAR(50)   NOT NULL UNIQUE,
    MatKhau      VARCHAR(200)  NOT NULL,  
    HoTen        NVARCHAR(100),
    SoDienThoai  VARCHAR(20), 
    Email        VARCHAR(100),
    DiaChi       NVARCHAR(MAX),
    TrangThai    BIT NOT NULL DEFAULT 1
);

-- Bảng NHAN_VIEN
CREATE TABLE NHAN_VIEN (
    MaNV         VARCHAR(5)   PRIMARY KEY,
    TenDangNhap  VARCHAR(50)   NOT NULL UNIQUE,
    MatKhau      VARCHAR(200)  NOT NULL,
    HoTen        NVARCHAR(100) NOT NULL,
    ChucVu       NVARCHAR(50)  DEFAULT N'Nhân viên',
    TrangThai    BIT           NOT NULL DEFAULT 1
);

-- Bảng DANH_MUC
CREATE TABLE DANH_MUC (
    MaDanhMuc   VARCHAR(1) PRIMARY KEY,
    TenDanhMuc  NVARCHAR(200) NOT NULL UNIQUE,
    TrangThai   BIT NOT NULL DEFAULT 1
);

-- Bảng KICH_THUOC
CREATE TABLE KICH_THUOC (
    MaKichThuoc   VARCHAR(7) PRIMARY KEY,
    TenKichThuoc  NVARCHAR(100) NOT NULL,
    TrangThai     BIT NOT NULL DEFAULT 1
);

-- Bảng SAN_PHAM
CREATE TABLE SAN_PHAM (
    MaSP       VARCHAR(3) PRIMARY KEY,
    MaDanhMuc  VARCHAR(1) NOT NULL,
    TenSanPham NVARCHAR(300) NOT NULL,
    MoTa       NVARCHAR(MAX),
    TrangThai  BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_SANPHAM_DANHMUC FOREIGN KEY (MaDanhMuc) REFERENCES DANH_MUC(MaDanhMuc)
);

-- Bảng CHI_TIET_SP
CREATE TABLE CHI_TIET_SP (
    MaCTSP      VARCHAR(9) PRIMARY KEY,
    MaSP        VARCHAR(3) NOT NULL,
    MaKichThuoc VARCHAR(7) NOT NULL,
    GiaBan      DECIMAL(18,2) NOT NULL CHECK (GiaBan >= 0),
    SoLuong     INT NOT NULL DEFAULT 0 CHECK (SoLuong >= 0),
    TrangThai   BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_CTSP_SP FOREIGN KEY (MaSP) REFERENCES SAN_PHAM(MaSP),
    CONSTRAINT FK_CTSP_SIZE FOREIGN KEY (MaKichThuoc) REFERENCES KICH_THUOC(MaKichThuoc),
    CONSTRAINT UQ_CTSP UNIQUE (MaSP, MaKichThuoc)
);

-- Bảng HINH_ANH_SP
CREATE TABLE HINH_ANH_SP (
    MaHinhAnh   VARCHAR(6) PRIMARY KEY,
    MaSP        VARCHAR(3) NOT NULL,
    DuongDan    NVARCHAR(500) NOT NULL,
    LaAnhChinh  BIT NOT NULL DEFAULT 0,
    TrangThai   BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_HINHANH_SP FOREIGN KEY (MaSP) REFERENCES SAN_PHAM(MaSP) ON DELETE CASCADE
);

-- Bảng MA_GIAM_GIA
CREATE TABLE MA_GIAM_GIA (
    MaCode       VARCHAR(20) PRIMARY KEY, 
    GiaTri       DECIMAL(18,2) NOT NULL, 
    LoaiGiamGia  VARCHAR(20) NOT NULL,
    SoLuong      INT DEFAULT 5,               
    TrangThai    BIT NOT NULL DEFAULT 1,
    CHECK (LoaiGiamGia IN ('percent', 'cash', 'shipping'))
);

-- Bảng PHUONG_THUC_VAN_CHUYEN
CREATE TABLE PHUONG_THUC_VAN_CHUYEN (
    MaPTVC        VARCHAR(2) PRIMARY KEY,
    TenPTVC       NVARCHAR(100) NOT NULL,
    GiaVanChuyen  DECIMAL(18,2) DEFAULT 0,
    TrangThai     BIT NOT NULL DEFAULT 1
);

-- Bảng GIO_HANG
CREATE TABLE GIO_HANG (
    MaKH        VARCHAR(5) NOT NULL,
    MaCTSP      VARCHAR(9) NOT NULL,
    SoLuong     INT NOT NULL CHECK (SoLuong > 0),    
    PRIMARY KEY (MaKH, MaCTSP),   
    CONSTRAINT FK_GIOHANG_KH FOREIGN KEY (MaKH) REFERENCES KHACH_HANG(MaKH) ON DELETE CASCADE,
    CONSTRAINT FK_GIOHANG_CTSP FOREIGN KEY (MaCTSP) REFERENCES CHI_TIET_SP(MaCTSP) ON DELETE CASCADE
);

-- Bảng DON_HANG
CREATE TABLE DON_HANG (
    MaDonHang          VARCHAR(10) PRIMARY KEY,
    MaKH               VARCHAR(5) NULL, 
    MaNV               VARCHAR(5) NULL,    
    TenNguoiNhan       NVARCHAR(100) NOT NULL,
    SoDienThoai        VARCHAR(20) NOT NULL,
    Email              VARCHAR(100) NULL,
    MaCode             VARCHAR(20) NULL,
    MaPTVC             VARCHAR(2) NOT NULL,
    NgayDat            DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    NgayGiaoDuKien     DATETIME2 NULL,
    DiaChiGiao         NVARCHAR(400) NOT NULL, 
    GhiChu             NVARCHAR(MAX) NULL,    
    TongSoLuong        INT DEFAULT 0,
    TongTien           DECIMAL(18,2) DEFAULT 0,
    GiamGia            DECIMAL(18,2) DEFAULT 0,
    PhiVanChuyen       DECIMAL(18,2) DEFAULT 0,
    ThanhTien AS (CASE 
                    WHEN (TongTien + PhiVanChuyen - GiamGia) < 0 THEN 0 
                    ELSE (TongTien + PhiVanChuyen - GiamGia) 
                  END) PERSISTED,
                  
    PhuongThucThanhToan NVARCHAR(50),
    DaThanhToan        BIT DEFAULT 0,
    TrangThaiDonHang   NVARCHAR(50) DEFAULT N'Chờ xác nhận',
    TrangThai          BIT DEFAULT 1,    
    CONSTRAINT FK_DONHANG_KHACHHANG FOREIGN KEY (MaKH) REFERENCES KHACH_HANG(MaKH),
    CONSTRAINT FK_DONHANG_NHANVIEN FOREIGN KEY (MaNV) REFERENCES NHAN_VIEN(MaNV), -- FK Mới
    CONSTRAINT FK_DONHANG_MAGIAMGIA FOREIGN KEY (MaCode) REFERENCES MA_GIAM_GIA(MaCode),
    CONSTRAINT FK_DONHANG_PTVC FOREIGN KEY (MaPTVC) REFERENCES PHUONG_THUC_VAN_CHUYEN(MaPTVC),
    CONSTRAINT CK_DH_TrangThai CHECK (TrangThaiDonHang IN (N'Chờ xác nhận', N'Đang giao', N'Hoàn tất', N'Hủy'))
);

-- Bảng CHI_TIET_DON_HANG
CREATE TABLE CHI_TIET_DON_HANG (
    MaDonHang VARCHAR(10) NOT NULL,
    MaCTSP    VARCHAR(9) NOT NULL, 
    SoLuong   INT NOT NULL CHECK (SoLuong > 0),
    DonGia    DECIMAL(18,2) NOT NULL CHECK (DonGia >= 0),
    ThanhTien AS (CONVERT(DECIMAL(18,2), SoLuong * DonGia)) PERSISTED, 
    TrangThai BIT DEFAULT 1,
    PRIMARY KEY (MaDonHang, MaCTSP), 
    CONSTRAINT FK_CTDH_DH FOREIGN KEY (MaDonHang) REFERENCES DON_HANG(MaDonHang) ON DELETE CASCADE,
    CONSTRAINT FK_CTDH_CTSP FOREIGN KEY (MaCTSP) REFERENCES CHI_TIET_SP(MaCTSP)
);

-- Bảng DANH_GIA: Cập nhật FK trỏ về KHACH_HANG
CREATE TABLE DANH_GIA (
    MaDanhGia    VARCHAR(8) PRIMARY KEY, 
    MaSP         VARCHAR(3) NOT NULL,
    MaKH         VARCHAR(5) NULL,
    TenKhachHang NVARCHAR(100) NOT NULL,  
    SoSao        INT NOT NULL CHECK (SoSao >= 1 AND SoSao <= 5),
    NoiDung      NVARCHAR(MAX),
    TrangThai    BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_DANHGIA_SP FOREIGN KEY (MaSP) REFERENCES SAN_PHAM(MaSP) ON DELETE CASCADE,
    CONSTRAINT FK_DANHGIA_KH FOREIGN KEY (MaKH) REFERENCES KHACH_HANG(MaKH)
);

-- ============================================================================================================================================================

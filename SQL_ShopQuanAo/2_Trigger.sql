USE ShopQuanAo
GO

-- ============================================================================================================================================================
-- BẢNG DON_HANG - TỰ ĐỘNG ĐẾM SỐ LƯỢNG

CREATE TRIGGER TRG_CapNhatTongSoLuongDonHang
ON CHI_TIET_DON_HANG
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @MaDonHangCanTinh TABLE (MaDonHang VARCHAR(10));
    INSERT INTO @MaDonHangCanTinh (MaDonHang)
    SELECT MaDonHang FROM INSERTED
    UNION
    SELECT MaDonHang FROM DELETED;

    -- Tính tổng số lượng từ bảng chi tiết và cập nhật vào bảng đơn hàng
    UPDATE dh
    SET dh.TongSoLuong = ISNULL((SELECT SUM(ct.SoLuong) 
                                 FROM CHI_TIET_DON_HANG ct 
                                 WHERE ct.MaDonHang = dh.MaDonHang), 0)
    FROM DON_HANG dh
    INNER JOIN @MaDonHangCanTinh list ON dh.MaDonHang = list.MaDonHang;
END;
GO 

-- ============================================================================================================================================================
-- BẢNG DON_HANG - TỰ ĐỘNG TÍNH TỔNG TIỀN

CREATE TRIGGER TRG_CapNhatTongTienDonHang
ON CHI_TIET_DON_HANG
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @MaDonHangCanTinh TABLE (MaDonHang VARCHAR(10)); 
    INSERT INTO @MaDonHangCanTinh (MaDonHang)
    SELECT MaDonHang FROM INSERTED
    UNION
    SELECT MaDonHang FROM DELETED;

    -- Cập nhật lại TongTien cho bảng DON_HANG
    UPDATE dh
    SET dh.TongTien = ISNULL((SELECT SUM(ct.ThanhTien) 
                              FROM CHI_TIET_DON_HANG ct 
                              WHERE ct.MaDonHang = dh.MaDonHang), 0)
    FROM DON_HANG dh
    INNER JOIN @MaDonHangCanTinh list ON dh.MaDonHang = list.MaDonHang;
END;
GO

-- ============================================================================================================================================================
-- BẢNG DON_HANG - TỰ ĐỘNG LẤY PHÍ VẬN CHUYỂN

CREATE TRIGGER TRG_TuDongLayPhiShip
ON DON_HANG
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dh
    SET dh.PhiVanChuyen = pt.GiaVanChuyen
    FROM DON_HANG dh
    INNER JOIN INSERTED i ON dh.MaDonHang = i.MaDonHang
    INNER JOIN PHUONG_THUC_VAN_CHUYEN pt ON i.MaPTVC = pt.MaPTVC;
END;
GO

-- ============================================================================================================================================================

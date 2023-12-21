create database QuanLyCongViec
go
use QuanLyCongViec
go
-- B?ng Danh m?c Nghi?p V? Qu?n Lý Công Vi?c
CREATE TABLE DanhMucNghiepVu (
    ID_DanhMucCV INT PRIMARY KEY,
    TenNghiepVu VARCHAR(255)
);

-- B?ng Danh m?c Phân Lo?i Công Vi?c
CREATE TABLE DanhMucPhanLoaiCongViec (
    ID_PhanLoaiCV INT PRIMARY KEY,
    TenPhanLoai VARCHAR(255)
);

-- B?ng Nhân Viên
CREATE TABLE NhanVien (
    ID_NhanVien INT PRIMARY KEY,
    HoTen NVARCHAR(255),
    ChucDanh NVARCHAR(255),
    BoPhan NVARCHAR(255)
);

-- B?ng Công Vi?c
CREATE TABLE CongViec (
    ID_CongViec INT PRIMARY KEY,
    TenCongViec NVARCHAR(255),
    MoTa NVARCHAR(MAX),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    TrangThai NVARCHAR(50), -- ?ã th?c hi?n, ?ang th?c hi?n, Ch?a th?c hi?n
    NhanVienID INT,
    DanhMucNghiepVuID INT,
    DanhMucPhanLoaiCongViecID INT,
    FOREIGN KEY (NhanVienID) REFERENCES NhanVien(ID_NhanVien),
    FOREIGN KEY (DanhMucNghiepVuID) REFERENCES DanhMucNghiepVu(ID_DanhMucCV),
    FOREIGN KEY (DanhMucPhanLoaiCongViecID) REFERENCES DanhMucPhanLoaiCongViec(ID_PhanLoaiCV)
);

-- B?ng Ti?n ?? Công Vi?c
CREATE TABLE TienDoCongViec (
    ID_TienDoCV INT PRIMARY KEY,
    CongViecID INT,
    PhanTramHoanThanh INT,
    ThoiGianDaDung INT,
    ThoiGianConLai INT,
    FOREIGN KEY (CongViecID) REFERENCES CongViec(ID_CongViec)
);



-- B?ng Chia S? Thông Tin Công Vi?c
CREATE TABLE ChiaSeCongViec (
    ChiaSeID INT PRIMARY KEY,
    NguoiChiaSeID INT,
    NguoiNhanID INT,
    CongViecID INT,
    QuyenTruyCap NVARCHAR(50), -- Ví d?: 'Xem', 'ChinhSua', 'ThemBinhLuan'
    FOREIGN KEY (NguoiChiaSeID) REFERENCES NhanVien(ID_NhanVien),
    FOREIGN KEY (NguoiNhanID) REFERENCES NhanVien(ID_NhanVien),
    FOREIGN KEY (CongViecID) REFERENCES CongViec(ID_CongViec)
);


-- B?ng Báo Cáo và Tình Hình Công Vi?c
CREATE TABLE BaoCaoTinhHinhCongViec (
    ID_BaoCaoCV INT PRIMARY KEY,
    CongViecID INT,
    NoiDung NVARCHAR(MAX),
    ThoiGian DATE,
    FOREIGN KEY (CongViecID) REFERENCES CongViec(ID_CongViec)
);

-- B?ng Th?ng Kê Công Vi?c
CREATE TABLE ThongKeCongViec (
    ID_ThongKeCV INT PRIMARY KEY,
    CongViecID INT,
    CongViecDaThucHien INT,
    CongViecChuaThucHien INT,
    CongViecDangThucHien INT,
    ThoiGianCapNhat DATE,
    FOREIGN KEY (CongViecID) REFERENCES CongViec(ID_CongViec)
);


-- Thêm d? li?u:

-- Thêm d? li?u vào b?ng DanhMucNghiepVu
INSERT INTO DanhMucNghiepVu (ID_DanhMucCV, TenNghiepVu) VALUES
    (1, 'Qu?n lý d? án'),
    (2, 'Phát tri?n ph?n m?m'),
    (3, 'Ki?m th?');

-- Thêm d? li?u vào b?ng DanhMucPhanLoaiCongViec
INSERT INTO DanhMucPhanLoaiCongViec (ID_PhanLoaiCV, TenPhanLoai) VALUES
    (1, '?u tiên cao'),
    (2, '?u tiên trung bình'),
    (3, '?u tiên th?p');

-- Thêm d? li?u vào b?ng NhanVien
INSERT INTO NhanVien (ID_NhanVien, HoTen, ChucDanh, BoPhan) VALUES
    (1, 'Nguyen Van A', 'Qu?n lý d? án', 'B? ph?n qu?n lý'),
    (2, 'Tran Thi B', 'L?p trình viên', 'B? ph?n phát tri?n'),
    (3, 'Le Van C', 'Ki?m th? viên', 'B? ph?n ki?m th?');

-- Thêm d? li?u vào b?ng CongViec
INSERT INTO CongViec (ID_CongViec, TenCongViec, MoTa, NgayBatDau, NgayKetThuc, TrangThai, NhanVienID, DanhMucNghiepVuID, DanhMucPhanLoaiCongViecID) VALUES
    (1, 'Phát tri?n module A', 'Mô t? công vi?c cho module A', '2023-01-01', '2023-01-15', 'Ch?a th?c hi?n', 2, 2, 1),
    (2, 'Ki?m th? ch?t l??ng', 'Mô t? công vi?c ki?m th?', '2023-02-01', '2023-02-10', '?ang th?c hi?n', 3, 3, 2),
    (3, 'Qu?n lý ti?n ?? d? án', 'Mô t? công vi?c qu?n lý', '2023-03-01', '2023-03-20', 'Ch?a th?c hi?n', 1, 1, 3);

-- Thêm d? li?u vào b?ng TienDoCongViec
INSERT INTO TienDoCongViec (ID_TienDoCV, CongViecID, PhanTramHoanThanh, ThoiGianDaDung, ThoiGianConLai) VALUES
    (1, 1, 50, 5, 5),
    (2, 2, 30, 3, 7),
    (3, 3, 10, 2, 18);

-- Thêm d? li?u vào b?ng ChiaSeCongViec
INSERT INTO ChiaSeCongViec (ChiaSeID, NguoiChiaSeID, NguoiNhanID, CongViecID, QuyenTruyCap) VALUES
    (1, 1, 2, 1, 'Xem'),
    (2, 2, 3, 2, 'ChinhSua'),
    (3, 3, 1, 3, 'ThemBinhLuan');

-- Thêm d? li?u vào b?ng BaoCaoTinhHinhCongViec
INSERT INTO BaoCaoTinhHinhCongViec (ID_BaoCaoCV, CongViecID, NoiDung, ThoiGian) VALUES
    (1, 1, 'Báo cáo ti?n ?? module A', '2023-01-10'),
    (2, 2, 'Báo cáo k?t qu? ki?m th?', '2023-02-15'),
    (3, 3, 'Báo cáo tình hình d? án', '2023-03-15');

-- Thêm d? li?u vào b?ng ThongKeCongViec
INSERT INTO ThongKeCongViec (ID_ThongKeCV, CongViecID, CongViecDaThucHien, CongViecChuaThucHien, CongViecDangThucHien, ThoiGianCapNhat) VALUES
    (1, 1, 1, 0, 0, '2023-01-15'),
    (2, 2, 0, 1, 0, '2023-02-10'),
    (3, 3, 0, 1, 0, '2023-03-20');


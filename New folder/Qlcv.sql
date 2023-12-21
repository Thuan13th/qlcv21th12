create database QuanLyCongViec
go
use QuanLyCongViec
go
-- B?ng Danh m?c Nghi?p V? Qu?n L� C�ng Vi?c
CREATE TABLE DanhMucNghiepVu (
    ID_DanhMucCV INT PRIMARY KEY,
    TenNghiepVu VARCHAR(255)
);

-- B?ng Danh m?c Ph�n Lo?i C�ng Vi?c
CREATE TABLE DanhMucPhanLoaiCongViec (
    ID_PhanLoaiCV INT PRIMARY KEY,
    TenPhanLoai VARCHAR(255)
);

-- B?ng Nh�n Vi�n
CREATE TABLE NhanVien (
    ID_NhanVien INT PRIMARY KEY,
    HoTen NVARCHAR(255),
    ChucDanh NVARCHAR(255),
    BoPhan NVARCHAR(255)
);

-- B?ng C�ng Vi?c
CREATE TABLE CongViec (
    ID_CongViec INT PRIMARY KEY,
    TenCongViec NVARCHAR(255),
    MoTa NVARCHAR(MAX),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    TrangThai NVARCHAR(50), -- ?� th?c hi?n, ?ang th?c hi?n, Ch?a th?c hi?n
    NhanVienID INT,
    DanhMucNghiepVuID INT,
    DanhMucPhanLoaiCongViecID INT,
    FOREIGN KEY (NhanVienID) REFERENCES NhanVien(ID_NhanVien),
    FOREIGN KEY (DanhMucNghiepVuID) REFERENCES DanhMucNghiepVu(ID_DanhMucCV),
    FOREIGN KEY (DanhMucPhanLoaiCongViecID) REFERENCES DanhMucPhanLoaiCongViec(ID_PhanLoaiCV)
);

-- B?ng Ti?n ?? C�ng Vi?c
CREATE TABLE TienDoCongViec (
    ID_TienDoCV INT PRIMARY KEY,
    CongViecID INT,
    PhanTramHoanThanh INT,
    ThoiGianDaDung INT,
    ThoiGianConLai INT,
    FOREIGN KEY (CongViecID) REFERENCES CongViec(ID_CongViec)
);



-- B?ng Chia S? Th�ng Tin C�ng Vi?c
CREATE TABLE ChiaSeCongViec (
    ChiaSeID INT PRIMARY KEY,
    NguoiChiaSeID INT,
    NguoiNhanID INT,
    CongViecID INT,
    QuyenTruyCap NVARCHAR(50), -- V� d?: 'Xem', 'ChinhSua', 'ThemBinhLuan'
    FOREIGN KEY (NguoiChiaSeID) REFERENCES NhanVien(ID_NhanVien),
    FOREIGN KEY (NguoiNhanID) REFERENCES NhanVien(ID_NhanVien),
    FOREIGN KEY (CongViecID) REFERENCES CongViec(ID_CongViec)
);


-- B?ng B�o C�o v� T�nh H�nh C�ng Vi?c
CREATE TABLE BaoCaoTinhHinhCongViec (
    ID_BaoCaoCV INT PRIMARY KEY,
    CongViecID INT,
    NoiDung NVARCHAR(MAX),
    ThoiGian DATE,
    FOREIGN KEY (CongViecID) REFERENCES CongViec(ID_CongViec)
);

-- B?ng Th?ng K� C�ng Vi?c
CREATE TABLE ThongKeCongViec (
    ID_ThongKeCV INT PRIMARY KEY,
    CongViecID INT,
    CongViecDaThucHien INT,
    CongViecChuaThucHien INT,
    CongViecDangThucHien INT,
    ThoiGianCapNhat DATE,
    FOREIGN KEY (CongViecID) REFERENCES CongViec(ID_CongViec)
);


-- Th�m d? li?u:

-- Th�m d? li?u v�o b?ng DanhMucNghiepVu
INSERT INTO DanhMucNghiepVu (ID_DanhMucCV, TenNghiepVu) VALUES
    (1, 'Qu?n l� d? �n'),
    (2, 'Ph�t tri?n ph?n m?m'),
    (3, 'Ki?m th?');

-- Th�m d? li?u v�o b?ng DanhMucPhanLoaiCongViec
INSERT INTO DanhMucPhanLoaiCongViec (ID_PhanLoaiCV, TenPhanLoai) VALUES
    (1, '?u ti�n cao'),
    (2, '?u ti�n trung b�nh'),
    (3, '?u ti�n th?p');

-- Th�m d? li?u v�o b?ng NhanVien
INSERT INTO NhanVien (ID_NhanVien, HoTen, ChucDanh, BoPhan) VALUES
    (1, 'Nguyen Van A', 'Qu?n l� d? �n', 'B? ph?n qu?n l�'),
    (2, 'Tran Thi B', 'L?p tr�nh vi�n', 'B? ph?n ph�t tri?n'),
    (3, 'Le Van C', 'Ki?m th? vi�n', 'B? ph?n ki?m th?');

-- Th�m d? li?u v�o b?ng CongViec
INSERT INTO CongViec (ID_CongViec, TenCongViec, MoTa, NgayBatDau, NgayKetThuc, TrangThai, NhanVienID, DanhMucNghiepVuID, DanhMucPhanLoaiCongViecID) VALUES
    (1, 'Ph�t tri?n module A', 'M� t? c�ng vi?c cho module A', '2023-01-01', '2023-01-15', 'Ch?a th?c hi?n', 2, 2, 1),
    (2, 'Ki?m th? ch?t l??ng', 'M� t? c�ng vi?c ki?m th?', '2023-02-01', '2023-02-10', '?ang th?c hi?n', 3, 3, 2),
    (3, 'Qu?n l� ti?n ?? d? �n', 'M� t? c�ng vi?c qu?n l�', '2023-03-01', '2023-03-20', 'Ch?a th?c hi?n', 1, 1, 3);

-- Th�m d? li?u v�o b?ng TienDoCongViec
INSERT INTO TienDoCongViec (ID_TienDoCV, CongViecID, PhanTramHoanThanh, ThoiGianDaDung, ThoiGianConLai) VALUES
    (1, 1, 50, 5, 5),
    (2, 2, 30, 3, 7),
    (3, 3, 10, 2, 18);

-- Th�m d? li?u v�o b?ng ChiaSeCongViec
INSERT INTO ChiaSeCongViec (ChiaSeID, NguoiChiaSeID, NguoiNhanID, CongViecID, QuyenTruyCap) VALUES
    (1, 1, 2, 1, 'Xem'),
    (2, 2, 3, 2, 'ChinhSua'),
    (3, 3, 1, 3, 'ThemBinhLuan');

-- Th�m d? li?u v�o b?ng BaoCaoTinhHinhCongViec
INSERT INTO BaoCaoTinhHinhCongViec (ID_BaoCaoCV, CongViecID, NoiDung, ThoiGian) VALUES
    (1, 1, 'B�o c�o ti?n ?? module A', '2023-01-10'),
    (2, 2, 'B�o c�o k?t qu? ki?m th?', '2023-02-15'),
    (3, 3, 'B�o c�o t�nh h�nh d? �n', '2023-03-15');

-- Th�m d? li?u v�o b?ng ThongKeCongViec
INSERT INTO ThongKeCongViec (ID_ThongKeCV, CongViecID, CongViecDaThucHien, CongViecChuaThucHien, CongViecDangThucHien, ThoiGianCapNhat) VALUES
    (1, 1, 1, 0, 0, '2023-01-15'),
    (2, 2, 0, 1, 0, '2023-02-10'),
    (3, 3, 0, 1, 0, '2023-03-20');


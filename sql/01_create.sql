-- Cau 1: Tao co so du lieu va cac bang

CREATE DATABASE gk_dienmay;
\c gk_dienmay

-- Bang khach_hang
CREATE TABLE khach_hang (
    ma_kh      VARCHAR(10) PRIMARY KEY,
    ho_ten     VARCHAR(80) NOT NULL,
    thanh_pho  VARCHAR(50),
    sdt        VARCHAR(15) UNIQUE
);

-- Bang san_pham
CREATE TABLE san_pham (
    ma_sp         VARCHAR(10)   PRIMARY KEY,
    ten_sp        VARCHAR(100)  NOT NULL,
    loai          VARCHAR(30)   NOT NULL,
    don_gia       NUMERIC(12,0) NOT NULL CHECK (don_gia > 0),
    so_luong_ton  INTEGER       NOT NULL DEFAULT 0 CHECK (so_luong_ton >= 0)
);

-- Bang hoa_don
CREATE TABLE hoa_don (
    ma_hd     VARCHAR(10) PRIMARY KEY,
    ma_kh     VARCHAR(10) NOT NULL REFERENCES khach_hang(ma_kh),
    ngay_lap  DATE        NOT NULL DEFAULT CURRENT_DATE
);

-- Bang chi_tiet_hd (khoa chinh kep)
CREATE TABLE chi_tiet_hd (
    ma_hd     VARCHAR(10) NOT NULL REFERENCES hoa_don(ma_hd),
    ma_sp     VARCHAR(10) NOT NULL REFERENCES san_pham(ma_sp),
    so_luong  INTEGER     NOT NULL CHECK (so_luong > 0),
    PRIMARY KEY (ma_hd, ma_sp)
);

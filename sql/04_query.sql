-- Cau 3: Truy van du lieu (chay sau 03_alter_update.sql)

-- Cau 3.1
SELECT ma_sp, ten_sp, loai, don_gia
FROM san_pham
WHERE don_gia BETWEEN 8000000 AND 15000000
ORDER BY don_gia DESC, ten_sp ASC;

-- Cau 3.2
SELECT SUM(so_luong_ton)       AS tong_ton,
       ROUND(AVG(don_gia), 0)  AS don_gia_tb,
       MAX(don_gia)            AS don_gia_max
FROM san_pham;

-- Cau 3.3
SELECT hd.ma_hd, hd.ngay_lap, kh.ho_ten, kh.thanh_pho
FROM hoa_don AS hd
JOIN khach_hang AS kh ON kh.ma_kh = hd.ma_kh
WHERE hd.ngay_lap >= DATE '2026-09-01'
  AND hd.ngay_lap <  DATE '2026-10-01'
ORDER BY hd.ngay_lap ASC;

-- Cau 3.4
SELECT sp.loai,
       SUM(ct.so_luong * sp.don_gia) AS doanh_thu
FROM chi_tiet_hd AS ct
JOIN san_pham AS sp ON sp.ma_sp = ct.ma_sp
GROUP BY sp.loai
HAVING SUM(ct.so_luong * sp.don_gia) > 45000000
ORDER BY doanh_thu DESC;

-- Cau 3.5
SELECT ma_kh, ho_ten, thanh_pho
FROM khach_hang
WHERE ma_kh NOT IN (
    SELECT hd.ma_kh
    FROM hoa_don AS hd
    JOIN chi_tiet_hd AS ct ON ct.ma_hd = hd.ma_hd
    JOIN san_pham AS sp    ON sp.ma_sp = ct.ma_sp
    WHERE sp.loai = 'Tivi'
)
ORDER BY ma_kh;

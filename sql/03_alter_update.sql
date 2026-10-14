-- Cau 2: Chinh sua du lieu (chay sau 02_data.sql, ket noi vao gk_dienmay)

-- Cau 2a: them cot email va cap nhat email cho KH01
ALTER TABLE khach_hang ADD COLUMN email VARCHAR(100);
UPDATE khach_hang
SET email = 'an.nguyen@example.com'
WHERE ma_kh = 'KH01';

-- Cau 2b: giam 10% don gia cua tat ca san pham loai Tivi
UPDATE san_pham
SET don_gia = don_gia * 0.9
WHERE loai = 'Tivi';

-- Cau 2c: them khach hang moi, hoa don moi va chi tiet hoa don
INSERT INTO khach_hang (ma_kh, ho_ten, thanh_pho, sdt)
VALUES ('KH09', 'Dang Van Kien', 'Viet Tri', '0912000009');

INSERT INTO hoa_don (ma_hd, ma_kh, ngay_lap)
VALUES ('HD011', 'KH09', '2026-10-09');

INSERT INTO chi_tiet_hd (ma_hd, ma_sp, so_luong)
VALUES ('HD011', 'SP08', 2);

-- Cau 2d: xoa san pham SP09 (SP09 chua xuat hien trong chi_tiet_hd nen xoa duoc)
DELETE FROM san_pham
WHERE ma_sp = 'SP09';

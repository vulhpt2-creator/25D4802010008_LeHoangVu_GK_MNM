SET client_encoding = 'UTF8';
-- DU LIEU MAU DE 1 (khong dau de tranh loi ma hoa). Chay SAU KHI da tao bang.
INSERT INTO khach_hang (ma_kh, ho_ten, thanh_pho, sdt) VALUES
('KH01', 'Nguyen Van An',  'Viet Tri', '0912000001'),
('KH02', 'Tran Thi Binh',  'Ha Noi',   '0912000002'),
('KH03', 'Le Van Cuong',   'Phu Tho',  '0912000003'),
('KH04', 'Pham Thi Dung',  'Viet Tri', '0912000004'),
('KH05', 'Hoang Van Em',   'Vinh Phuc','0912000005'),
('KH06', 'Do Thi Giang',   'Ha Noi',   '0912000006'),
('KH07', 'Bui Van Hai',    'Phu Tho',  '0912000007'),
('KH08', 'Vu Thi Lan',     'Viet Tri', '0912000008');

INSERT INTO san_pham (ma_sp, ten_sp, loai, don_gia, so_luong_ton) VALUES
('SP01', 'Tivi Samsung 43 inch',          'Tivi',     8500000, 15),
('SP02', 'Tivi LG 55 inch',               'Tivi',    13900000,  8),
('SP03', 'Tivi Sony 65 inch',             'Tivi',    24500000,  4),
('SP04', 'May giat Toshiba 9kg',          'May giat', 7200000, 10),
('SP05', 'May giat Electrolux 10kg',      'May giat',11800000,  6),
('SP06', 'Dieu hoa Daikin 12000BTU',      'Dieu hoa',10500000, 12),
('SP07', 'Dieu hoa Panasonic 9000BTU',    'Dieu hoa', 8900000,  9),
('SP08', 'Noi chien khong dau Philips',   'Gia dung', 2300000, 30),
('SP09', 'May xay sinh to Sunhouse',      'Gia dung',  650000, 40),
('SP10', 'Quat dieu hoa Kangaroo',        'Gia dung', 3200000, 18);

INSERT INTO hoa_don (ma_hd, ma_kh, ngay_lap) VALUES
('HD001', 'KH01', '2026-09-02'),
('HD002', 'KH02', '2026-09-05'),
('HD003', 'KH03', '2026-09-12'),
('HD004', 'KH01', '2026-09-20'),
('HD005', 'KH04', '2026-09-25'),
('HD006', 'KH05', '2026-10-01'),
('HD007', 'KH02', '2026-10-03'),
('HD008', 'KH06', '2026-10-06'),
('HD009', 'KH03', '2026-08-28'),
('HD010', 'KH04', '2026-10-08');

INSERT INTO chi_tiet_hd (ma_hd, ma_sp, so_luong) VALUES
('HD001', 'SP01', 1), ('HD001', 'SP08', 2),
('HD002', 'SP04', 1), ('HD002', 'SP06', 1),
('HD003', 'SP02', 1),
('HD004', 'SP07', 2), ('HD004', 'SP08', 1),
('HD005', 'SP05', 1), ('HD005', 'SP10', 1),
('HD006', 'SP03', 1),
('HD007', 'SP08', 3), ('HD007', 'SP04', 1),
('HD008', 'SP06', 2), ('HD008', 'SP05', 1),
('HD009', 'SP04', 2),
('HD010', 'SP10', 2), ('HD010', 'SP07', 1);

# Bài kiểm tra giữa học phần – Ứng dụng mã nguồn mở

## 1. Thông tin sinh viên

| Mục | Nội dung |
|---|---|
| Họ và tên | Lê Hoàng Vũ |
| MSSV | 25D4802010008 |
| Lớp | TTLT1Đ25 |
| Đề số | Đề 1 |

## 2. Mô tả cơ sở dữ liệu

Cơ sở dữ liệu PostgreSQL **`gk_dienmay`** phục vụ quản lý bán hàng của một cửa hàng điện máy, gồm 4 bảng:

- **khach_hang** (`ma_kh`, `ho_ten`, `thanh_pho`, `sdt`, `email`): thông tin khách hàng; `ma_kh` là khóa chính, `sdt` là duy nhất. Cột `email` được thêm ở Câu 2a.
- **san_pham** (`ma_sp`, `ten_sp`, `loai`, `don_gia`, `so_luong_ton`): danh mục sản phẩm; có ràng buộc `don_gia > 0`, `so_luong_ton >= 0`.
- **hoa_don** (`ma_hd`, `ma_kh`, `ngay_lap`): hóa đơn bán hàng; `ma_kh` là khóa ngoại tham chiếu `khach_hang`.
- **chi_tiet_hd** (`ma_hd`, `ma_sp`, `so_luong`): chi tiết từng hóa đơn; khóa chính kép (`ma_hd`, `ma_sp`), hai khóa ngoại tham chiếu `hoa_don` và `san_pham`.

Quan hệ: một khách hàng có nhiều hóa đơn; một hóa đơn có nhiều dòng chi tiết; một sản phẩm xuất hiện trong nhiều dòng chi tiết.

## 3. Thứ tự chạy các file

Chạy lần lượt theo thứ tự sau (dùng `psql`, đứng ở thư mục gốc của repository):

| Thứ tự | File | Nội dung | Lệnh |
|---|---|---|---|
| 1 | `sql/01_create.sql` | Tạo CSDL `gk_dienmay` và 4 bảng (Câu 1) | `psql -U postgres -f sql/01_create.sql` |
| 2 | `sql/02_data.sql` | Nạp dữ liệu mẫu (Câu 2) | `psql -U postgres -d gk_dienmay -f sql/02_data.sql` |
| 3 | `sql/03_alter_update.sql` | Thêm cột, cập nhật, thêm, xóa dữ liệu (Câu 2a–2d) | `psql -U postgres -d gk_dienmay -f sql/03_alter_update.sql` |
| 4 | `sql/04_query.sql` | Các câu truy vấn SELECT (Câu 3.1–3.5) | `psql -U postgres -d gk_dienmay -f sql/04_query.sql` |

> Lưu ý: phải chạy đúng thứ tự. File 04 dùng đơn giá **sau khi** đã giảm 10% cho Tivi ở file 03.

## 4. Trích xuất dữ liệu

Chạy các lệnh dưới đây tại thư mục gốc của repository.

**Câu 4.1 – Xuất kết quả truy vấn câu 3.4 ra CSV (có dòng tiêu đề):**

```sql
psql -U postgres -d gk_dienmay -c "\copy (SELECT sp.loai, SUM(ct.so_luong * sp.don_gia) AS doanh_thu FROM chi_tiet_hd AS ct JOIN san_pham AS sp ON sp.ma_sp = ct.ma_sp GROUP BY sp.loai HAVING SUM(ct.so_luong * sp.don_gia) > 45000000 ORDER BY doanh_thu DESC) TO 'export/ketqua_cau3_4.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8')"
```

**Câu 4.2 – Sao lưu toàn bộ CSDL (cấu trúc và dữ liệu) bằng pg_dump:**

```bash
pg_dump -U postgres -d gk_dienmay -f export/gk_dienmay_backup.sql
```

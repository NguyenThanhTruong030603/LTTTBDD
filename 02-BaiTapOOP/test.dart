import 'cuahang.dart';
import 'dienthoai.dart';
import 'hoadon.dart';

void main() {
  // Tạo cửa hàng
  CuaHang cuaHang = CuaHang(tenCuaHang: "Mobile Shop", diaChi: "123 Đường ABC");

  // Tạo các điện thoại
  DienThoai dienThoai1 = DienThoai(
    maDienThoai: "DT-001",
    tenDienThoai: "iPhone 15",
    hangSanXuat: "Apple",
    giaNhap: 15000,
    giaBan: 20000,
    soLuongTonKho: 10,
  );
  DienThoai dienThoai2 = DienThoai(
    maDienThoai: "DT-002",
    tenDienThoai: "Samsung Galaxy S24",
    hangSanXuat: "Samsung",
    giaNhap: 12000,
    giaBan: 17000,
    soLuongTonKho: 5,
  );

  // Thêm điện thoại vào cửa hàng
  cuaHang.themDienThoai(dienThoai1);
  cuaHang.themDienThoai(dienThoai2);

  // Tạo hóa đơn
  HoaDon hoaDon1 = HoaDon(
    maHoaDon: "HD-001",
    ngayBan: DateTime.now(),
    dienThoai: dienThoai1,
    soLuongMua: 2,
    giaBanThucTe: 19000,
    tenKhachHang: "Nguyễn Văn A",
    soDienThoaiKhach: "0912345678",
  );

  // Thêm hóa đơn vào cửa hàng
  cuaHang.themHoaDon(hoaDon1);

  // Hiển thị thông tin cửa hàng
  cuaHang.hienThiThongTin();
}

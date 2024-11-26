import 'dienthoai.dart';
import 'hoadon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang({required String tenCuaHang, required String diaChi})
      : _tenCuaHang = tenCuaHang,
        _diaChi = diaChi;

  // Thêm điện thoại mới
  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
  }

  // Cập nhật thông tin điện thoại
  void capNhatDienThoai(String maDienThoai, DienThoai dienThoaiMoi) {
    var index =
        _danhSachDienThoai.indexWhere((dt) => dt.maDienThoai == maDienThoai);
    if (index != -1) {
      _danhSachDienThoai[index] = dienThoaiMoi;
    } else {
      print("Không tìm thấy điện thoại với mã $maDienThoai.");
    }
  }

  // Ngừng kinh doanh điện thoại
  void ngungKinhDoanhDienThoai(String maDienThoai) {
    var index =
        _danhSachDienThoai.indexWhere((dt) => dt.maDienThoai == maDienThoai);
    if (index != -1) {
      _danhSachDienThoai[index].trangThai = false;
    } else {
      print("Không tìm thấy điện thoại với mã $maDienThoai.");
    }
  }

  // Thêm hóa đơn
  void themHoaDon(HoaDon hoaDon) {
    _danhSachHoaDon.add(hoaDon);
  }

  // Hiển thị thông tin cửa hàng
  void hienThiThongTin() {
    print("Tên cửa hàng: $_tenCuaHang");
    print("Địa chỉ: $_diaChi");
    print("Danh sách điện thoại: ");
    _danhSachDienThoai.forEach((dt) {
      dt.hienThiThongTin();
    });
  }
}

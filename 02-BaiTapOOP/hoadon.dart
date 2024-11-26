import 'dienthoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor đầy đủ tham số
  HoaDon({
    required String maHoaDon,
    required DateTime ngayBan,
    required DienThoai dienThoai,
    required int soLuongMua,
    required double giaBanThucTe,
    required String tenKhachHang,
    required String soDienThoaiKhach,
  })  : _maHoaDon = maHoaDon,
        _ngayBan = ngayBan,
        _dienThoai = dienThoai,
        _soLuongMua = soLuongMua,
        _giaBanThucTe = giaBanThucTe,
        _tenKhachHang = tenKhachHang,
        _soDienThoaiKhach = soDienThoaiKhach {
    // Kiểm tra validation
    if (_maHoaDon.isEmpty || !_maHoaDon.startsWith("HD-")) {
      throw ArgumentError("Mã hóa đơn không hợp lệ.");
    }
    if (_ngayBan.isAfter(DateTime.now())) {
      throw ArgumentError("Ngày bán không thể sau ngày hiện tại.");
    }
    if (_soLuongMua <= 0 || _soLuongMua > _dienThoai.soLuongTonKho) {
      throw ArgumentError(
          "Số lượng mua phải hợp lệ và không vượt quá số lượng tồn kho.");
    }
    if (_giaBanThucTe <= 0) {
      throw ArgumentError("Giá bán thực tế phải lớn hơn 0.");
    }
    if (_tenKhachHang.isEmpty ||
        _soDienThoaiKhach.isEmpty ||
        !_soDienThoaiKhach.startsWith("0")) {
      throw ArgumentError("Thông tin khách hàng không hợp lệ.");
    }
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _giaBanThucTe * _soLuongMua;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuan() {
    return (_dienThoai.giaBan - _dienThoai.giaNhap) * _soLuongMua;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTin() {
    print("Mã hóa đơn: $_maHoaDon");
    print("Ngày bán: $_ngayBan");
    print("Điện thoại: ${_dienThoai.tenDienThoai}");
    print("Số lượng mua: $_soLuongMua");
    print("Giá bán thực tế: $_giaBanThucTe");
    print("Tên khách hàng: $_tenKhachHang");
    print("Số điện thoại khách: $_soDienThoaiKhach");
  }
}

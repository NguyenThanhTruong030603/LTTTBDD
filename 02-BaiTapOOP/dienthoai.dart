class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

  // Constructor đầy đủ tham số
  DienThoai({
    required String maDienThoai,
    required String tenDienThoai,
    required String hangSanXuat,
    required double giaNhap,
    required double giaBan,
    required int soLuongTonKho,
    bool trangThai = true, // Mặc định còn kinh doanh
  })  : _maDienThoai = maDienThoai,
        _tenDienThoai = tenDienThoai,
        _hangSanXuat = hangSanXuat,
        _giaNhap = giaNhap,
        _giaBan = giaBan,
        _soLuongTonKho = soLuongTonKho,
        _trangThai = trangThai {
    // Kiểm tra validation
    if (!_maDienThoai.startsWith("DT-") || _maDienThoai.length != 6) {
      throw ArgumentError(
          "Mã điện thoại không hợp lệ, phải có định dạng 'DT-XXX'.");
    }
    if (_tenDienThoai.isEmpty) {
      throw ArgumentError("Tên điện thoại không được để trống.");
    }
    if (_giaNhap <= 0 || _giaBan <= 0 || _giaBan <= _giaNhap) {
      throw ArgumentError(
          "Giá nhập và giá bán phải lớn hơn 0, giá bán phải lớn hơn giá nhập.");
    }
    if (_soLuongTonKho < 0) {
      throw ArgumentError("Số lượng tồn kho không thể âm.");
    }
  }

  // Getter và setter cho các thuộc tính (để truy cập ngoài lớp)
  String get maDienThoai => _maDienThoai;
  set maDienThoai(String value) {
    if (value.isEmpty || !value.startsWith("DT-")) {
      throw ArgumentError("Mã điện thoại không hợp lệ.");
    }
    _maDienThoai = value;
  }

  String get tenDienThoai => _tenDienThoai;
  set tenDienThoai(String value) {
    if (value.isEmpty) {
      throw ArgumentError("Tên điện thoại không được để trống.");
    }
    _tenDienThoai = value;
  }

  String get hangSanXuat => _hangSanXuat;
  set hangSanXuat(String value) {
    if (value.isEmpty) {
      throw ArgumentError("Hãng sản xuất không được để trống.");
    }
    _hangSanXuat = value;
  }

  double get giaNhap => _giaNhap;
  set giaNhap(double value) {
    if (value <= 0) {
      throw ArgumentError("Giá nhập phải lớn hơn 0.");
    }
    _giaNhap = value;
  }

  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value <= 0 || value <= _giaNhap) {
      throw ArgumentError("Giá bán phải lớn hơn giá nhập và lớn hơn 0.");
    }
    _giaBan = value;
  }

  int get soLuongTonKho => _soLuongTonKho;
  set soLuongTonKho(int value) {
    if (value < 0) {
      throw ArgumentError("Số lượng tồn kho không thể âm.");
    }
    _soLuongTonKho = value;
  }

  bool get trangThai => _trangThai;
  set trangThai(bool value) {
    _trangThai = value;
  }

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    return (_giaBan - _giaNhap) * _soLuongTonKho;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print("Mã điện thoại: $_maDienThoai");
    print("Tên điện thoại: $_tenDienThoai");
    print("Hãng sản xuất: $_hangSanXuat");
    print("Giá nhập: $_giaNhap");
    print("Giá bán: $_giaBan");
    print("Số lượng tồn kho: $_soLuongTonKho");
    print("Trạng thái: ${_trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}");
  }

  // Phương thức kiểm tra có thể bán không
  bool coTheBan() {
    return _soLuongTonKho > 0 && _trangThai;
  }
}

import 'dart:async';

class AuthBloc {
  StreamController _nameController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();
  StreamController _confirmController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get passStream => _passController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get confirmStream => _confirmController.stream;

  bool isValid(
      String name, String email, String pass, String confirm, List<dynamic> l) {
    if (name.isEmpty) {
      _nameController.sink.addError("Nhập tên");
      return false;
    } else {
      if (name.length < 6) {
        _nameController.sink.addError("Tài khoản ít nhất 6 ký tự");
        return false;
      }
      for (int i = 0; i < l.length; i++) {
        if (name == l[i]['username']) {
          _nameController.sink.addError("Tên đăng nhập đã tồn tại");
          return false;
        }
      }
    }
    _nameController.sink.add("");
    if (email.isEmpty) {
      _emailController.sink.addError("Nhập mail");
      return false;
    } else {
      if (!email.contains("@")) {
        _emailController.sink.addError("Email phải có ký tự @");
        return false;
      }
    }
    _emailController.sink.add("");
    if (pass.isEmpty) {
      _passController.sink.addError("Nhập mật khẩu");
      return false;
    } else {
      if (pass.length < 6) {
        _passController.sink.addError("Mật khẩu ít nhất 6 ký tự");
        return false;
      }
    }
    _passController.sink.add("");
    if (confirm.isEmpty) {
      _confirmController.sink.addError("Nhập mật khẩu xác nhận");
      return false;
    } else {
      if (confirm != pass) {
        _confirmController.sink.addError("Mật khẩu không khớp");
        return false;
      }
    }
    _confirmController.sink.add("");
    return true;
  }

  void dispose() {
    _nameController.close();
    _passController.close();
    _emailController.close();
    _confirmController.close();
  }
}

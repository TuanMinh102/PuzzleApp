import 'dart:async';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();
  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String username, String pass) {
    if (username == null || username.length < 6) {
      _userController.sink.addError("Tài khoản không hợp lệ");
      return false;
    }
    if (pass == null || pass.length > 6) {
      _passController.sink.addError("Mật khẩu tối đa 6 ký tự");
      return false;
    }
    _userController.sink.add("ok");
    _passController.sink.add("ok");
    return true;
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }
}

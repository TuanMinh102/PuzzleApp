import 'dart:async';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();
  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInput(String username, String pass) {
    if (username.isEmpty || username.length < 6) {
      _userController.sink.addError("Tài khoản không hợp lệ");
      return false;
    }
    _userController.sink.add("ok");
    if (pass.isEmpty || pass.length > 6) {
      _passController.sink.addError("Mật khẩu tối đa 6 ký tự");
      return false;
    }
    _passController.sink.add("ok");
    return true;
  }

  bool isValidAccount(String username, String pass, List<dynamic> l) {
    for (int i = 0; i < l.length; i++) {
      if (l[i]['username'] == username && l[i]['password'] == pass) {
        return true;
      }
    }
    return false;
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }
}

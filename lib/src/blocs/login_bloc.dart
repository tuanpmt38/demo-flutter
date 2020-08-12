import 'dart:async';

import 'package:demo_hello_word/src/validators/validation.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passwordController = new StreamController();

  //function get stream
  Stream get userStream => _userController.stream;
  Stream get passwordStream => _passwordController.stream;

  bool isValidInfo(String username, String password) {
    if (!Validations.isValidUser(username)) {
      //sink input cho stream
      //stream du lieu dau ra
      _userController.sink.addError("username invalid");
      return false;
    }
    if (!Validations.isValidPassword(password)) {
      _passwordController.sink.addError("password invalid");
      return false;
    }

    _userController.sink.add("OK");
    _passwordController.sink.add("OK");
    return true;
  }

  void dispose() {
    _userController.close();
    _passwordController.close();
  }
}

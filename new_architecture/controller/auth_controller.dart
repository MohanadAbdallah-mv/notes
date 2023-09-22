import 'package:flutter/foundation.dart';

class AuthController extends ChangeNotifier {
  // I handle collecting data from the user interface and passing it to the logic layer
  // I also handle the logic layer's response and pass it to the user interface
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  void login() {
    _isAuth = true;
    notifyListeners();
  }

  void logout() {
    _isAuth = false;
    notifyListeners();
  }
}

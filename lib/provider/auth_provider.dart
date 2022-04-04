import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  bool get isLoggedIn => true;

  void setLoginTrue() {}

  void setLoginFalse() {}
}

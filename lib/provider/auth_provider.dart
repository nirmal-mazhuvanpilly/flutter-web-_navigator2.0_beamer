// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  Storage? storage = window.localStorage;

  Storage? initialiseStorage() {
    if (storage == null) {
      storage = window.localStorage;
      return storage;
    } else {
      return storage;
    }
  }

  bool? get isLoggedIn {
    Storage? storage = initialiseStorage();
    bool? isLogged = storage?["isLoggedIn"]?.isNotEmpty;
    return isLogged;
  }

  setLoginTrue() {
    Storage? storage = initialiseStorage();
    storage?["isLoggedIn"] = "true";
  }

  setLoginFalse() {
    Storage? storage = initialiseStorage();
    storage?["isLoggedIn"] = "";
  }
}

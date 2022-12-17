import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  Map<String, dynamic>? _user;
  String? _token;

  String? get getToken {
    if (_token != null) {
      return _token;
    }

    return null;
  }

  Map<String, Object?>? get getUser {
    return _user;
  }

  void setUser(Map<String, dynamic>? user) {
    _user = user;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:frontend_mobile/models/user.dart';

class Auth with ChangeNotifier {
  CurrentUser _user = CurrentUser(
    id: '',
    name: '',
    country: '',
    dob: '',
    email: '',
    phone: 0,
    userType: '',
    profilePicture: '',
  );
  // Map<String, dynamic>? _user;
  String? _token;

  String? get getToken {
    if (_token != null) {
      return _token;
    }

    return null;
  }

  // Map<String, dynamic>? get getUser {
  //   return _user;
  // }
  CurrentUser? get getUser {
    return _user;
  }

  set setUser(CurrentUser user) {
    _user = user;
    notifyListeners();
  }

  set setToken(String token) {
    _token = token;
    notifyListeners();
  }
}

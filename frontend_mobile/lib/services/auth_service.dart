import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utilities/requests.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frontend_mobile/providers/auth.dart';

class AuthService with ChangeNotifier {
  Future<void> login(String email, String password, context) async {
    try {
      final url = Uri.http(Requests.url, '/auth/login');
      final response = await http.post(url,
          body: json.encode({'email': email, 'password': password}),
          headers: Requests().getHeaders(context));
      final data = json.decode(response.body);

      if (response.statusCode != 200) {
        throw HttpException(data["message"]);
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", data["token"]);

      Auth().setToken(data["token"]);
      Auth().setUser(data['user']);
      notifyListeners();
      debugPrint(data["user"]["email"]);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signUp(Map<String, Object> user, context) async {
    try {
      final url = Uri.http(Requests.url, '/auth/signup');
      final response = await http.post(url,
          body: json.encode({
            'name': user['name'],
            'email': user['email'],
            'password': user['password'],
            'dob': user['dob'],
            'phone': int.parse(user['phone'].toString().trim().substring(1)),
            'user_type': user['type'],
            'country': user['country'].toString()
          }),
          headers: Requests().getHeaders(context));
      final data = json.decode(response.body);

      if (response.statusCode != 200) {
        throw HttpException(data["message"]);
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", data["token"]);

      Auth().setToken(data["token"]);
      Auth().setUser(data['user']);
      notifyListeners();
      debugPrint(data["user"]["email"]);
    } catch (error) {
      rethrow;
    }
  }
}

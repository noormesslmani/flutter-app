import 'package:flutter/material.dart';

class ReusableWidgets {
  static getAppBar(String title, bool showBack) {
    return AppBar(
      title: Text(
        title,
      ),
      automaticallyImplyLeading: showBack,
      elevation: 0,
    );
  }
}

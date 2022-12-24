import 'package:flutter/material.dart';

class ReusableWidgets {
  static getAppBar(String title, bool showBack, List<Widget>? actions) {
    return AppBar(
      actions: actions,
      title: Text(
        title,
      ),
      automaticallyImplyLeading: showBack,
      elevation: 0,
    );
  }
}

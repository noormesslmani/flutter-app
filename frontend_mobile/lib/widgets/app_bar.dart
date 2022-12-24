import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final List<Widget>? actions;
  final AppBar appBar;
  const CustomAppBar(
      {required this.title, required this.showBack, this.actions, required this.appBar, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      title: Text(
        title,
      ),
      automaticallyImplyLeading: showBack,
      elevation: 0,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

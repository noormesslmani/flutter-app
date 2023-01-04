import 'package:flutter/material.dart';

class IconLabelButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final void Function()? onPressed;
  final Size? minimumSize;
  final Color? backgroundColor;
  const IconLabelButton(
      {required this.icon,
      required this.label,
      required this.onPressed,
      this.backgroundColor,
      this.minimumSize,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          minimumSize: minimumSize ?? const Size(double.infinity, 50)),
      label: Text(
        label,
      ),
    );
  }
}

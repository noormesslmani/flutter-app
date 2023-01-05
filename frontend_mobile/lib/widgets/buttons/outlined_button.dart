import 'package:flutter/material.dart';

class OutlinedBtn extends StatelessWidget {
  final void Function()? onPressed;
  final double? borderRadius;
  final Color? color;
  final Size? minSize;
  final String label;
  const OutlinedBtn(
      {required this.onPressed,
      this.borderRadius,
      this.color,
      required this.minSize,
      required this.label,
      super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Theme.of(context).primaryColor,
        minimumSize: minSize,
        side: BorderSide(color: color ?? Theme.of(context).primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
        ),
      ),
      child: Text(label),
    );
  }
}

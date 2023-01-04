import 'package:flutter/material.dart';

class InkwellIcon extends StatelessWidget {
  final Icon icon;
  final void Function()? onTap;
  final Color color;
  const InkwellIcon(
      {required this.icon,
      required this.onTap,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 1),
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.0)), //<-- SEE HERE
        child: InkWell(
          borderRadius: BorderRadius.circular(100.0),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child:icon,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SortByButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final Color color;
  const SortByButton(
      {required this.label,
      required this.onPressed,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width * 0.26,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Theme.of(context).primaryColorLight,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

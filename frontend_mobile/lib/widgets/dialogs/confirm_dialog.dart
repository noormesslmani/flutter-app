import 'package:flutter/material.dart';

class ConfirmDialig extends StatelessWidget {
  final String text;

  const ConfirmDialig({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Please Confirm'),
      content: const Text('Are you sure to remove the box?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('No'),
        ),
      ],
    );
  }
}

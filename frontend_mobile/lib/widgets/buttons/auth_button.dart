import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final double width;
  final void Function()? handlePress;
  const AuthButton({
    required this.label,
    required this.width,
    required this.handlePress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: handlePress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(width, 50),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

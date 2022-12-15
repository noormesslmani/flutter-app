import 'package:flutter/material.dart';

class AuthBottun extends StatefulWidget {
  final String label;

  const AuthBottun({
    required this.label,
    super.key,
  });

  @override
  State<AuthBottun> createState() => _AuthBottunState();
}

class _AuthBottunState extends State<AuthBottun> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size(double.infinity, 60),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        child:  Text(
          widget.label,
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

import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  final String label;
  final Color color;
  const RatingCard({required this.label, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: color,
              ),
            ),
            Icon(
              Icons.star,
              size: 20,
              color: color,
            )
          ],
        ),
      ),
    );
  }
}

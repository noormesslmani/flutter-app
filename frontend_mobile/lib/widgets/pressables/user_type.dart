import 'package:flutter/material.dart';

class TypeCard extends StatelessWidget {
  final String type;
  final Color color;
  final ImageProvider<Object> image;
  final void Function()? onTap;
  final double opacity;
  const TypeCard({
    required this.type,
    required this.color,
    required this.image,
    required this.onTap,
    required this.opacity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: opacity,
        child: Card(
          color: color,
          child: SizedBox(
            width: double.infinity,
            height: 100,
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 120,
                  child: Image(
                    image: image,
                  ),
                ),
                Text(
                  type,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

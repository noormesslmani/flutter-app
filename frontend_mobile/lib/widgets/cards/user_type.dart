import 'package:flutter/material.dart';

class TypeCard extends StatefulWidget {
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
  State<TypeCard> createState() => _TypeCardState();
}

class _TypeCardState extends State<TypeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Opacity(
        opacity: widget.opacity,
        child: Card(
          color: widget.color,
          child: SizedBox(
            width: double.infinity,
            height: 100,
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 150,
                  child: Image(
                    image: widget.image,
                  ),
                ),
                Text(
                  widget.type,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
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

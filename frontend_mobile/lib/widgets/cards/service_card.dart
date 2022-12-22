import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final double opacity;
  final String image;

  const ServiceCard({
    required this.opacity,
    required this.image,
    super.key,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 60,
          child: Opacity(
            opacity: widget.opacity,
            child: Image.asset(
              widget.image,
            ),
          ),
        ),
      ),
    );
  }
}

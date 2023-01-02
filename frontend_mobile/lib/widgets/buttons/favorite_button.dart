import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final void Function()? onPressed;

  const FavoriteButton(
      {required this.isFavorite, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: onPressed,
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        size: 35,
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
    );
  }
}

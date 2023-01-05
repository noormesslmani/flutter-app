import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  final double? initialRating;
  final bool? readOnly;
  final double size;
  final double padding;
  final void Function(double)? onRatingUpdate;
  const Rating(
      {this.initialRating,
      required this.padding,
      required this.size,
      this.onRatingUpdate,
      this.readOnly,
      super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: initialRating ?? 3.0,
      ignoreGestures: readOnly ?? false,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: size,
      ratingWidget: RatingWidget(
        full: Icon(Icons.star, color: Colors.yellow[700]),
        half: Icon(Icons.star_half, color: Colors.yellow[700]),
        empty: Icon(Icons.star_border, color: Colors.yellow[700]),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: padding),
      onRatingUpdate: onRatingUpdate ??
          (rating) {
            print(rating);
          },
    );
  }
}

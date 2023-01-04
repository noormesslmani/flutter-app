import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            Center(
              child: Text(
                '3/5',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(fontSizeFactor: 2.5, color: Colors.yellow[700]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: RatingBar(
                initialRating: 3.0,
                ignoreGestures: true,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 50,
                ratingWidget: RatingWidget(
                  full: Icon(Icons.star, color: Colors.yellow[700]),
                  half: Icon(Icons.star_half, color: Colors.yellow[700]),
                  empty: Icon(Icons.star_border, color: Colors.yellow[700]),
                ),
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                'Based on 25 reviews',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Reviews',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Divider(
              color: Colors.grey,
            ),
          ],
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.325 - 10,
          bottom: 5,
          child: OutlinedButton(
            onPressed: () {},
            child: Text('Add Review'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
              minimumSize: Size(MediaQuery.of(context).size.width * 0.35, 45),
              side: BorderSide(color: Theme.of(context).primaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

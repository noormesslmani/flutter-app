import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/buttons/outlined_button.dart';
import 'package:frontend_mobile/widgets/cards/review.dart';
import 'package:frontend_mobile/widgets/rating_bar.dart';

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
            const Center(
              child: Rating(
                padding: 4,
                size: 50,
                readOnly: true,
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
            const SingleReview(),
            const SingleReview(),
            const SingleReview(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.325 - 10,
          bottom: 5,
          child: OutlinedBtn(
            label: 'AddReview',
            minSize: Size(MediaQuery.of(context).size.width * 0.35, 45),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

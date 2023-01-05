import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend_mobile/widgets/text_expand.dart';

class SingleReview extends StatefulWidget {
  const SingleReview({super.key});

  @override
  State<SingleReview> createState() => _SingleReviewState();
}

class _SingleReviewState extends State<SingleReview> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/pet-owner.jpg"),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sarah Smith',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RatingBar(
                        initialRating: 3.0,
                        ignoreGestures: true,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 10,
                        ratingWidget: RatingWidget(
                          full: Icon(Icons.star, color: Colors.yellow[700]),
                          half:
                              Icon(Icons.star_half, color: Colors.yellow[700]),
                          empty: Icon(Icons.star_border,
                              color: Colors.yellow[700]),
                        ),
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                maxLines: _isHidden ? 2 : 10,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextExpand(
                  isHidden: _isHidden,
                  color: Theme.of(context).primaryColor,
                  onTap: () {
                    setState(
                      () {
                        _isHidden = !_isHidden;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

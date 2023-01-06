import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/rating_bar.dart';

class MapCard extends StatelessWidget {
  final String name;
  final double rating;
  final void Function()? onButtonPress;
  final void Function()? onArrowPress;
  final String distance;
  final String duration;
  const MapCard(
      {required this.name,
      required this.onArrowPress,
      required this.onButtonPress,
      required this.rating,
      required this.distance,
      required this.duration,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(20)),
              child: SizedBox(
                height: 180,
                width: 140,
                child: Image.asset(
                  "assets/images/vet.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Rating(
                      initialRating: rating,
                      padding: 1,
                      size: 25,
                      readOnly: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_pin,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        Text(
                          distance,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.directions_car,
                          color: Colors.grey,
                        ),
                        Text(
                          duration,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    )
                  ],
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: const Size(80, 40),
                  ),
                  onPressed: onButtonPress,
                  icon: const Icon(Icons.directions),
                  label: const Text('View Directions'),
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}

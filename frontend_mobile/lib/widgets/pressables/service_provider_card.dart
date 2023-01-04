import 'package:flutter/material.dart';

class ServiceProviderCard extends StatelessWidget {
  final void Function()? onPressed;
  const ServiceProviderCard({
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      elevation: 2,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              // Image radius
              child: Image.asset(
                "assets/images/pet-owner.jpg",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Stack(
            children: [
              Opacity(
                opacity: 0.8,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sarah Smith',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '4',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellowAccent[700],
                                      size: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                      size: 20,
                                    ),
                                    Text(
                                      '5Km',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: onPressed,
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Theme.of(context).primaryColorDark,
                            size: 24,
                          ),
                          padding: const EdgeInsets.all(0),
                          alignment: Alignment.centerRight,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

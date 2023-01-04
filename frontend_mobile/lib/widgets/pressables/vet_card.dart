import 'package:flutter/material.dart';

class VetCard extends StatelessWidget {
  final BuildContext context;
  const VetCard({required this.context, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120,
                    width: 80,
                    child: Image.asset(
                      "assets/images/vet.jpg",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Amy Fox',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.work,
                                size: 20,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Text(
                                ' 4 years',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                '4',
                                style: Theme.of(context).textTheme.bodySmall,
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
                                '5 Km',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    "/vetDetails",
                  );
                },
                padding: const EdgeInsets.all(0),
                iconSize: 60,
                splashRadius: 40,
                splashColor: Theme.of(context).colorScheme.secondary,
                icon: Icon(
                  Icons.arrow_right,
                  color: Theme.of(context).primaryColorLight,
                ),
                color: Theme.of(context).primaryColorLight,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

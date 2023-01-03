import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/text_expand.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool _isHidden = true;
  List<String> animals = [
    'assets/images/cat.png',
    'assets/images/pet.png',
    'assets/images/fish.png',
    'assets/images/hamster.png',
    'assets/images/parrot.png',
    'assets/images/rabbit.png',
    'assets/images/turtle.png'
  ];
  List<String> pets = [
    'assets/images/pet-dog.jpeg',
    'assets/images/pet-dog.jpeg',
  ];
  List<String> services = [
    'assets/images/walk.png',
    'assets/images/dog.png',
    'assets/images/bath.png',
    'assets/images/pet-boarding.png',
  ];
  List<String> servicesName = ['Training', 'Walking', 'Grooming', 'Boarding'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
      child: ListView(
        children: [
          Text(
            'About',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: Theme.of(context).primaryColorDark),
          ),
          const SizedBox(
            height: 5,
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
          const SizedBox(
            height: 15,
          ),
          Text(
            'Services',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: Theme.of(context).primaryColorDark),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: services.map((service) {
                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      children: [
                        Image.asset(
                          service,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              servicesName[services.indexOf(service)],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text("10 usd/h",
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Accepted Pets',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: Theme.of(context).primaryColorDark),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: animals.map((pet) {
                return Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Image.asset(
                    pet,
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Resident Pets',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: Theme.of(context).primaryColorDark),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: pets.map((pet) {
                return Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Image.asset(
                    pet,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

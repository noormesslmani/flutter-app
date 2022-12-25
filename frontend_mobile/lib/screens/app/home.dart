import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/cards/service_type_card.dart';
import 'package:frontend_mobile/utilities/serviceCard.dart';
import 'package:frontend_mobile/widgets/cards/vet_card.dart';
import 'package:frontend_mobile/widgets/cards/service_provider_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedService = ServiceCardUtilities.titles[0];
  int selectedInd = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Services",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              padding: const EdgeInsets.only(right: 20),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedService = ServiceCardUtilities.titles[index];
                          selectedInd = index;
                        });
                      },
                      child: ServiceTypeCard(
                        opacity: selectedInd == index ? 1 : 0.5,
                        image: ServiceCardUtilities.images[index],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Opacity(
                      opacity: selectedInd == index ? 1 : 0.3,
                      child: Text(
                        ServiceCardUtilities.titles[index],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Top Rated",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    "/serviceProvidersList",
                    arguments: selectedService,
                  );
                },
                child: Text(
                  "View All",
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: Colors.grey,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: selectedService == 'Veterinary'
                ? ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.all(3),
                        child: VetCard(),
                      );
                    },
                  )
                : GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      4,
                      (index) {
                        return const Padding(
                          padding: EdgeInsets.all(5),
                          child: ServiceProviderCard(),
                        );
                      },
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

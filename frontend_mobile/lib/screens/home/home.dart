import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/input.dart';
import 'package:frontend_mobile/widgets/cards/service_card.dart';
import 'package:frontend_mobile/utilities/serviceCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchQuery = '';
  String selectedService = ServiceCardUtilities.titles[0];
  int selectedInd = 0;
  FocusNode searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Input(
            setData: (text) {
              setState(
                () {
                  searchQuery = text;
                },
              );
              debugPrint(searchQuery);
            },
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            label: 'Search',
            focusNode: searchFocusNode,
          ),
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
                      child: ServiceCard(
                        opacity: selectedInd == index ? 1 : 0.5,
                        image: ServiceCardUtilities.images[index],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Opacity(
                      opacity: selectedInd == index ? 1 : 0.5,
                      child: Text(
                        ServiceCardUtilities.titles[index],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

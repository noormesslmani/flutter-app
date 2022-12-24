import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/reusable_widgets.dart';
import 'package:frontend_mobile/widgets/cards/vet_card.dart';
import 'package:frontend_mobile/widgets/cards/service_provider_card.dart';
import 'package:frontend_mobile/widgets/input.dart';

class ServiceProvidersList extends StatefulWidget {
  const ServiceProvidersList({super.key});

  @override
  State<ServiceProvidersList> createState() => _ServiceProvidersListState();
}

class _ServiceProvidersListState extends State<ServiceProvidersList> {
  @override
  Widget build(BuildContext context) {
    String searchQuery = '';
    FocusNode searchFocusNode = FocusNode();
    final selectedService =
        ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(
        selectedService,
        true,
        [
          const Icon(
            Icons.map,
            size: 35,
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.filter_alt,
            size: 35,
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Column(
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
              Expanded(
                child: selectedService == 'Veterinary'
                    ? ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return const VetCard();
                        },
                      )
                    : GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(
                          10,
                          (index) {
                            return const Padding(
                              padding: EdgeInsets.all(3),
                              child: ServiceProviderCard(),
                            );
                          },
                        ),
                      ),
              ),
            ],
          )),
    );
  }
}

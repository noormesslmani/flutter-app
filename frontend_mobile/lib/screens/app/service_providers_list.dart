import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/cards/vet_card.dart';
import 'package:frontend_mobile/widgets/cards/service_provider_card.dart';
import 'package:frontend_mobile/widgets/input.dart';
import 'package:frontend_mobile/widgets/app_bar.dart';
import 'package:frontend_mobile/widgets/filter_sheet.dart';

class ServiceProvidersList extends StatefulWidget {
  const ServiceProvidersList({super.key});

  @override
  State<ServiceProvidersList> createState() => _ServiceProvidersListState();
}

class _ServiceProvidersListState extends State<ServiceProvidersList> {
  String searchQuery = '';
  FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final selectedService =
        ModalRoute.of(context)?.settings.arguments as String;
    double currentSliderValue = 150;
    String sortBy = 'Popularity';
    String minRating = '1';

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: selectedService,
        showBack: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: GestureDetector(
              child: const Icon(
                Icons.map,
                size: 35,
              ),
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Input(
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
                ),
                GestureDetector(
                  child: Icon(
                    Icons.filter_list,
                    size: 35,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (
                            BuildContext context,
                            StateSetter setState,
                          ) {
                            return FilterSheet(
                              currentSliderValue: currentSliderValue,
                              minRating: minRating,
                              setMinRating: (val) =>
                                  setState(() => minRating = val),
                              setSliderValue: (val) =>
                                  setState(() => currentSliderValue = val),
                              setSortBy: (val) => setState(() => sortBy = val),
                              sortBy: sortBy,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
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
                        return const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: VetCard(),
                        );
                      },
                    )
                  : GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(
                        10,
                        (index) {
                          return const Padding(
                            padding: EdgeInsets.all(5),
                            child: ServiceProviderCard(),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

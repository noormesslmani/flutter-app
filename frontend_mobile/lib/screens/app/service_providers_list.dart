import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/cards/vet_card.dart';
import 'package:frontend_mobile/widgets/cards/service_provider_card.dart';
import 'package:frontend_mobile/widgets/input.dart';
import 'package:frontend_mobile/widgets/app_bar.dart';
import 'package:frontend_mobile/widgets/modals/filter_sheet.dart';
import 'package:frontend_mobile/models/filters.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ServiceProvidersList extends StatefulWidget {
  const ServiceProvidersList({super.key});

  @override
  State<ServiceProvidersList> createState() => _ServiceProvidersListState();
}

class _ServiceProvidersListState extends State<ServiceProvidersList> {
  String searchQuery = '';
  FocusNode searchFocusNode = FocusNode();
  final List<LatLng> locations = <LatLng>[
    const LatLng(-9.81967, -67.50781),
    const LatLng(25.84769, 38.57712),
    const LatLng(21.24830, 81.56812),
    const LatLng(-5.14471, 30.96037),
    const LatLng(58.95652, 46.02342),
    const LatLng(52.29517, -76.58306),
    const LatLng(6.74938, 14.55162),
    const LatLng(0.97975, -60.86465),
    const LatLng(34.92413, 43.16627),
  ];
  @override
  Widget build(BuildContext context) {
    final selectedService =
        ModalRoute.of(context)?.settings.arguments as String;
    double currentSliderValue = 150;
    String sortBy = 'Popularity';
    String minRating = '1';
    Filters filters =
        Filters(distance: 150, sortBy: 'Popularity', minRating: 1);

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
              onTap: () {
                Navigator.of(context).pushNamed("/maps", arguments: locations);
              },
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
                              setFilters: () {
                                setState(
                                  () {
                                    filters.distance = currentSliderValue;
                                    filters.minRating = int.parse(minRating);
                                    filters.sortBy = sortBy;
                                  },
                                );

                                Navigator.pop(context);
                              },
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
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: VetCard(
                            context: context,
                          ),
                        );
                      },
                    )
                  : GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(
                        10,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: ServiceProviderCard(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  "/serviceProviderDetails",
                                );
                              },
                            ),
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

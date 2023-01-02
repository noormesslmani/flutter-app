import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/buttons/favorite_button.dart';
import 'package:frontend_mobile/widgets/buttons/chat_button.dart';
import 'package:frontend_mobile/widgets/cards/vet_details_card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ServiceProviderDetails extends StatefulWidget {
  const ServiceProviderDetails({super.key});

  @override
  State<ServiceProviderDetails> createState() => _ServiceProviderDetailsState();
}

class _ServiceProviderDetailsState extends State<ServiceProviderDetails>
    with TickerProviderStateMixin {
  bool _isFavorite = false;
  late TabController _tabController;

  final List<LatLng> locations = <LatLng>[
    const LatLng(33.557069, 35.372948),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Image.asset(
                "assets/images/pet-owner.jpg",
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: FavoriteButton(
                        isFavorite: _isFavorite,
                        onPressed: () {
                          setState(
                            () {
                              _isFavorite = !_isFavorite;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage("assets/images/pet-owner.jpg"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Sarah Smith',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Text(
                              '100',
                            ),
                            Icon(
                              Icons.favorite,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ChatButton(onPressed: () {}),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: VetDetailCard(
                    icon: Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                      size: 30,
                    ),
                    text: '4.5/5',
                    title: 'Rating',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed("/maps", arguments: locations);
                  },
                  child: VetDetailCard(
                    icon: Icon(
                      Icons.location_pin,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 30,
                    ),
                    text: '3 Km',
                    title: 'Location',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

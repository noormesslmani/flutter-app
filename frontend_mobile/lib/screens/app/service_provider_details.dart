import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/buttons/favorite_button.dart';
import 'package:frontend_mobile/widgets/buttons/chat_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend_mobile/widgets/TabBarView/serviceProvider/about.dart';
import 'package:frontend_mobile/widgets/TabBarView/serviceProvider/bookings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:frontend_mobile/widgets/pressables/inkwell_icons.dart';
import 'package:frontend_mobile/widgets/TabBarView/reviews.dart';

class ServiceProviderDetails extends StatefulWidget {
  const ServiceProviderDetails({super.key});

  @override
  State<ServiceProviderDetails> createState() => _ServiceProviderDetailsState();
}

class _ServiceProviderDetailsState extends State<ServiceProviderDetails>
    with TickerProviderStateMixin {
  bool _isFavorite = false;
  late TabController _tabController;
  final String number = '+96178912581';
  final List<LatLng> locations = <LatLng>[
    const LatLng(33.557069, 35.372948),
  ];
  _makingPhoneCall() async {
    var url = Uri.parse("tel:9776765434");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _openEmail() async {
    var url = Uri.parse("mailto:noormsl95@gmail.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Image.asset(
                  "assets/images/pet-owner.jpg",
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
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
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 50,
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
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                '100',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Icon(
                                Icons.favorite,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: ChatButton(onPressed: () {}),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                InkwellIcon(
                  icon: Icon(
                    Icons.phone,
                    size: 20.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: _makingPhoneCall,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                InkwellIcon(
                  icon: Icon(
                    Icons.email_outlined,
                    size: 20.0,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onTap: _openEmail,
                  color: Theme.of(context).primaryColorDark,
                ),
                const SizedBox(
                  width: 5,
                ),
                InkwellIcon(
                  icon: Icon(
                    Icons.location_pin,
                    size: 20.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed("/maps", arguments: locations);
                  },
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Theme.of(context).primaryColor,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(
                  text: 'About',
                ),
                Tab(
                  text: 'Bookings',
                ),
                Tab(
                  text: 'Reviews',
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  About(),
                  Bookings(),
                  Reviews(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

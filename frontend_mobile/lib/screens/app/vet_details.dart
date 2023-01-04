import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend_mobile/widgets/buttons/chat_button.dart';
import 'package:frontend_mobile/widgets/buttons/favorite_button.dart';
import 'package:frontend_mobile/widgets/pressables/inkwell_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:frontend_mobile/widgets/TabBarView/vet/veterinary.dart';
import 'package:frontend_mobile/widgets/TabBarView/reviews.dart';

class VetDetails extends StatefulWidget {
  const VetDetails({super.key});

  @override
  State<VetDetails> createState() => _VetDetailsState();
}

class _VetDetailsState extends State<VetDetails> with TickerProviderStateMixin {
  bool _isFavorite = false;
  final List timeSlots = [
    '8:00-9:00',
    '9:00-10:00',
    '10:00-11:00',
    '11:00-12:00',
    '12:00-13:00'
  ];
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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

  final List<LatLng> locations = <LatLng>[
    const LatLng(33.557069, 35.372948),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Image.asset(
                "assets/images/vet.jpg",
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
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
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Align(
                            child: Text(
                              'Dr. Sarah Smith',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .apply(
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: ChatButton(
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.work,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '4 years',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkwellIcon(
                          icon: Icon(
                            Icons.phone,
                            size: 25.0,
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
                            Icons.location_pin,
                            size: 25.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed("/maps", arguments: locations);
                          },
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkwellIcon(
                          icon: Icon(
                            Icons.email_outlined,
                            size: 25.0,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onTap: _openEmail,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Theme.of(context).primaryColor,
                      indicatorColor: Theme.of(context).primaryColor,
                      tabs: const [
                        Tab(
                          text: 'Veterinary',
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
                          Veterinary(),
                          Reviews(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

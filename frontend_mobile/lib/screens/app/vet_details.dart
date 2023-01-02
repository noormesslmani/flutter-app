import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/cards/vet_details_card.dart';
import 'package:frontend_mobile/widgets/text_expand.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:frontend_mobile/widgets/cards/appointment_slot.dart';
import 'package:frontend_mobile/widgets/dialogs/confirm_dialog.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend_mobile/widgets/buttons/chat_button.dart';
import 'package:frontend_mobile/widgets/buttons/favorite_button.dart';

class VetDetails extends StatefulWidget {
  const VetDetails({super.key});

  @override
  State<VetDetails> createState() => _VetDetailsState();
}

class _VetDetailsState extends State<VetDetails> {
  bool _isFavorite = false;
  bool _isHidden = true;
  int? _selectedIndex;
  final List timeSlots = [
    '8:00-9:00',
    '9:00-10:00',
    '10:00-11:00',
    '11:00-12:00',
    '12:00-13:00'
  ];
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
                      height: 10,
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
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Text(
                            'About',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .apply(
                                    color: Theme.of(context).primaryColorDark),
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
                            height: 10,
                          ),
                          Text(
                            'Appointments',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .apply(
                                    color: Theme.of(context).primaryColorDark),
                          ),
                          HorizontalCalendar(
                            date: DateTime.now().add(const Duration(days: 3)),
                            lastDate:
                                DateTime.now().add(const Duration(days: 60)),
                            textColor: Colors.black45,
                            backgroundColor: Theme.of(context).backgroundColor,
                            selectedColor: Theme.of(context).primaryColor,
                            onDateSelected: (date) => print(
                              date.toString(),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Available Slots',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(
                                    color: Theme.of(context).primaryColorDark),
                          ),
                          SizedBox(
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: timeSlots.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedIndex = index;
                                        });
                                      },
                                      onDoubleTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return const ConfirmDialig(
                                                    text:
                                                        'Are you sure you want to book the appointment?');
                                              },
                                            );
                                          },
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: AppointmentSlot(
                                          time: timeSlots[index],
                                          index: index,
                                          selectedIndex: _selectedIndex,
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
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

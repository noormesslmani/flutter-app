import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:frontend_mobile/widgets/pressables/appointment_slot.dart';
import 'package:frontend_mobile/widgets/dialogs/confirm_dialog.dart';
import 'package:frontend_mobile/widgets/buttons/icon_label_button.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  int? _selectedIndex;
  final List timeSlots = [
    '8:00-9:00',
    '9:00-10:00',
    '10:00-11:00',
    '11:00-12:00',
    '12:00-13:00'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalCalendar(
          date: DateTime.now().add(const Duration(days: 3)),
          lastDate: DateTime.now().add(const Duration(days: 60)),
          textColor: Colors.black45,
          backgroundColor: Theme.of(context).backgroundColor,
          selectedColor: Theme.of(context).primaryColor,
          onDateSelected: (date) => print(
            date.toString(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 2,
              children: timeSlots
                  .map(
                    (time) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = timeSlots.indexOf(time);
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
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SizedBox(
                            child: AppointmentSlot(
                              time: time,
                              index: timeSlots.indexOf(time),
                              selectedIndex: _selectedIndex,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: IconLabelButton(
            icon: const Icon(
              Icons.calendar_month,
              size: 26,
            ),
            onPressed: _selectedIndex != null
                ? () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return const ConfirmDialig(
                                text:
                                    'Are you sure you want to book the appointment?');
                          },
                        );
                      },
                    );
                  }
                : null,
            label: 'Book Appointment',
            backgroundColor: Theme.of(context).primaryColor,
            minimumSize: const Size(double.infinity, 50),
          ),
        ),
      ],
    );
  }
}

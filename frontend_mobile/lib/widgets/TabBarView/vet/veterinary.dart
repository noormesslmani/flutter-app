import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/text_expand.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:frontend_mobile/widgets/pressables/appointment_slot.dart';
import 'package:frontend_mobile/widgets/dialogs/confirm_dialog.dart';
import 'package:frontend_mobile/widgets/buttons/icon_label_button.dart';

class Veterinary extends StatefulWidget {
  const Veterinary({super.key});

  @override
  State<Veterinary> createState() => _VeterinaryState();
}

class _VeterinaryState extends State<Veterinary> {
  bool _isHidden = true;
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
    return ListView(
      children: [
        Text(
          'About',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(color: Theme.of(context).primaryColorDark),
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
              .apply(color: Theme.of(context).primaryColorDark),
        ),
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
        const SizedBox(
          height: 5,
        ),
        Text(
          'Available Slots',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(color: Theme.of(context).primaryColorDark),
        ),
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: timeSlots.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
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

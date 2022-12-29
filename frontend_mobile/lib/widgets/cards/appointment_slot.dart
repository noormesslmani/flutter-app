import 'package:flutter/material.dart';

class AppointmentSlot extends StatelessWidget {
  final String time;
  final int? selectedIndex;
  final int index;
  const AppointmentSlot(
      {required this.time,
      required this.selectedIndex,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: selectedIndex == index
              ? Theme.of(context).primaryColor
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).primaryColor,
          )),
      child: Text(
        time,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .apply(color: selectedIndex == index ? Colors.white : null),
      ),
    );
  }
}

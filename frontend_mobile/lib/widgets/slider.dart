import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final double currentSliderValue;
  final void Function(double)? onChanged;
  const SliderWidget(
      {required this.currentSliderValue, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: Theme.of(context).primaryColorLight,
      inactiveColor: Theme.of(context).colorScheme.tertiary,
      thumbColor: Theme.of(context).primaryColor,
      value: currentSliderValue,
      max: 500,
      divisions: 9,
      min: 50,
      label: currentSliderValue.round().toString(),
      onChanged: onChanged,
    );
  }
}

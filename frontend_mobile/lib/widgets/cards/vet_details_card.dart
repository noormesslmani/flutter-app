import 'package:flutter/material.dart';

class VetDetailCard extends StatelessWidget {
  final Icon icon;
  final String text;
  final String title;
  const VetDetailCard(
      {required this.icon, required this.text, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 10,
                ),
                Text(text, style: Theme.of(context).textTheme.titleMedium!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

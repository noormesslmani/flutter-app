import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/slider.dart';
import 'package:frontend_mobile/widgets/buttons/sort_by_button.dart';
import 'package:frontend_mobile/widgets/cards/rating_card.dart';

class FilterSheet extends StatelessWidget {
  final Function setSortBy;
  final String sortBy;
  final double currentSliderValue;
  final Function setSliderValue;
  final String minRating;
  final Function setMinRating;

  const FilterSheet(
      {required this.currentSliderValue,
      required this.minRating,
      required this.setMinRating,
      required this.setSliderValue,
      required this.setSortBy,
      required this.sortBy,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Sort and Filter',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sort By',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ['Popularity', 'Ratings', 'Distance']
                      .map(
                        (value) => SortByButton(
                          label: value,
                          onPressed: () {
                            setSortBy(value);
                          },
                          color: sortBy == value
                              ? Theme.of(context).primaryColorLight
                              : Colors.white,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Distance',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '50km',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '500Km',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SliderWidget(
                  currentSliderValue: currentSliderValue,
                  onChanged: (double value) {
                    setSliderValue(value);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Minimun rating',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                  ]
                      .map<Widget>(
                        (value) => GestureDetector(
                          onTap: () {
                            setMinRating(value);
                          },
                          child: RatingCard(
                            label: value,
                            color:
                                minRating == value ? Colors.amber : Colors.grey,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Discard Changes',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColorLight,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Apply Filters',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

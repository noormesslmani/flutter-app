import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/input.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchQuery = '';
  FocusNode searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Input(
            setData: (text) {
              setState(
                () {
                  searchQuery = text;
                },
              );
              debugPrint(searchQuery);
            },
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            label: 'Search',
            focusNode: searchFocusNode,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Services",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}

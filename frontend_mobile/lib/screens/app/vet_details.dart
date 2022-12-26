import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/app_bar.dart';

class VetDetails extends StatefulWidget {
  const VetDetails({super.key});

  @override
  State<VetDetails> createState() => _VetDetailsState();
}

class _VetDetailsState extends State<VetDetails> {
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
                      child: IconButton(
                        onPressed: () {},
                        splashColor: Theme.of(context).colorScheme.secondary,
                        icon: Icon(
                          Icons.favorite_border,
                          size: 30,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
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
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';
import 'sign_in.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OnbordingData> list = [
      OnbordingData(
          image: const AssetImage("assets/images/splash1.png"),
          imageHeight: MediaQuery.of(context).size.height * 0.6,
          fit: BoxFit.fitHeight,
          titleText: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                    text: "Welcome to ",
                    style: TextStyle(
                        color: Color.fromRGBO(33, 76, 69, 1),
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700)),
                TextSpan(
                    text: "\nHappy Paws",
                    style: TextStyle(
                        color: Color.fromRGBO(122, 188, 178, 1),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                  text:
                      "\nwith our app you'll make the life\n of your furry friend happier",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          descText: const SizedBox.shrink()),
      OnbordingData(
        image: const AssetImage("assets/images/splash2.png"),
        imageHeight: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.fitHeight,
        titleText: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(
                  text: "Welcome to ",
                  style: TextStyle(
                    color: Color.fromRGBO(33, 76, 69, 1),
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0,
                  )),
              TextSpan(
                  text: "\nHappy Paws",
                  style: TextStyle(
                      color: Color.fromRGBO(122, 188, 178, 1),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                text:
                    "\nFind the best vetrenaries and \nservice providers within your area",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
        descText: const SizedBox.shrink(),
      ),
      OnbordingData(
        image: const AssetImage("assets/images/splash3.png"),
        imageHeight: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.fitHeight,
        titleText: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(
                  text: "Welcome to ",
                  style: TextStyle(
                    color: Color.fromRGBO(33, 76, 69, 1),
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0,
                  )),
              TextSpan(
                  text: "\nHappy Paws",
                  style: TextStyle(
                      color: Color.fromRGBO(122, 188, 178, 1),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                text: "\nWith Happy Paws, your pet is in safe hands",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
        descText: const SizedBox.shrink(),
      ),
    ];

    return IntroScreen(
      onbordingDataList: list,
      colors: [],
      pageRoute: MaterialPageRoute(
        builder: (context) => SignIn(),
      ),
      lastButton: const CircleAvatar(
        backgroundColor: Color.fromRGBO(122, 188, 178, 1),
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
      ),
      nextButton: const CircleAvatar(
        backgroundColor: Color.fromRGBO(122, 188, 178, 1),
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
      skipButton: const Text(
        "SKIP",
        style: TextStyle(color: Color.fromRGBO(122, 188, 178, 1)),
      ),
      selectedDotColor: const Color.fromRGBO(33, 76, 69, 1),
      unSelectdDotColor: Colors.grey,
    );
  }
}

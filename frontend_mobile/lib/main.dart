import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/onboarding.dart';
import 'package:frontend_mobile/tools/themes/light_mode.dart';
import 'package:frontend_mobile/screens/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme().themeData,
      debugShowCheckedModeBanner: false,
      home: const Onboarding(),
      routes: {
        "/onboarding": (context) => const Onboarding(),
        "/signin": (context) => SignIn(),
      },
    );
  }
}

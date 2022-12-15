import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/onboarding.dart';
import 'package:frontend_mobile/tools/themes/light_mode.dart';
import 'package:frontend_mobile/screens/auth/Sign_in.dart';
import 'package:frontend_mobile/screens/auth/Sign_up1.dart';
import 'package:frontend_mobile/screens/auth/Sign_up2.dart';

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
        "/signup1": (context) => SignUp1(),
        "/signup2": (context) => SignUp2(),
      },
    );
  }
}

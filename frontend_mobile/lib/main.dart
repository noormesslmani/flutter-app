import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/onboarding.dart';
import 'package:frontend_mobile/tools/themes/light_mode.dart';
import 'package:frontend_mobile/screens/auth/Sign_in.dart';
import 'package:frontend_mobile/screens/auth/Sign_up1.dart';
import 'package:frontend_mobile/screens/auth/Sign_up2.dart';
import 'package:frontend_mobile/screens/auth/Sign_up3.dart';
import 'package:frontend_mobile/screens/tabs.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(
          create: (_) => Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          theme: LightTheme().themeData,
          debugShowCheckedModeBanner: false,
          home: const Onboarding(),
          routes: {
            "/onboarding": (context) => const Onboarding(),
            "/signin": (context) => SignIn(),
            "/signup1": (context) => SignUp1(),
            "/signup2": (context) => SignUp2(),
            "/signup3": (context) => SignUp3(),
            "/tabs": (context) => Tabs(),
          },
        ),
      ),
    );
  }
}

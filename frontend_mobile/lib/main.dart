import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/app/service_providers_list.dart';
import 'package:frontend_mobile/screens/onboarding.dart';
import 'package:frontend_mobile/tools/themes/light_mode.dart';
import 'package:frontend_mobile/screens/auth/Sign_in.dart';
import 'package:frontend_mobile/screens/auth/Sign_up1.dart';
import 'package:frontend_mobile/screens/auth/Sign_up2.dart';
import 'package:frontend_mobile/screens/auth/Sign_up3.dart';
import 'package:frontend_mobile/screens/app/pet_owner_tabs.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './providers/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:frontend_mobile/screens/auth/Email_verification.dart';
import 'package:frontend_mobile/screens/app/pet_owner_tabs.dart';
import 'package:frontend_mobile/screens/app/maps.dart';
import 'package:frontend_mobile/screens/app/vet_details.dart';
import 'package:frontend_mobile/screens/app/service_provider_details.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            "/signin": (context) => const SignIn(),
            "/signup1": (context) => const SignUp1(),
            "/signup2": (context) => const SignUp2(),
            "/signup3": (context) => const SignUp3(),
            "/verifyEmail": (context) => const VerifyEmail(),
            "/tabs": (context) => const Tabs(),
            "/serviceProvidersList": (context) => const ServiceProvidersList(),
            "/maps": (context) => const Maps(),
            "/vetDetails": ((context) => const VetDetails()),
            "/serviceProviderDetails":(context) => const ServiceProviderDetails(),
          },
        ),
      ),
    );
  }
}

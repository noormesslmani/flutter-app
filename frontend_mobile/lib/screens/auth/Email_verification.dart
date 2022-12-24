import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/reusable_widgets.dart';
import 'package:frontend_mobile/services/auth_service.dart';
import 'package:frontend_mobile/utilities/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:frontend_mobile/providers/auth.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> with WidgetsBindingObserver {
  bool isEmailVerified = false;
  late Timer timer;

  void verifyEmail() {
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) async {
        debugPrint('checking');
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;

        if (user?.emailVerified ?? false) {
          try {
            if (mounted) {
              await AuthService().signUp(
                ModalRoute.of(context)?.settings.arguments
                    as Map<String, Object>,
                context,
              );
            }
            if (mounted &&
                Provider.of<Auth>(
                      context,
                      listen: false,
                    ).getUser!['user_type'].toString() ==
                    'owner') {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/tabs",
                (route) => false,
              );
            }
          } on HttpException catch (error) {
            debugPrint(error.message);
          } catch (error) {
            debugPrint(error.toString());
          }
          timer.cancel();
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    verifyEmail();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar('Email Verification', false, null),
      body: const Center(
        child:
            Text('A Verification email has been sent, please check your inbox'),
      ),
    );
  }
}

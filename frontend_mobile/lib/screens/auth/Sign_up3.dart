import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/buttons/auth_button.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:frontend_mobile/widgets/pressables/user_type.dart';
import 'package:frontend_mobile/services/auth_service.dart';
import 'package:frontend_mobile/widgets/app_bar.dart';

class SignUp3 extends StatefulWidget {
  const SignUp3({super.key});
  @override
  State<SignUp3> createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  String _userType = 'owner';

  @override
  Widget build(BuildContext context) {
    final user =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'User Type',
        appBar: AppBar(),
        showBack: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Text(
                  'You are...?',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TypeCard(
                  type: 'Pet Owner',
                  color: const Color.fromRGBO(200, 239, 232, 1),
                  image: const AssetImage("assets/images/owner.png"),
                  onTap: () {
                    setState(() {
                      _userType = 'owner';
                      user['type'] = 'owner';
                    });
                  },
                  opacity: _userType == 'owner' ? 1 : 0.4,
                ),
                const SizedBox(
                  height: 10,
                ),
                TypeCard(
                  type: 'Service provider',
                  color: const Color.fromRGBO(240, 199, 200, 1),
                  image: const AssetImage("assets/images/service.png"),
                  onTap: () {
                    setState(() {
                      _userType = 'provider';
                      user['type'] = 'provider';
                    });
                  },
                  opacity: _userType == 'provider' ? 1 : 0.4,
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthButton(
                  label: 'Create Account',
                  width: double.infinity,
                  handlePress: (() async {
                    await AuthService.signUpWithFireBase(
                      user['email'].toString(),
                      user['password'].toString(),
                      () {
                        if (!mounted) return;
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/verifyEmail",
                          arguments: user,
                          (route) => false,
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ClipPath(
              clipper: WaveClipperOne(reverse: true),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

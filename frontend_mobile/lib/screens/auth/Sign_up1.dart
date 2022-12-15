import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/input.dart';
import 'package:frontend_mobile/widgets/buttons/auth_button.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({super.key});

  static const routeName = '/login';

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode nameFocusNode;
  late FocusNode dobFocusNode;

  @override
  void initState() {
    super.initState();
    nameFocusNode = FocusNode();
    dobFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image: AssetImage("assets/logo/logo.png"),
              height: 140,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Create an account',
            style: TextStyle(
              fontSize: 26,
              color: Colors.grey[800],
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Input(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    label: 'Full Name',
                    focusNode: nameFocusNode,
                    suffixIcon: null,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    prefixIcon: const Icon(
                      Icons.cake,
                      color: Colors.grey,
                    ),
                    label: 'Date of birth',
                    focusNode: dobFocusNode,
                    suffixIcon: null,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Log In',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              debugPrint('register');
                            },
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  const AuthBottun(
                    label: 'Next',
                    width: 160,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          ClipPath(
            clipper: WaveClipperOne(reverse: true),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    dobFocusNode.dispose();

    super.dispose();
  }
}

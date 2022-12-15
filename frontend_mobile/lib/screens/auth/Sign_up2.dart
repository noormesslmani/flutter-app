import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/input.dart';
import 'package:frontend_mobile/widgets/buttons/auth_button.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:frontend_mobile/screens/auth/Sign_up3.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

  static const routeName = '/login';

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;
  late bool _passwordObscureText = true;

  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
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
              height: 120,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Input(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    label: 'Email',
                    focusNode: emailFocusNode,
                    suffixIcon: null,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    label: 'password',
                    focusNode: passwordFocusNode,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            _passwordObscureText = !_passwordObscureText;
                          },
                        );
                      },
                      icon: Icon(
                        _passwordObscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    obscureText: _passwordObscureText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    label: 'confirm Password',
                    focusNode: confirmPasswordFocusNode,
                    suffixIcon: null,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthBottun(
                    label: 'Next',
                    width: 160,
                    handlePress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp3(),
                        ),
                      );
                    },
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
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }
}

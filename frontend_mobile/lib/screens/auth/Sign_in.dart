import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/input.dart';
import 'package:frontend_mobile/widgets/buttons/auth_button.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static const routeName = '/login';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late bool _passwordObscureText = true;
  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
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
            height: 50,
          ),
          Text(
            'Welcome Back',
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).primaryColorDark,
              fontWeight: FontWeight.w700,
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
                      Icons.email,
                      color: Colors.grey,
                    ),
                    label: 'Email',
                    focusNode: emailFocusNode,
                    suffixIcon: null,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Input(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    label: 'Password',
                    obscureText: _passwordObscureText,
                    focusNode: passwordFocusNode,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordObscureText = !_passwordObscureText;
                        });
                      },
                      icon: Icon(
                        _passwordObscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Don't have an account yet? Create One",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const AuthBottun(
                    label: 'Log In',
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          ClipPath(
            clipper: WaveClipperOne(reverse: true),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.16,
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
    super.dispose();
  }
}

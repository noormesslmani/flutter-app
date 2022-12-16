import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/input.dart';
import 'package:frontend_mobile/widgets/buttons/auth_button.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter/gestures.dart';
import 'package:frontend_mobile/screens/auth/Sign_up1.dart';
import 'package:frontend_mobile/widgets/reusable_widgets.dart';
import 'package:frontend_mobile/utilities/validators.dart';

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
  String email = '';
  String password = '';
  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar('Log In', false),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Text(
            'Welcome Back',
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
                    setData: (value) {
                      setState(
                        () {
                          email = value;
                        },
                      );
                      debugPrint(email);
                    },
                    validator: (value) {
                      return Validator.validateEmail(value!);
                    },
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
                    setData: (text) {
                      setState(
                        () {
                          password = text;
                        },
                      );
                      debugPrint(password);
                    },
                    validator: (value) {
                      return Validator.validatePassword(value!);
                    },
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
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account yet? ",
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Create One',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp1(),
                                ),
                              );
                            },
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AuthButton(
                    label: 'Log In',
                    width: double.infinity,
                    handlePress: (() {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
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

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}

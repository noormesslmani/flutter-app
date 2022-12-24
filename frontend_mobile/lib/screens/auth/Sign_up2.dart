import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/input.dart';
import 'package:frontend_mobile/widgets/buttons/auth_button.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:frontend_mobile/utilities/validators.dart';
import 'package:frontend_mobile/widgets/app_bar.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

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
    final _user =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Account Information',
        showBack: true,
        appBar: AppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(
            'Account Information',
            style: TextStyle(
              fontSize: 26,
              color: Colors.grey[800],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Input(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      return Validator.validateEmail(value!);
                    },
                    setData: (value) {
                      setState(
                        () {
                          _user['email'] = value.toString();
                        },
                      );
                    },
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    label: 'Email',
                    focusNode: emailFocusNode,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    validator: (value) {
                      return Validator.validatePassword(value!);
                    },
                    setData: (value) {
                      setState(
                        () {
                          _user['password'] = value.toString();
                        },
                      );
                    },
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
                    validator: (value) {
                      return Validator.confirmPassowrd(
                          value!, _user['password'] as String);
                    },
                    setData: null,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    label: 'confirm Password',
                    focusNode: confirmPasswordFocusNode,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthButton(
                    label: 'Next',
                    width: 160,
                    handlePress: (() {
                      if (_formKey.currentState!.validate()) {
                        setState(
                          () {
                            _user['type'] = 'owner';
                          },
                        );
                        Navigator.of(context)
                            .pushNamed("/signup3", arguments: _user);
                      }
                    }),
                  ),
                ],
              ),
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

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }
}

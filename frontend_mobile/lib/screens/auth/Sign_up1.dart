import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/input.dart';
import 'package:frontend_mobile/widgets/buttons/auth_button.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:frontend_mobile/screens/auth/Sign_up2.dart';
import 'package:frontend_mobile/widgets/reusable_widgets.dart';
import 'package:frontend_mobile/utilities/validators.dart';
import 'package:intl/intl.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({super.key});

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode nameFocusNode;
  late FocusNode dobFocusNode;
  late FocusNode phoneFocusNode;
  final _user = <String, Object>{};
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameFocusNode = FocusNode();
    dobFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar('Sign Up', false),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(
            'Personal Information',
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
                    validator: (value) {
                      return Validator.validateInput(value!);
                    },
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    label: 'Full Name',
                    focusNode: nameFocusNode,
                    suffixIcon: null,
                    obscureText: false,
                    setData: (value) {
                      setState(
                        () {
                          _user['name'] = value;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    validator: (value) {
                      return Validator.validateInput(value!);
                    },
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(
                      Icons.cake,
                      color: Colors.grey,
                    ),
                    label: 'Date of birth',
                    controller: controller,
                    focusNode: dobFocusNode,
                    suffixIcon: null,
                    obscureText: false,
                    ontap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate: DateTime(1910),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          _user['dob'] = formattedDate;
                          controller.text = formattedDate;
                        });
                      }
                    },
                    setData: null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      return Validator.validateInput(value!);
                    },
                    prefixIcon: const Icon(
                      Icons.phone_android,
                      color: Colors.grey,
                    ),
                    label: 'Phone',
                    focusNode: phoneFocusNode,
                    suffixIcon: null,
                    obscureText: false,
                    setData: (value) {
                      setState(
                        () {
                          _user['phone'] = value;
                        },
                      );
                    },
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
                              Navigator.pop(context);
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
                    label: 'Next',
                    width: 160,
                    handlePress: (() {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context)
                            .pushNamed("/signup2", arguments: _user);
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
    nameFocusNode.dispose();
    dobFocusNode.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }
}

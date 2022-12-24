import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/widgets/input.dart';
import 'package:frontend_mobile/widgets/buttons/auth_button.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:frontend_mobile/utilities/validators.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:frontend_mobile/widgets/app_bar.dart';

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
  late FocusNode countryFocusNode;

  final _user = <String, Object>{};
  TextEditingController dobController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameFocusNode = FocusNode();
    dobFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    countryFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Create Account',
        showBack: false,
        appBar: AppBar(),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
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
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    label: 'Full Name',
                    focusNode: nameFocusNode,
                    setData: (value) {
                      setState(
                        () {
                          _user['name'] = value.toString();
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
                    prefixIcon: const Icon(
                      Icons.cake,
                      color: Colors.grey,
                    ),
                    label: 'Date of birth',
                    controller: dobController,
                    focusNode: dobFocusNode,
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
                          _user['dob'] = formattedDate.toString();
                          dobController.text = formattedDate;
                        });
                      }
                    },
                    setData: null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    controller: countryController,
                    validator: (value) {
                      return Validator.validateInput(value!);
                    },
                    prefixIcon: const Icon(
                      Icons.flag,
                      color: Colors.grey,
                    ),
                    label: 'Country',
                    focusNode: countryFocusNode,
                    ontap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode:
                            false, // optional. Shows phone code before the country name.
                        onSelect: (Country country) {
                          countryController.text = country.name.toString();
                          setState(
                            () {
                              _user['country'] = country.name.toString();
                            },
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: IntlPhoneField(
                      validator: (value) {
                        return Validator.validateInput(value!.toString());
                      },
                      focusNode: phoneFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          color: phoneFocusNode.hasFocus
                              ? Theme.of(context).primaryColorDark
                              : Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                            width: 1,
                          ),
                        ),
                      ),
                      initialCountryCode: 'LB',
                      onChanged: (phone) {
                        setState(
                          () {
                            _user['phone'] = phone.completeNumber.toString();
                          },
                        );
                        debugPrint(
                            phone.completeNumber.toString().substring(1));
                      },
                    ),
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
                        debugPrint(_user['country'].toString());
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
            height: 10,
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

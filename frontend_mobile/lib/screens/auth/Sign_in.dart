import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Flutter Walkthroug"),
      ),
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }
}

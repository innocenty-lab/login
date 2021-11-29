import 'package:flutter/material.dart';
import 'package:login/sistemLoginRegister/screens/welcomeScreen/components/body.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}
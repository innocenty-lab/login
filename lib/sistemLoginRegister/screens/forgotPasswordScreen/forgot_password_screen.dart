import 'package:flutter/material.dart';
import 'package:login/sistemLoginRegister/screens/forgotPasswordScreen/components/body.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/constants.dart';
import 'package:login/services/auth_controller.dart';
import 'package:login/sistemLoginRegister/components/backgrounds.dart';
import 'package:login/sistemLoginRegister/components/header_page.dart';
import 'package:login/sistemLoginRegister/components/primary_button.dart';
import 'package:login/sistemLoginRegister/components/text_field.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<Body> {
  final TextEditingController _emailController =
      TextEditingController(text: "putraramadhan532@gmail.com");
  final authC = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomCenterBackground(
      child: Column(
        children: [
          Container(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    //HEADER
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: HeaderPage(),
                    ),

                    //TITLE HALAMAN
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.05),
                      child: Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: AppColor.maindarkBlue,
                        ),
                      ),
                    ),

                    //EMAIL
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: PrimaryTextField(
                        focus: false,
                        correct: true,
                        obscure: false,
                        text: 'Email',
                        icon: Icons.email,
                        controller: _emailController,
                        validator: (value) {
                          if (value == Null || value.isEmpty) {
                            return 'E-mail tidak boleh kosong';
                          }
                        },
                        keyboardType: TextInputType.text,
                      ),
                    ),

                    //TOMBOL OK
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: PrimaryButton(
                        text: 'OK',
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Reset Password Process')),
                            );
                            authC.resetPassword(_emailController.text);
                          }
                        },
                        color: AppColor.fixmaincolor,
                        textColor: Colors.black,
                        width: size.width,
                        shadowColor: Colors.black,
                        borderColor: AppColor.fixmaincolor,
                      ),
                    ),

                    //SUDAH PUNYA AKUN
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Sudah punya akun? ',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: AppColor.fixmaincolor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.back())
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

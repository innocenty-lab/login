import 'package:flutter/material.dart';
import 'package:login/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:login/services/auth_controller.dart';
import 'package:login/sistemLoginRegister/components/backgrounds.dart';
import 'package:login/sistemLoginRegister/components/header_page.dart';
import 'package:login/sistemLoginRegister/components/primary_button.dart';
import 'package:login/sistemLoginRegister/components/second_button.dart';
import 'package:login/sistemLoginRegister/components/text_field.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _emailController =
      TextEditingController(text: "putraramadhan532@gmail.com");
  final TextEditingController _passwordController =
      TextEditingController(text: "123123123");
  final authC = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomCenterBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                'Masuk Akun',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColor.maindarkBlue,
                ),
              ),
            ),

            //FORM LOGIN
            Container(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
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

                      //KATA SANDI
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: PrimaryTextField(
                          focus: false,
                          correct: true,
                          obscure: true,
                          text: 'Kata Sandi',
                          icon: Icons.lock,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Kata Sandi tidak boleh kosong';
                            }
                          },
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),

                      //TOMBOL MASUK
                      PrimaryButton(
                        text: 'Masuk',
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login Process')),
                            );
                            authC.signin(_emailController.text,
                                _passwordController.text, context);
                          }
                        },
                        color: AppColor.fixmaincolor,
                        textColor: Colors.black,
                        width: size.width,
                        shadowColor: Colors.black,
                        borderColor: AppColor.fixmaincolor,
                      ),

                      //LUPA KATA SANDI
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Lupa kata sandi? ',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                                text: 'Ganti sandi',
                                style: TextStyle(
                                  color: AppColor.fixmaincolor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, '/forgot-password');
                                  })
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //PEMBATAS
            Container(
              margin: EdgeInsets.symmetric(vertical: 0.5),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 1.0,
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Atau',
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 1.0,
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //LOGIN SSO
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  //LOGIN GOOGLE
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: SecondButton(
                              text: 'Lanjutkan dengan Google',
                              press: () {},
                              icon: Image.asset('assets/icons/google.png'),
                              color: Colors.white,
                              textColor: Colors.black,
                              borderColor: AppColor.fixsecondarycolor,
                              shadowColor: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  //LOGIN FACEBOOK
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: SecondButton(
                              text: 'Lanjutkan dengan Facebook',
                              press: () {},
                              icon: Image.asset('assets/icons/facebook.png'),
                              color: Colors.white,
                              textColor: Colors.black,
                              borderColor: AppColor.fixsecondarycolor,
                              shadowColor: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/constants.dart';
import 'package:login/sistemLoginRegister/components/backgrounds.dart';
import 'package:login/sistemLoginRegister/components/header_page.dart';
import 'package:login/sistemLoginRegister/components/primary_button.dart';
import 'package:login/sistemLoginRegister/components/second_button.dart';
import 'package:login/sistemLoginRegister/components/text_field.dart';


class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final TextEditingController _userController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

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
              margin: EdgeInsets.only(top: size.height * 0.08),
              child: Text(
                'Masuk Akun',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColor.fixsecondarycolor,
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
      
                      //NAMA PENGGUNA
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: PrimaryTextField(
                          focus: false,
                          correct: true,
                          obscure: false,
                          text: 'Nama Pengguna',
                          icon: Icons.person,
                          controller: _userController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama Pengguna tidak boleh kosong';
                            }
                            return null;
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
                            return null;
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
                            Navigator.pushNamed(context, '/');
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
                                text: 'klik disini',
                                style: TextStyle(
                                  color: AppColor.fixmaincolor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, '/forget-password');
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: size.width * 0.35,
                    image: AssetImage('assets/images/thick-line.png'),
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
                  Image(
                    width: size.width * 0.35,
                    image: AssetImage('assets/images/thick-line.png'),
                  ),
                ],
              ),
            ),
      
            //LOGIN SSO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
                      shadowColor: Colors.black
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
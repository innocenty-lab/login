import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:login/constants.dart';
import 'package:login/services/auth_controller.dart';
import 'package:login/sistemLoginRegister/components/backgrounds.dart';
import 'package:login/sistemLoginRegister/components/header_page.dart';
import 'package:login/sistemLoginRegister/components/primary_button.dart';
import 'package:login/sistemLoginRegister/components/text_field.dart';
import 'package:regexpattern/src/regex_extension.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final TextEditingController _emailController = TextEditingController(text: "putraramadhan532@gmail.com");
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
                'Reset Password',
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
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: PrimaryTextField(
                          focus: false,
                          correct: true,
                          obscure: false,
                          icon: Icons.email,
                          text: 'Email',
                          controller: _emailController,
                          validator: (value) {
                            String email = _emailController.text;

                            if (email == "" || email.isEmpty) {
                              return 'E-mail tidak boleh kosong';
                            } else if (GetUtils.isEmail(email) == false) {
                              return 'E-mail tidak valid! ';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
      
                      //TOMBOL DAFTAR
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: PrimaryButton(
                          text: 'Reset Password',
                          color: AppColor.fixmaincolor,
                          textColor: Colors.black,
                          width: size.width,
                          shadowColor: Colors.black,
                          borderColor: AppColor.fixmaincolor,
                          press:() {
                            // if (_formKey.currentState!.validate()) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //         content: Text('Account Created Successfully')),
                            //   );
                            //   Navigator.pushNamed(context, '/login');
                            // }

                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Reset Process')),
                              );
                              authC.resetPassword(_emailController.text, context);
                            }

                          },
                        ),
                      ),

                      //SUDAH PUNYA AKUN
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sudah punya akun?"),
                          TextButton(
                            onPressed: () => Get.back(), 
                            child: Text("Masuk"),
                            style: TextButton.styleFrom(
                              primary: AppColor.fixmaincolor,
                            )
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }

}
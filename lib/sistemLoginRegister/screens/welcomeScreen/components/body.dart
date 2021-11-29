import 'package:flutter/material.dart';
import 'package:login/constants.dart';
import 'package:login/sistemLoginRegister/components/backgrounds.dart';
import 'package:login/sistemLoginRegister/components/primary_button.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomRightBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.only(bottom: 100, top: 20),
              child: Image(
                image: AssetImage('assets/images/main-logo.png'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColor.maindarkBlue,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Text(
                'Para mahasiswa Kampus Gratis yang siap menjadi penerus bangsa Indonesia!',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: PrimaryButton(
                text: 'Masuk',
                press: () {
                  Navigator.pushNamed(context, '/login');
                },
                color: AppColor.fixmaincolor,
                textColor: Colors.black,
                width: size.width * 0.5,
                shadowColor: Colors.black,
                borderColor: AppColor.fixmaincolor,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: PrimaryButton(
                text: 'Daftar',
                press: () {
                  Navigator.pushNamed(context, '/register');
                },
                color: Colors.white,
                textColor: Colors.black,
                width: size.width * 0.5,
                shadowColor: Colors.black,
                borderColor: AppColor.fixmaincolor
              ),
            )

          ],
        ),
      ),
    );
  }
}
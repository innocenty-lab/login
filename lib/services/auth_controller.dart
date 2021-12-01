import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login/constants.dart';
import 'package:login/screens/homeScreen/home_screen.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void signin(String email, String password, BuildContext context) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );

      print("cek data : ${myUser.user?.emailVerified}");

      if (myUser.user!.emailVerified) {
        Get.offAll(HomeScreen());
      } else {
        Get.defaultDialog(
          title: "Verification Email",
          middleText: "Email perlu diverifikasi terlebih dahulu, Verifikasi ulang?",
          onConfirm: () async {
            Get.back();
            try {
              // await myUser.user!.sendEmailVerification();
              await FirebaseAuth.instance.currentUser?.sendEmailVerification();
              Get.defaultDialog(
                title: "Verification Email",
                middleText: "Email verifikasi telah dikirimkan ke $email",
                onConfirm: () {
                  Get.back();
                },
                textConfirm: "Oke, Saya akan cek email",
                buttonColor: AppColor.fixmaincolor,
                confirmTextColor: Colors.black,
              );
            } catch(e) {
              if (e.toString().contains("We have blocked all requests from this device due to unusual activity. Try again later.")) {
                // Get.snackbar();
                Get.defaultDialog(
                  title: "Verification Email",
                  middleText: "Silahkan verifikasi beberapa waktu lagi",
                  onConfirm: () {
                    Get.back();
                  },
                  textConfirm: "Oke",
                  buttonColor: AppColor.fixmaincolor,
                  confirmTextColor: Colors.black,
                );
              }
            }

            // Get.back();
            // Get.defaultDialog(
            //   title: "Verification Email",
            //   middleText: "Email verifikasi telah dikirimkan ke $email",
            //   onConfirm: () {
            //     Get.back();
            //   },
            //   textConfirm: "Oke, Saya akan cek email",
            //   buttonColor: AppColor.fixmaincolor,
            //   confirmTextColor: Colors.black,
            // );
          },
          textConfirm: "Kirim ulang",
          textCancel: "Kembali",
          buttonColor: AppColor.fixmaincolor,
          confirmTextColor: Colors.black,
          cancelTextColor:Colors.black,
        );
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "No user found for that email.",
          onConfirm: () {
            Get.back();
          },
          textConfirm: "Oke.",
          confirmTextColor: Colors.black,
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Wrong password provided for that user.",
          onConfirm: () {
            Get.back();
          },
          textConfirm: "Oke.",
          confirmTextColor: Colors.black,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  bool isUserAlreadyLogin() {
    FirebaseAuth fUser = FirebaseAuth.instance;

    return fUser.currentUser != null && (fUser.currentUser?.emailVerified?? false);
  }

  void signup(String email, String password, BuildContext context) async {
    try {
      final UserCredential myUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
        title: "Verification Email",
        middleText: "Email verifikasi telah dikirimkan ke $email",
        onConfirm: () {
          // Get.back(); //menutup message dialog
          // Get.back(); //kembali ke halaman login
          // Get.offAllNamed("/login");

          FirebaseAuth fUser = FirebaseAuth.instance;

          if (fUser.currentUser != null) {
            FirebaseAuth.instance.signOut();
          }

          Get.offAllNamed("/login");
        },
        textConfirm: "Oke, Saya akan cek email",
        buttonColor: AppColor.fixmaincolor,
        confirmTextColor: Colors.black,
      );
      // Get.offAllNamed("/");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "The password provided is too weak",
          onConfirm: () {
            Get.back();
          },
          textConfirm: "Oke.",
          confirmTextColor: Colors.black,
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "The account already exists for that email.",
          onConfirm: () {
            Get.back();
          },
          textConfirm: "Oke.",
          confirmTextColor: Colors.black,
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Account could not be registered.",
        onConfirm: () {
          Get.back();
        },
        textConfirm: "Oke.",
        confirmTextColor: Colors.black,
      );
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed("/welcome");
  }
}
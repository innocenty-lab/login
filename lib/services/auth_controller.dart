// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:login/constants.dart';
import 'package:login/screens/homeScreen/home_screen.dart';
// import 'package:login/services/auth_api.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  // void setAuth(String email) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('email', 'useremail@gmail.com');
  // }

  void signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(credential);
    UserCredential userCredential = await auth.signInWithCredential(credential);
    print("cek data : ${userCredential.user?.emailVerified}");
    Get.offAll(HomeScreen());
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  void signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    // return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    UserCredential userCredential = await auth.signInWithCredential(facebookAuthCredential);
    print("cek data : ${userCredential.user?.emailVerified}");
    Get.offAll(HomeScreen());
  }

  void signin(String email, String password, BuildContext context) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      print("cek data : ${myUser.user?.emailVerified}");

      if (myUser.user!.emailVerified) {

        // var token = await auth.currentUser!.getIdToken();
        // print(token);
        // var data = {'Firebasetoken': token};
        // var res = await Network().authData(data, '/login');
        // var body = json.decode(res.body);
        // print(body);
        // if (body['success']) {
        //   SharedPreferences localStorage =
        //       await SharedPreferences.getInstance();
        //   localStorage.setString(
        //       'token', json.encode(body['access_token']).replaceAll('"', ''));
        //   localStorage.setString(
        //       'email', json.encode(body['email']).replaceAll('"', ''));
        //   localStorage.setString(
        //       'name', json.encode(body['name']).replaceAll('"', ''));
        //   print(token);
        //   Get.offAllNamed('/');
        // } else {
        //   print("gagal");
        // }

        Get.offAll(HomeScreen());
        // Get.offAllNamed("/");
      } else {
        Get.defaultDialog(
          title: "Verification Email",
          middleText:
              "Email perlu diverifikasi terlebih dahulu, Verifikasi ulang?",
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
            } catch (e) {
              if (e.toString().contains(
                  "We have blocked all requests from this device due to unusual activity. Try again later.")) {
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
          cancelTextColor: Colors.black,
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

    return fUser.currentUser != null &&
        (fUser.currentUser?.emailVerified ?? false);
  }

  void signup(String email, String password, BuildContext context) async {
    try {
      final UserCredential myUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
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

          Get.offAllNamed("/welcome");
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

  void resetPassword(String email) async {
    if (email != '' && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
            title: 'Berhasil',
            middleText: 'Kami telah mengirimkan reset password ke $email',
            onConfirm: () {
              Get.back(); //close dialog
              Get.back(); //go to login page
            },
            textConfirm: 'OK');
      } catch (e) {
        Get.defaultDialog(
            title: 'Terjadi Kesalahan',
            middleText: 'Tidak dapat mengirimkan reset password');
      }
    } else {
      Get.defaultDialog(
          title: 'Terjadi Kesalahan', middleText: 'Email tidak valid');
    }
  }
}

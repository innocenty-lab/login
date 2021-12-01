// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/routes/app_pages.dart';
import 'package:login/screens/splashScreen/splash_screen.dart';
// import 'package:login/screens/splashScreen/splash_screen.dart';
import 'package:login/services/auth_controller.dart';

// import 'package:login/sistemLoginRegister/components/loading.dart';
// import 'package:login/screens/splashScreen/splash_screen.dart';
import 'package:login/screens/homeScreen/home_screen.dart';
// import 'package:login/sistemLoginRegister/screens/loginScreen/login_screen.dart';
// import 'package:login/sistemLoginRegister/screens/welcomeScreen/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       onGenerateRoute: RouteGenerator.generateRoute,
//       debugShowCheckedModeBanner: false,
//       title: 'Kampus Gratis',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final authC = Get.put(AuthController(), permanent: true);
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Kampus Gratis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SplashScreen(),
      // home: snapshot.data != null ? HomeScreen() : SplashScreen(),
      // home: authC.isUserAlreadyLogin() ? HomeScreen() : WelcomeScreen(),
      home: authC.isUserAlreadyLogin() ? HomeScreen() : SplashScreen(),
    );
  }
}
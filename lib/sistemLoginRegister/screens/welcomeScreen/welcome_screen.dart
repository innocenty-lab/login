import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:login/services/auth_controller.dart';

// import 'package:login/screens/homeScreen/home_screen.dart';
// import 'package:login/sistemLoginRegister/components/loading.dart';
import 'package:login/sistemLoginRegister/screens/welcomeScreen/components/body.dart';

// class WelcomeScreen extends StatelessWidget {
//   WelcomeScreen({Key? key}) : super(key: key);
//   final authC = Get.put(AuthController(), permanent: true);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: authC.streamAuthStatus,
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         print(snapshot);

//         if (snapshot.connectionState == ConnectionState.active) {
//           print(snapshot.data);

//           return Scaffold(
//             body: SafeArea(
//               child: snapshot.data != null ? HomeScreen() : Body()
//             ),
//           );
//         }
        
//         return LoadingView();
//       },
//     );
//   }
// }

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}
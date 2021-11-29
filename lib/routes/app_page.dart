import 'package:flutter/material.dart';
import 'package:login/sistemLoginRegister/screens/loginScreen/login_screen.dart';
import 'package:login/sistemLoginRegister/screens/registerscreen/register_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(builder: (_) => MyApp());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      // case '/':
      //   return MaterialPageRoute(builder: (_) => Bottom_Navbar());
      // case '/login':
      //   return MaterialPageRoute(builder: (_) => LoginPage());
      // case '/register':
      //   return MaterialPageRoute(builder: (_) => RegisterPage());
      // case '/beranda':
      //   return MaterialPageRoute(builder: (_) => Beranda());
      // case '/kursus':
      //   return MaterialPageRoute(builder: (_) => Kursus());
      // case '/bookmark':
      //   return MaterialPageRoute(builder: (_) => Bookmarks());
      // case '/berandaAQF':
      //   return MaterialPageRoute(builder: (_) => BerandaAQF());
      // case '/my_learning':
      //   return MaterialPageRoute(builder: (_) => BodyLearning());
      // case '/mata_kuliah':
      //   List<dynamic> args = settings.arguments as List<dynamic>;
      //   return MaterialPageRoute(
      //       builder: (_) => MataKuliahPage(
      //             enroll: args[0] as Enroll,
      //             provider: args[1] as EnrollProvider,
      //           ));
      // case '/pertemuan':
      //   List<dynamic> args = settings.arguments as List<dynamic>;
      //   return MaterialPageRoute(
      //       builder: (_) => PertemuanPage(
      //             enroll: args[0] as Enroll,
      //             provider: args[1] as EnrollProvider,
      //           ));
      // case '/content_learning':
      //   return MaterialPageRoute(builder: (_) => ContentLearning());
      // // return MaterialPageRoute(
      // //     builder: (context) => ContentLearning(
      // //           enroll: ModalRoute.of(context)?.settings.arguments as String,
      // //         ));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(
          child: Text("Error page"),
        ),
      );
    });
  }
}

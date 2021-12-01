import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/services/auth_controller.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home SCreen"),
        actions: [
          IconButton(
            onPressed: () => authC.logout(), 
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text("Halo")
      ),
    );
  }
}
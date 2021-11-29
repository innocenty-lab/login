import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // GestureDetector(
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          //   child: Icon(Icons.arrow_back_ios),
          // ),
          Image(
            height: 50,
            image: AssetImage("assets/images/small-logo.png"),
          ),
        ],
      ),
    );
  }
}
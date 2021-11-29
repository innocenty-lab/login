import 'package:flutter/material.dart';

class BottomCenterBackground extends StatelessWidget {
  final Widget child;
  const BottomCenterBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Image(
              image: AssetImage('assets/images/bottom-center.png'),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class BottomRightBackground extends StatelessWidget {
  final Widget child;
  const BottomRightBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image(
              image: AssetImage('assets/images/bottom-right.png'),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

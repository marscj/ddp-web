import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double width;
  final double height;

  LogoWidget({Key? key, this.width = 60, this.height = 80}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/LOGO-1-1.png',
      ),
    );
  }
}

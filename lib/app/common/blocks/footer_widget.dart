import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: footerHeight,
      color: Colors.indigo.shade900,
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: Text(
          'footer',
        ),
      ),
    );
  }
}

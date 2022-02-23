import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobaleFooter extends GetResponsiveWidget {
  GlobaleFooter({Key? key}) : super(key: key);

  @override
  Widget builder() {
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

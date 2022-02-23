import 'package:ddp_web/app/common/blocks/section.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobaleFooter extends GetResponsiveWidget {
  GlobaleFooter({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Section(
        size: Size.fromHeight(footerHeight),
        child: Container(
          color: Colors.indigo.shade900,
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: Text(
              'footer',
            ),
          ),
        ));
  }
}

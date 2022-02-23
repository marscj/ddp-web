import 'package:ddp_web/app/common/blocks/section.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBar extends GetResponsiveWidget {
  TabBar({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Section(
      size: Size.fromHeight(footerHeight),
      backgroundColor: Colors.white,
      elevation: 1,
      margin: EdgeInsets.only(bottom: 1),
      child: Container(),
    );
  }
}

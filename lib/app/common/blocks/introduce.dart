import 'package:ddp_web/app/common/widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Introduce extends GetResponsiveWidget {
  final String? title;
  final String? desc;
  final Widget? logo;

  Introduce({Key? key, this.title, this.desc, this.logo}) : super(key: key);

  @override
  Widget builder() {
    return Container(
      height: 10,
      width: 10,
      child: [
        Text(title ?? ''),
        logo ?? SizedBox.shrink(),
        Container(
          child: Text(desc ?? ''),
        )
      ].col().paddingAll(16).cardHover(),
    );
  }
}

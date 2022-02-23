import 'package:auto_size_text/auto_size_text.dart';
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
    return [
      Text(title ?? ''),
      logo ?? SizedBox.shrink(),
      AutoSizeText(desc ?? '')
    ].col().cardHover();
  }
}

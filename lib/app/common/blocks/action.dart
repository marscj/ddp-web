import 'package:ddp_web/app/common/widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallOfAction extends GetResponsiveWidget {
  final String? title;
  final String? desc;
  final Widget? action;

  CallOfAction({
    Key? key,
    this.title,
    this.desc,
    this.action,
  }) : super(key: key);

  @override
  Widget builder() {
    return [Text(title ?? ''), Text(desc ?? ''), action ?? SizedBox.shrink()]
        .col()
        .paddingAll(16)
        .cardHover();
  }
}

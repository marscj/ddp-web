import 'package:auto_size_text/auto_size_text.dart';
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
    return [
      Text(
        title ?? '',
        style: Get.theme.textTheme.headline3?.copyWith(color: Colors.white),
      ),
      SizedBox(
        height: 10,
      ),
      AutoSizeText(
        desc ?? '',
        style: Get.theme.textTheme.titleSmall?.copyWith(color: Colors.white),
      ).responsive(),
      SizedBox(
        height: 30,
      ),
      action ?? SizedBox.shrink()
    ].col().paddingAll(16).responsive();
  }
}

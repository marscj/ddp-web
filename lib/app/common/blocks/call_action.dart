import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ddp_web/app/common/extensions/text.dart';
import 'package:ddp_web/app/common/extensions/position.dart';
import 'package:ddp_web/app/common/extensions/widget.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';

class CallOfAction extends GetResponsiveWidget {
  final String? title;
  final String? desc;
  final Widget? action;
  final Color? color;

  CallOfAction({
    Key? key,
    this.title,
    this.desc,
    this.action,
    this.color,
  }) : super(key: key);

  @override
  Widget builder() {
    return [
      Text(
        title ?? '',
        style: Get.theme.textTheme.headline3
            ?.copyWith(color: Colors.white, overflow: TextOverflow.fade),
        maxLines: 1,
      ).h1().align(alignment: Alignment.centerLeft),
      SizedBox(
        height: 10,
      ),
      Text(
        desc ?? '',
        style: Get.theme.textTheme.titleSmall
            ?.copyWith(color: Colors.white, overflow: TextOverflow.fade),
        maxLines: 8,
      ).align(alignment: Alignment.centerLeft),
      SizedBox(
        height: 40,
      ),
      action?.align(alignment: Alignment.centerLeft) ?? SizedBox.shrink()
    ]
        .col(mainAxisAlignment: MainAxisAlignment.center)
        .paddingAll(16)
        .semantics(color: color)
        .responsive();
  }
}
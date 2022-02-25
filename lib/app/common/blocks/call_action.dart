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
        maxLines: 1,
      ).w64(color: Colors.white).align(alignment: Alignment.centerLeft),
      SizedBox(
        height: 10,
      ),
      Text(
        desc ?? '',
        maxLines: 8,
      ).w24(color: Colors.white).align(alignment: Alignment.centerLeft),
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

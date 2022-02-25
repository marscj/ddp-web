import 'package:ddp_web/app/common/blocks/blocks.dart';
import 'package:ddp_web/app/common/widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextBuilder extends GetResponsiveWidget {
  final TextStyle style;
  final Widget child;

  TextBuilder({Key? key, required this.style, required this.child})
      : super(key: key);

  @override
  Widget builder() {
    return DefaultTextStyle(style: style, child: child);
  }
}

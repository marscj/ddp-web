import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section extends GetResponsiveWidget {
  final double height;
  final Color? backgroundColor;
  final DecorationImage? backgroundImage;
  final Widget child;

  Section({
    Key? key,
    required this.child,
    this.height = 0,
    this.backgroundColor,
    this.backgroundImage,
  }) : super(key: key);

  @override
  Widget builder() {
    return SizedBox.fromSize(
      size: Size.fromHeight(height),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          image: backgroundImage,
        ),
        child: child,
      ),
    );
  }
}

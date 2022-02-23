import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section extends GetResponsiveWidget {
  final Size size;
  final Color? backgroundColor;
  final DecorationImage? backgroundImage;
  final Widget child;

  Section({
    Key? key,
    required this.child,
    this.size = Size.infinite,
    this.backgroundColor,
    this.backgroundImage,
  }) : super(key: key);

  @override
  Widget builder() {
    return SizedBox.fromSize(
      size: size,
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

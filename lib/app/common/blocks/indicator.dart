import 'package:ddp_web/plugs/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Indicator extends GetResponsiveWidget {
  final int count;
  final double position;
  final ValueChanged<double>? onTap;

  Indicator({
    Key? key,
    this.count = 0,
    this.position = 0.0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget builder() {
    return DotsIndicator(
      dotsCount: count,
      position: position,
      onTap: onTap,
      decorator: DotsDecorator(
        size: Size(10.0, 10.0),
        activeSize: Size(12.0, 6.0),
        spacing: EdgeInsets.all(10.0),
        color: Colors.grey.shade200,
        activeColor: Colors.grey.shade200,
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      ),
    );
  }
}

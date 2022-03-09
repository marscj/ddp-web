import 'package:flutter/widgets.dart';

extension ExtensionPosition on Widget {
  Widget center() => Center(child: this);

  Widget align({Alignment alignment = Alignment.center}) =>
      Align(alignment: alignment, child: this);

  Widget positioned(
          {double? left = 0,
          double? right = 0,
          double? top = 0,
          double? bottom = 0,
          double? width,
          double? height}) =>
      Positioned(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
        width: width,
        height: height,
        child: this,
      );

  Widget size({size}) => SizedBox.fromSize(size: size);
}

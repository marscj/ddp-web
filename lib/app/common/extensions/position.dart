import 'package:flutter/widgets.dart';

extension ExtensionPosition on Widget {
  Widget center() => Center(child: this);

  Widget align({Alignment alignment = Alignment.center}) =>
      Align(alignment: alignment, child: this);

  Widget positioned(
          {double? left,
          double? right,
          double? top,
          double? bottom,
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

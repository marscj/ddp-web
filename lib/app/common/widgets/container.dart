import 'package:ddp_web/app/common/widgets/responsive.dart';
import 'package:flutter/material.dart';

class MContainer extends StatelessWidget {
  final Size? size;
  final Color? color;
  final DecorationImage? image;
  final Widget child;
  final MaterialType type;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? shadowColor;
  final double elevation;
  final ShapeBorder? shape;

  MContainer({
    Key? key,
    required this.child,
    this.size,
    this.color,
    this.image,
    this.shadowColor,
    this.margin,
    this.padding,
    this.elevation = 0.0,
    this.shape,
    this.type = MaterialType.canvas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Material(
        type: type,
        shadowColor: shadowColor ?? Theme.of(context).shadowColor,
        elevation: elevation,
        shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        color: color ?? Colors.transparent,
        child: SizedBox.fromSize(
          size: size,
          child: Container(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: image,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

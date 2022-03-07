import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Senses extends GetResponsiveWidget {
  final Size? size;
  final Color? color;
  final DecorationImage? image;
  final Widget child;
  final MaterialType type;
  final EdgeInsets? margin;
  final Color? shadowColor;
  final double elevation;
  final ShapeBorder? shape;

  Senses({
    Key? key,
    required this.child,
    this.size,
    this.color,
    this.image,
    this.shadowColor,
    this.margin,
    this.elevation = 0.0,
    this.shape,
    this.type = MaterialType.canvas,
  }) : super(key: key);

  @override
  Widget builder() {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      child: Material(
        type: type,
        shadowColor: shadowColor ?? Theme.of(screen.context).shadowColor,
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

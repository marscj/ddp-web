import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section extends GetResponsiveWidget {
  final Size? size;
  final Color? backgroundColor;
  final DecorationImage? backgroundImage;
  final Widget child;

  final EdgeInsets? margin;
  final Color? shadowColor;
  final double elevation;
  final ShapeBorder? shape;

  Section({
    Key? key,
    required this.child,
    this.size,
    this.backgroundColor,
    this.backgroundImage,
    this.shadowColor,
    this.margin,
    this.elevation = 0.0,
    this.shape,
  }) : super(key: key);

  @override
  Widget builder() {
    return Semantics(
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        child: Material(
          type: MaterialType.card,
          shadowColor: shadowColor ?? Theme.of(screen.context).shadowColor,
          elevation: elevation,
          shape:
              shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          color: backgroundColor,
          child: Semantics(
            explicitChildNodes: true,
            child: SizedBox.fromSize(
              size: size,
              child: Container(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: backgroundImage,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // SizedBox.fromSize(
    //   size: size,
    //   child: DecoratedBox(
    //     decoration: BoxDecoration(
    //         color: backgroundColor,
    //         image: backgroundImage,
    //         boxShadow: shadow
    //             ? [
    //                 BoxShadow(
    //                   color: Colors.grey.withOpacity(0.3),
    //                   spreadRadius: 2,
    //                   blurRadius: 1,
    //                   offset: Offset(0, 1),
    //                 ),
    //               ]
    //             : null),
    //     child: child,
    //   ),
    // );
  }
}

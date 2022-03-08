import 'package:ddp_web/app/common/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:ddp_web/app/common/widgets/responsive.dart';
import 'package:ddp_web/app/common/widgets/hover.dart';

extension ExtensionWidget on Widget {
  ResponsiveWidget responsive({
    limitScreen = true,
  }) =>
      ResponsiveWidget(
        responsiveBuilder: (context, screen) {
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: limitScreen
                      ? screen.responsiveValue<double>(
                              desktop: screen.settings.desktopChangePoint,
                              tablet: screen.width - 64,
                              mobile: screen.width - 32,
                              watch: screen.width - 16) ??
                          screen.width
                      : screen.width),
              child: this,
            ),
          );
        },
      );

  Widget visibility(
    visibleWhen, {
    Widget? replacement,
  }) {
    return ResponsiveWidget(
      responsiveBuilder: (context, screen) => Visibility(
        child: this,
        replacement: replacement ?? SizedBox.shrink(),
        visible: visibleWhen.contains(screen.screenType),
      ),
    );
  }

  Widget container({
    Size? size,
    Color? color,
    DecorationImage? image,
    MaterialType type = MaterialType.canvas,
    EdgeInsets? margin,
    Color? shadowColor,
    double elevation = 0,
    ShapeBorder? shape,
  }) =>
      ResponsiveWidget(
        responsiveBuilder: (context, screen) => MContainer(
          size: size,
          color: color,
          image: image,
          type: type,
          margin: margin,
          shadowColor: shadowColor,
          elevation: elevation,
          shape: shape,
          child: this,
        ),
      );

  Widget shadowHover() => Hover(
        builder: (isHovered) => Card(elevation: isHovered ? 4 : 2, child: this),
      );

  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);
}

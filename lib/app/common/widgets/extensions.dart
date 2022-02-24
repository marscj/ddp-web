import 'package:ddp_web/app/common/blocks/hover.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:get/get.dart';

class ResponsiveValue<T> {
  final T? mobile;
  final T? tablet;
  final T? desktop;
  final T? watch;

  ResponsiveValue({this.mobile, this.tablet, this.desktop, this.watch});

  T? value(screen) => screen.responsiveValue(
      desktop: desktop, tablet: tablet, mobile: mobile, watch: watch);
}

typedef ResponsiveWidgetBuilder = Widget Function(
    BuildContext context, ResponsiveScreen screen);

class ResponsiveWidget extends GetResponsiveWidget {
  final ResponsiveWidgetBuilder responsiveBuilder;

  ResponsiveWidget({Key? key, required this.responsiveBuilder})
      : super(
            key: key,
            settings: ResponsiveScreenSettings(
              desktopChangePoint: 1200,
              tabletChangePoint: 800,
            ));

  @override
  Widget builder() {
    return responsiveBuilder(screen.context, screen);
  }
}

extension ExtensionWidget on Widget {
  ResponsiveWidget responsive({
    limitScreen = true,
  }) =>
      ResponsiveWidget(
        responsiveBuilder: (context, screen) {
          double _maxWidth = screen.responsiveValue<double>(
                  desktop: screen.settings.desktopChangePoint,
                  tablet: screen.width - 64,
                  mobile: screen.width - 32,
                  watch: screen.width - 16) ??
              screen.width;

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: limitScreen ? _maxWidth : screen.width),
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

  Widget semantics({
    Size? size,
    Color? backgroundColor,
    DecorationImage? backgroundImage,
    MaterialType type = MaterialType.canvas,
    EdgeInsets? margin,
    Color? shadowColor,
    double elevation = 0,
    ShapeBorder? shape,
  }) =>
      ResponsiveWidget(
        responsiveBuilder: (context, screen) => Semantics(
          child: Container(
            margin: margin ?? EdgeInsets.zero,
            child: Material(
              type: type,
              shadowColor: shadowColor ?? Theme.of(context).shadowColor,
              elevation: elevation,
              shape: shape ??
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              color: backgroundColor ?? Colors.transparent,
              child: Semantics(
                explicitChildNodes: true,
                child: SizedBox.fromSize(
                  size: size,
                  child: Container(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: backgroundImage,
                      ),
                      child: this,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

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

  Widget fade(value) => AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (child, animate) {
          return FadeTransition(opacity: animate, child: child);
        },
        child: Container(key: ValueKey(value), child: this),
      );

  Widget shadowHover() => Hover(
        builder: (isHovered) => Card(elevation: isHovered ? 4 : 2, child: this),
      );

  Widget card() => Card(
        elevation: 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: this,
      );

  Widget expanded({flex = 1}) => Expanded(flex: flex, child: this);
}

extension ExtensionListWidget on List<Widget> {
  Iterable<Widget> divider(
      {BuildContext? context, Color? color, Border? border}) {
    assert(color != null || context != null);

    if (isEmpty || length == 1) {
      return this;
    }

    Widget wrapTile(Widget child) {
      return DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          border: border ??
              Border(
                right: Divider.createBorderSide(context, color: color),
              ),
        ),
        child: child,
      );
    }

    return <Widget>[
      ...take(length - 1).map(wrapTile),
      last,
    ];
  }

  Widget row(
          {MainAxisAlignment? mainAxisAlignment,
          CrossAxisAlignment? crossAxisAlignment}) =>
      Row(
        children: this,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      );

  Widget col(
          {MainAxisAlignment? mainAxisAlignment,
          CrossAxisAlignment? crossAxisAlignment}) =>
      Column(
        children: this,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      );

  Widget stack({StackFit fit = StackFit.loose}) =>
      Stack(children: this, fit: fit);

  Widget grid(
          {double? mainAxisSpacing,
          double? crossAxisSpacing,
          ResponsiveValue<double>? extent}) =>
      ResponsiveWidget(responsiveBuilder: (context, screen) {
        // List<int> rowCount = [1, 1, 2, 3];
        // List<double> rowRatio = [1, 1.5, 1.25, 0.9];
        // List<double> rowExtent = [120, 220, 320, 420];

        // GridView.count(
        //   shrinkWrap: true,
        //   physics: NeverScrollableScrollPhysics(),
        //   crossAxisCount: rowCount[screen.screenType.index],
        //   mainAxisSpacing: mainAxisSpacing,
        //   crossAxisSpacing: crossAxisSpacing,
        //   childAspectRatio: rowRatio[screen.screenType.index],
        //   children: this,
        // );

        return GridView.custom(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: mainAxisSpacing ?? 0.0,
                crossAxisSpacing: crossAxisSpacing ?? 0.0,
                mainAxisExtent: extent?.value(screen) ?? 400.0,
                crossAxisCount: screen.responsiveValue<int>(
                    desktop: 3, tablet: 2, mobile: 1, watch: 1)!),
            childrenDelegate: SliverChildListDelegate.fixed(this));
      });

  Widget warp({mainAxisSpacing, crossAxisSpacing}) => ResponsiveWidget(
      responsiveBuilder: (context, screen) =>
          Wrap(children: this, spacing: 8.0, runSpacing: 4.0));
}

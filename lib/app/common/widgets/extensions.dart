import 'package:ddp_web/app/common/blocks/hover.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:get/get.dart';

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
  ResponsiveWidget responsive({limitScreen = true}) => ResponsiveWidget(
        responsiveBuilder: (context, screen) {
          List<double> screenSize = [
            screen.width - 16,
            screen.width - 32,
            screen.width - 64,
            screen.settings.desktopChangePoint,
          ];

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: limitScreen
                      ? screenSize[screen.screenType.index]
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
    List<ScreenType> _typs = [
      ScreenType.Desktop,
      ScreenType.Phone,
      ScreenType.Tablet,
      ScreenType.Watch
    ];
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

  Widget align({alignment = Alignment.center}) =>
      Align(alignment: alignment, child: this);

  Widget positioned({left, right, top, bottom, width, height}) => Positioned(
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

  Widget cardHover() => Hover(
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

  Widget row({mainAxisAlignment, crossAxisAlignment}) => Row(
        children: this,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      );

  Widget col({mainAxisAlignment, crossAxisAlignment}) => Column(
        children: this,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      );

  Widget stack({fit = StackFit.loose}) => Stack(children: this, fit: fit);

  Widget grid({mainAxisSpacing, crossAxisSpacing}) =>
      ResponsiveWidget(responsiveBuilder: (context, screen) {
        List<int> rowCount = [1, 1, 2, 3];
        List<double> rowRatio = [1, 1.5, 1.25, 0.9];
        List<double> rowExtent = [120, 220, 320, 420];

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
              mainAxisSpacing: mainAxisSpacing,
              crossAxisSpacing: crossAxisSpacing,
              mainAxisExtent: 420,
              crossAxisCount: rowCount[screen.screenType.index],
            ),
            childrenDelegate: SliverChildListDelegate.fixed(this));
      });

  Widget warp({mainAxisSpacing, crossAxisSpacing}) => ResponsiveWidget(
      responsiveBuilder: (context, screen) =>
          Wrap(children: this, spacing: 8.0, runSpacing: 4.0));
}

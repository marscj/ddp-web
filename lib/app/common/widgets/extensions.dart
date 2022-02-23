import 'package:ddp_web/app/common/blocks/hover.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

typedef ResponsiveWidgetBuilder = Widget Function(
    BuildContext context, ResponsiveScreen screen);

class ResponsiveWidget extends GetResponsiveWidget {
  final ResponsiveWidgetBuilder responsiveBuilder;

  ResponsiveWidget({Key? key, required this.responsiveBuilder})
      : super(key: key);

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
            screen.settings.tabletChangePoint,
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

  Widget center() => Center(child: this);

  Widget align({alignment = Alignment.center}) =>
      Align(alignment: alignment, child: this);

  Widget positioned({left, right, top, bottom}) => Positioned(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
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

  Widget stack() => Stack(children: this);

  Widget grid({mainAxisSpacing, crossAxisSpacing}) => ResponsiveWidget(
      responsiveBuilder: (context, screen) => GridView.count(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            crossAxisCount:
                screen.screenType.index > 0 ? screen.screenType.index : 1,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
            children: this,
          ));

  Widget warp({mainAxisSpacing, crossAxisSpacing}) => ResponsiveWidget(
      responsiveBuilder: (context, screen) =>
          Wrap(children: this, spacing: 8.0, runSpacing: 4.0));
}

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

extension WidgetExtra on Widget {
  Widget limitSize(ResponsiveScreen screen,
      {align = Alignment.center, double flex = 1.0}) {
    double maxWidget = screen.isDesktop
        ? screen.settings.desktopChangePoint
        : screen.isTablet
            ? screen.settings.tabletChangePoint
            : screen.width;

    return Align(
      alignment: align,
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        constraints: BoxConstraints(maxWidth: maxWidget * flex),
        child: this,
      ),
    );
  }

  Widget card() => Card(
        elevation: 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: this,
      );
}

extension WidgetListExtra on List<Widget> {
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

  Widget row(ResponsiveScreen screen) => Row(children: this);

  Widget col(ResponsiveScreen screen) => Column(children: this);

  Widget grid(ResponsiveScreen screen) => GridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: screen.screenType.index,
        children: this,
      );
}

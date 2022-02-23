import 'package:ddp_web/app/common/widgets/hover.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

typedef ResponsiveWidgetBuilder = Widget Function(
    BuildContext context, ResponsiveScreen screen);

class ResponsiveWidget extends GetResponsiveWidget {
  final ResponsiveWidgetBuilder responsiveBuilder;
  final bool limitScreen;

  ResponsiveWidget(
      {Key? key, required this.responsiveBuilder, this.limitScreen = true})
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
            screen.width,
            screen.width,
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
  ResponsiveWidget cardHover() => ResponsiveWidget(
      responsiveBuilder: (context, screen) => Hover(
          builder: (isHovered) =>
              Card(elevation: isHovered ? 4 : 2, child: this)));

  ResponsiveWidget card() => ResponsiveWidget(
      responsiveBuilder: (context, screen) => Card(
            elevation: 1,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            child: this,
          ));
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

  ResponsiveWidget row() => ResponsiveWidget(
      responsiveBuilder: (context, screen) => Row(children: this));

  ResponsiveWidget col() => ResponsiveWidget(
      responsiveBuilder: (context, screen) => Column(children: this));

  ResponsiveWidget grid({mainAxisSpacing, crossAxisSpacing}) =>
      ResponsiveWidget(
          responsiveBuilder: (context, screen) => GridView.count(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                crossAxisCount: screen.screenType.index,
                mainAxisSpacing: mainAxisSpacing,
                crossAxisSpacing: crossAxisSpacing,
                children: this,
              ));

  ResponsiveWidget warp({mainAxisSpacing, crossAxisSpacing}) =>
      ResponsiveWidget(
          responsiveBuilder: (context, screen) =>
              Wrap(children: this, spacing: 8.0, runSpacing: 4.0));
}

import 'package:flutter/material.dart';
import 'package:ddp_web/app/common/widgets/responsive.dart';

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
      ResponsiveWidget(responsive: (context, screen) {
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

  Widget warp({mainAxisSpacing, crossAxisSpacing}) => Wrap(
        children: this,
      );
}

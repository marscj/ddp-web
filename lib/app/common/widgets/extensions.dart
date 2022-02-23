import 'package:flutter/material.dart';

extension WidgetExtra on Widget {
  Widget limitSize(double maxWidth, {align = Alignment.center}) => Align(
        alignment: align,
        child: Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: this,
        ),
      );

  Widget card() => Card(
        elevation: 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: this,
      );
}

extension WidgetListExtra on Iterable<Widget> {
  Iterable<Widget> divider(
      {BuildContext? context, Color? color, Border? border}) {
    // assert(color != null || context != null);

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
}

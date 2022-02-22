import 'package:flutter/widgets.dart';

extension WidgetExtra on Widget {
  Widget constraints(double maxWidth) => Center(
        child: Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: this,
        ),
      );
}

import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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

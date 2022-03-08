import 'package:ddp_web/app/common/sections/home_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ddp_web/app/common/extensions/widgets.dart';
import 'package:ddp_web/app/common/pages/base_page.dart';
import 'package:ddp_web/app/common/sections/about.dart';
import 'package:ddp_web/app/common/sections/odds.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetResponsiveView<HomeController> {
  HomeView({Key? key})
      : super(
            key: key,
            settings: ResponsiveScreenSettings(
              desktopChangePoint: 1200,
              tabletChangePoint: 800,
            ));

  @override
  Widget builder() {
    return BasePageView(
      banner: HomeBanner(),
      child: Content(),
    );
  }
}

class Content extends GetResponsiveWidget<HomeController> {
  Content({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return [
      About(),
      Odds(),
    ].col();
  }
}

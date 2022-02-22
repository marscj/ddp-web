import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/page1/bindings/home_page1_binding.dart';
import '../modules/home/page1/views/home_page1_view.dart';
import '../modules/home/page2/bindings/home_page2_binding.dart';
import '../modules/home/page2/views/home_page2_view.dart';
import '../modules/home/page3/bindings/home_page3_binding.dart';
import '../modules/home/page3/views/home_page3_view.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      // transition: Transition.noTransition,
      children: [
        GetPage(
          name: _Paths.HOME_PAGE1,
          page: () => HomePage1View(),
          binding: HomePage1Binding(),
          // transition: Transition.noTransition,
        ),
        GetPage(
          name: _Paths.HOME_PAGE2,
          page: () => HomePage2View(),
          binding: HomePage2Binding(),
          // transition: Transition.noTransition,
        ),
        GetPage(
          name: _Paths.HOME_PAGE3,
          page: () => HomePage3View(),
          binding: HomePage3Binding(),
          // transition: Transition.noTransition,
        ),
      ],
    ),
  ];
}

import 'package:ddp_web/app/common/page/base_page.dart';
import 'package:ddp_web/middlewares/auth_guard.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView().rootPage(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView().rootPage(),
      binding: SigninBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView().rootPage(),
      binding: SignupBinding(),
      transition: Transition.noTransition,
      middlewares: [
        AuthGuard(),
      ],
    ),
  ];
}

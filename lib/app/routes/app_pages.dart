import 'package:ddp_web/middlewares/auth_guard.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/passport/apply/bindings/passport_apply_binding.dart';
import '../modules/passport/apply/views/passport_apply_view.dart';
import '../modules/passport/bindings/passport_binding.dart';
import '../modules/passport/views/passport_view.dart';
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
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.PASSPORT,
      page: () => PassportView(),
      binding: PassportBinding(),
      children: [
        GetPage(
          name: _Paths.PASSPORT_APPLY,
          page: () => PassportApplyView(),
          binding: PassportApplyBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
      transition: Transition.noTransition,
      middlewares: [
        AuthGuard(),
      ],
    ),
  ];
}

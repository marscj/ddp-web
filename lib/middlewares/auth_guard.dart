import 'package:ddp_web/services/auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:ddp_web/app/routes/app_pages.dart';

class AuthGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.hasToken
        ? null
        : const RouteSettings(name: Routes.SIGNIN);
  }
}

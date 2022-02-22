import 'package:get/get.dart';

import '../controllers/passport_controller.dart';

class PassportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PassportController>(
      () => PassportController(),
    );
  }
}

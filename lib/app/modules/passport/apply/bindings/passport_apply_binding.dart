import 'package:get/get.dart';

import '../controllers/passport_apply_controller.dart';

class PassportApplyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PassportApplyController>(
      () => PassportApplyController(),
    );
  }
}

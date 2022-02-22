import 'package:get/get.dart';

import '../controllers/home_page2_controller.dart';

class HomePage2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePage2Controller>(
      () => HomePage2Controller(),
    );
  }
}

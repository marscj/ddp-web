import 'package:get/get.dart';

import '../controllers/home_page3_controller.dart';

class HomePage3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePage3Controller>(
      () => HomePage3Controller(),
    );
  }
}

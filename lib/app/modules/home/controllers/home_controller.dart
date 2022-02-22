import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with ScrollMixin {
  final count = 0.obs;
  final px = 0.0.obs;

  void addLinsten() {
    scroll.addListener(() {
      px.value = scroll.position.pixels;
    });
  }

  @override
  void onInit() {
    super.onInit();
    addLinsten();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  @override
  Future<void> onEndScroll() async {}

  @override
  Future<void> onTopScroll() async {}
}

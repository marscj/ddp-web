import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BasePageController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  final showmenu = false.obs;

  final curMenu = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

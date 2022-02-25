import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetResponsiveView<SigninController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Center(),
    );
  }
}

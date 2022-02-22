import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/passport_apply_controller.dart';

class PassportApplyView extends GetView<PassportApplyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PassportApplyView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PassportApplyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/passport_controller.dart';

class PassportView extends GetView<PassportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PassportView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PassportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

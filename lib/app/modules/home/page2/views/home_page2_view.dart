import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_page2_controller.dart';

class HomePage2View extends GetView<HomePage2Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage2View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomePage2View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

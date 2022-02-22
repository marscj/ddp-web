import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_page1_controller.dart';

class HomePage1View extends GetView<HomePage1Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage1View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomePage1View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

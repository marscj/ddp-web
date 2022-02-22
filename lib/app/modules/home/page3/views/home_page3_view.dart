import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_page3_controller.dart';

class HomePage3View extends GetView<HomePage3Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage3View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomePage3View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

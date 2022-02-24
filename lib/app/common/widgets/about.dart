import 'package:ddp_web/app/common/widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class About extends GetResponsiveWidget {
  About({
    Key? key,
  }) : super(key: key);

  @override
  Widget builder() {
    return [
      [
        Container()
            .semantics(
                image: DecorationImage(
                    image: AssetImage('assets/images/banner1.jpg'),
                    fit: BoxFit.cover))
            .expanded(),
        Container()
            .semantics(
                image: DecorationImage(
                    image: AssetImage('assets/images/banner2.png'),
                    fit: BoxFit.cover))
            .expanded()
      ].row(),
      [
        Spacer(),
        Container()
            .semantics(color: Colors.amber, size: Size(400, 300))
            .center()
            .expanded(flex: 3),
        Spacer(
          flex: 2,
        )
      ].row()
    ].stack().semantics(size: Size.fromHeight(600)).responsive();
  }
}

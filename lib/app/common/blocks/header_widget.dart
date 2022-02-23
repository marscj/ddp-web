import 'dart:html';

import 'package:ddp_web/app/common/blocks/menu_widget.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ddp_web/app/common/widgets/extensions.dart';

class HeaderWidget extends GetResponsiveWidget {
  HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return SizedBox.fromSize(
      size: Size.fromHeight(headerHeight),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Container(
          child: Row(
            children: [
              LeftWidget(),
              Expanded(child: MenuWidget()),
              RightWidget(),
            ],
          ).responsive(),
        ),
      ),
    );
  }
}

class LeftWidget extends StatelessWidget {
  const LeftWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      alignment: Alignment.centerLeft,
      child: Image.asset(
        'assets/images/LOGO-1-1.png',
        height: 40,
      ),
    );
  }
}

class RightWidget extends StatelessWidget {
  const RightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        ElevatedButton(onPressed: () {}, child: Text('登陆')),
        SizedBox(width: 6),
        ElevatedButton(onPressed: () {}, child: Text('注册'))
      ],
    ));
  }
}

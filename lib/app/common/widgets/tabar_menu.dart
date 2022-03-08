import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ddp_web/app/common/extensions/widget.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';
import 'package:ddp_web/app/common/widgets/container.dart';

class TabBarMenu extends GetResponsiveWidget {
  final List<Widget> menus;
  final bool isScroll;

  TabBarMenu({Key? key, required this.menus, this.isScroll = false})
      : super(key: key);

  @override
  Widget builder() {
    return MContainer(
        size: Size.fromHeight(80),
        color: Color.fromARGB(255, 250, 251, 255),
        elevation: 2,
        margin: EdgeInsets.only(bottom: 4),
        child: isScroll
            ? menus.row()
            : menus
                .divider(context: screen.context)
                .map<Widget>((e) => e.expanded())
                .toList()
                .row());
  }
}

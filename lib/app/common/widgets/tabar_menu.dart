import 'package:ddp_web/app/common/widgets/responsive.dart';
import 'package:flutter/material.dart';

import 'package:ddp_web/app/common/extensions/widget.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';
import 'package:ddp_web/app/common/widgets/container.dart';

class TabBarMenu extends StatelessWidget {
  final List<Widget> menus;
  final bool isScroll;

  TabBarMenu({Key? key, required this.menus, this.isScroll = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MContainer(
        size: Size.fromHeight(80),
        color: Color.fromARGB(255, 250, 251, 255),
        elevation: 2,
        margin: EdgeInsets.only(bottom: 4),
        child: isScroll
            ? menus.row()
            : menus
                .divider(context: context)
                .map<Widget>((e) => e.expanded())
                .toList()
                .row());
  }
}

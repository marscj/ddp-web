import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

class HeaderMenu extends GetResponsiveWidget {
  HeaderMenu({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 0, 20, 0),
      child: Row(
        children: [
          _MenuTitle('业务类型', () {}),
          _MenuTitle('增值服务', () {}),
          _MenuTitle('进度查询', () {}),
          _MenuTitle('合作商', () {}),
          _MenuTitle('收费标准', () {}),
          _MenuTitle('常见问题', () {}),
        ],
      ),
    );
  }
}

class _MenuTitle extends GetResponsiveWidget {
  final String title;
  final Function() onTap;

  _MenuTitle(this.title, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Container(
      padding: EdgeInsets.only(right: 40),
      child: TextButton(
        onPressed: () => onTap,
        child:
            Text(title, style: Theme.of(screen.context).textTheme.titleMedium),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

class MenuWidget extends GetResponsiveWidget {
  MenuWidget({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 0, 20, 0),
      child: Row(
        children: [
          MenuTitle('业务类型', () {}),
          MenuTitle('增值服务', () {}),
          MenuTitle('进度查询', () {}),
          MenuTitle('合作商', () {}),
          MenuTitle('收费标准', () {}),
          MenuTitle('常见问题', () {}),
        ],
      ),
    );
  }
}

class MenuTitle extends GetResponsiveWidget {
  final String title;
  final Function() onTap;

  MenuTitle(this.title, this.onTap, {Key? key}) : super(key: key);

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

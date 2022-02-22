import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

class MenuTitle extends StatelessWidget {
  final String title;
  final Function() onTap;

  const MenuTitle(this.title, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 40),
      child: TextButton(
        onPressed: () => onTap,
        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}

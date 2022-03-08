import 'package:ddp_web/app/common/extensions/position.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';
import 'package:ddp_web/app/common/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ddp_web/app/common/extensions/widget.dart';
import 'package:ddp_web/app/common/widgets/container.dart';

class GlobaleHeader extends ResponsiveWidget {
  GlobaleHeader({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return MContainer(
      color: Colors.white,
      elevation: 2,
      margin: EdgeInsets.only(bottom: 1),
      child: [
        LeftWidget(),
        Expanded(child: HeaderMenu().align(alignment: Alignment.centerRight)),
        RightWidget().visibility([ScreenType.Desktop, ScreenType.Tablet]),
      ].row().paddingSymmetric(vertical: 20).responsive(),
    );
  }
}

class LeftWidget extends ResponsiveWidget {
  LeftWidget({Key? key}) : super(key: key);

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

class RightWidget extends ResponsiveWidget {
  RightWidget({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return [
      ElevatedButton(onPressed: () {}, child: Text('登陆')),
      SizedBox(width: 6),
      ElevatedButton(onPressed: () {}, child: Text('注册'))
    ].row().responsive();
  }
}

class HeaderMenu extends ResponsiveWidget {
  HeaderMenu({Key? key}) : super(key: key);

  @override
  Widget desktop() {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 0, 20, 0),
      child: Wrap(
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

  @override
  Widget? tablet() {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 0, 20, 0),
      child: Wrap(
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

  @override
  Widget? phone() {
    return IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {},
    );
  }
}

class SliderMenu extends ResponsiveWidget {}

class _MenuTitle extends ResponsiveWidget {
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

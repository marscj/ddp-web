import 'package:ddp_web/app/common/extensions/position.dart';
import 'package:ddp_web/app/common/extensions/widget.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';
import 'package:ddp_web/app/common/pages/page_controller.dart';
import 'package:ddp_web/app/common/sections/mega.dart';
import 'package:ddp_web/app/common/widgets/responsive.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ddp_web/app/common/widgets/container.dart';

class GlobaleHeader extends ResponsiveWidget {
  GlobaleHeader({Key? key}) : super(key: key);

  @override
  Widget builder() {
    final BasePageController controller = Get.find<BasePageController>();
    return Obx(
      () => MContainer(
        color: Colors.white,
        elevation: 2,
        size: controller.showmenu.value
            ? Size.fromHeight(headerHeight + megaHeight)
            : Size.fromHeight(headerHeight),
        child: [
          [
            LeftWidget(),
            Expanded(child: HeaderMenu().align(alignment: Alignment.center)),
            RightWidget(),
          ]
              .row()
              .container(size: Size.fromHeight(headerHeight))
              .marginSymmetric(horizontal: 16),
          Visibility(
            replacement: SizedBox.expand(),
            visible: controller.showmenu.value,
            child: Mega().positioned(top: headerHeight, left: 0, right: 0),
          )
        ].stack(),
      ),
    );
  }

  @override
  Widget? desktop() {
    return builder();
  }

  @override
  Widget? tablet() {
    return builder();
  }

  @override
  Widget? phone() {
    return MContainer(
      color: Colors.white,
      elevation: 2,
      margin: EdgeInsets.only(bottom: 1),
      size: Size.fromHeight(headerHeight),
      child: [
        LeftWidget(),
        Expanded(child: HeaderMenu().align(alignment: Alignment.centerRight)),
      ].row().marginSymmetric(horizontal: 16),
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
    ].row();
  }
}

class HeaderMenu extends ResponsiveWidget {
  HeaderMenu({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return [
      MenuTitle(
        '业务类型',
        items: [
          PopupMenuItem(child: Text('增值服务')),
          PopupMenuItem(child: Text('增值服务')),
          PopupMenuItem(child: Text('增值服务')),
        ],
      ),
      MenuTitle(
        '增值服务',
        items: [
          PopupMenuItem(child: Text('增值服务')),
          PopupMenuItem(child: Text('增值服务')),
          PopupMenuItem(child: Text('增值服务')),
        ],
      ),
      MenuTitle(
        '进度查询',
      ),
      MenuTitle(
        '合作商',
      ),
      MenuTitle(
        '收费标准',
      ),
      MenuTitle(
        '常见问题',
      ),
    ].row(mainAxisAlignment: MainAxisAlignment.center);
  }

  @override
  Widget desktop() {
    return builder();
  }

  @override
  Widget? tablet() {
    return builder();
  }

  @override
  Widget? phone() {
    return PopupMenuButton(
      icon: Icon(Icons.menu),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[];
      },
    );
  }
}

class SliderMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: [
          MenuTitle(
            '业务类型',
          ),
          MenuTitle('增值服务'),
          MenuTitle('进度查询'),
          MenuTitle('合作商'),
          MenuTitle('收费标准'),
          MenuTitle('常见问题'),
        ].col()),
      );
}

class MenuTitle<T> extends StatefulWidget {
  final String title;
  final List<PopupMenuEntry<T>> items;
  final double? elevation;
  final T? initialValue;
  final PopupMenuItemSelected<T>? onSelected;
  final PopupMenuCanceled? onCanceled;

  MenuTitle(
    this.title, {
    Key? key,
    this.items = const [],
    this.elevation,
    this.initialValue,
    this.onSelected,
    this.onCanceled,
  }) : super(key: key);

  @override
  State<MenuTitle> createState() => MenuTitleState();
}

class MenuTitleState<T> extends State<MenuTitle<T>> {
  final BasePageController controller = Get.find<BasePageController>();
  bool _hoverd = false;

  void onEntered(bool isHovered) {
    controller.showmenu.value = isHovered;
    setState(() {
      _hoverd = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: double.infinity,
        child: TextButton(
          onPressed: () {},
          child: Text(widget.title),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            foregroundColor: _hoverd
                ? MaterialStateProperty.all(Colors.blue)
                : MaterialStateProperty.all(Colors.black87),
          ),
        ),
      ),
    );
  }
}

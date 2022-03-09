import 'package:ddp_web/app/common/extensions/position.dart';
import 'package:ddp_web/app/common/extensions/text.dart';
import 'package:ddp_web/app/common/extensions/widget.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';
import 'package:ddp_web/app/common/pages/page_controller.dart';
import 'package:ddp_web/app/common/widgets/button.dart';
import 'package:ddp_web/app/common/widgets/logo.dart';
import 'package:ddp_web/app/common/widgets/mega.dart';
import 'package:ddp_web/app/common/widgets/responsive.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobaleHeader extends StatelessWidget {
  GlobaleHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _GlobaleHeader();
  }
}

class _GlobaleHeader extends ResponsiveWidget {
  _GlobaleHeader({Key? key}) : super(key: key);

  @override
  Widget builder() {
    final BasePageController controller = Get.find<BasePageController>();
    return [
      [
        LogoWidget().paddingOnly(left: 16),
        HeaderMenu().expanded(),
        RightWidget().paddingOnly(right: 16),
      ].row().container(
          size: Size.fromHeight(headerHeight),
          color: Colors.white,
          elevation: 2,
          type: MaterialType.card),
      Obx(() => Visibility(visible: controller.showmenu.value, child: Mega()))
    ].col();
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
    return [
      LogoWidget().paddingOnly(left: 16),
      Spacer(),
      RightWidget().paddingOnly(right: 16),
    ].row().container(
        size: Size.fromHeight(headerHeight),
        color: Colors.white,
        elevation: 2,
        type: MaterialType.card);
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
    return IconButton(
      onPressed: () {
        BasePageController controller = Get.find<BasePageController>();
        controller.scaffoldState.currentState?.openDrawer();
      },
      icon: Icon(Icons.menu),
    );
  }
}

class HeaderMenu extends ResponsiveWidget {
  HeaderMenu({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return [
      MenuTitle(
        '业务办理',
        items: [
          PopupMenuItem(child: Text('签证办理')),
          PopupMenuItem(child: Text('公司执照办理')),
          PopupMenuItem(child: Text('体检申请')),
          PopupMenuItem(child: Text('公证认证')),
        ],
      ),
      MenuTitle(
        '进度查询',
      ),
      MenuTitle(
        '合作商',
      ),
      MenuTitle(
        '纳斯达克上市',
      ),
    ].row(mainAxisAlignment: MainAxisAlignment.center);
  }
}

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        child: [
          DrawerHeader(
            child: Image.asset('assets/images/LOGO-1-1.png'),
          ),
          ExpansionTile(
            title: Text('业务办理'),
            children: [
              HoverTextButton(
                onPressed: () {},
                child: Text('签证办理'),
              ).align(Alignment.centerLeft),
              HoverTextButton(
                onPressed: () {},
                child: Text('公司执照办理'),
              ).align(Alignment.centerLeft),
              HoverTextButton(
                onPressed: () {},
                child: Text('体检申请'),
              ).align(Alignment.centerLeft),
              HoverTextButton(
                onPressed: () {},
                child: Text('公证认证'),
              ).align(Alignment.centerLeft),
            ]
                .map((e) => e.paddingSymmetric(horizontal: 8, vertical: 10))
                .toList(),
          ),
          HoverTextButton(
            onPressed: () {},
            child: Text('进度查询'),
          )
              .align(Alignment.centerLeft)
              .paddingSymmetric(horizontal: 8, vertical: 10),
          HoverTextButton(
            onPressed: () {},
            child: Text('合作商'),
          )
              .align(Alignment.centerLeft)
              .paddingSymmetric(horizontal: 8, vertical: 10),
          HoverTextButton(
            onPressed: () {},
            child: Text('纳斯达克上市'),
          )
              .align(Alignment.centerLeft)
              .paddingSymmetric(horizontal: 8, vertical: 10),
          Spacer(),
          Text('DDP CHINA CENTRE @ copyright 2020')
              .s14()
              .white()
              .center()
              .container(size: Size.fromHeight(60), color: Colors.black)
        ].col(),
      );
}

class MenuTitle<T> extends StatefulWidget {
  final String title;
  final List<PopupMenuEntry<T>> items;

  MenuTitle(
    this.title, {
    Key? key,
    this.items = const [],
  }) : super(key: key);

  @override
  State<MenuTitle> createState() => MenuTitleState();
}

class MenuTitleState<T> extends State<MenuTitle<T>> {
  final BasePageController controller = Get.find<BasePageController>();
  bool _hoverd = false;

  void onEntered(bool isHovered) {
    if (widget.items.isNotEmpty) {
      controller.showmenu.value = isHovered;
      controller.curMenu.value = widget.title;
    }

    setState(() {
      _hoverd = isHovered;
    });
  }

  Widget hoverdIcon() {
    return Obx(() {
      if (_hoverd ||
          (controller.showmenu.value &&
              (controller.curMenu.value == widget.title))) {
        return Icon(Icons.arrow_drop_up);
      }
      return Icon(Icons.arrow_drop_down);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        child: TextButton.icon(
          onPressed: () {},
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            foregroundColor: _hoverd
                ? MaterialStateProperty.all(Colors.blue)
                : MaterialStateProperty.all(Colors.black),
          ),
          label: widget.items.isNotEmpty ? hoverdIcon() : SizedBox.shrink(),
          icon: Text(widget.title),
        ),
      ),
    );
  }
}

import 'package:ddp_web/app/common/extensions/position.dart';
import 'package:ddp_web/app/common/extensions/text.dart';
import 'package:ddp_web/app/common/extensions/widget.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';
import 'package:ddp_web/app/common/pages/page_controller.dart';
import 'package:ddp_web/app/common/widgets/button.dart';
import 'package:ddp_web/app/common/widgets/mega.dart';
import 'package:ddp_web/app/common/widgets/responsive.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobaleHeader extends ResponsiveWidget {
  GlobaleHeader({Key? key}) : super(key: key);

  @override
  Widget builder() {
    final BasePageController controller = Get.find<BasePageController>();
    return Obx(
      () => SizedBox.fromSize(
        size: controller.showmenu.value
            ? Size.fromHeight(headerHeight + megaHeight)
            : Size.fromHeight(headerHeight),
        child: [
          [
            LeftWidget().paddingOnly(left: 16),
            Expanded(child: HeaderMenu().align(alignment: Alignment.center)),
            RightWidget().paddingOnly(right: 16),
          ].row().container(
              size: Size.fromHeight(headerHeight),
              color: Colors.white,
              elevation: 2,
              type: MaterialType.card),
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
    return [
      LeftWidget().paddingOnly(left: 16),
      Spacer(),
      RightWidget().paddingOnly(right: 16),
    ].row().container(
        size: Size.fromHeight(headerHeight),
        color: Colors.white,
        elevation: 2,
        type: MaterialType.card);
  }
}

class LeftWidget extends ResponsiveWidget {
  LeftWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/LOGO-1-1.png',
        height: 40,
        width: 60,
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
              ),
              HoverTextButton(
                onPressed: () {},
                child: Text('公司执照办理'),
              ),
              HoverTextButton(
                onPressed: () {},
                child: Text('体检申请'),
              ),
              HoverTextButton(
                onPressed: () {},
                child: Text('公证认证'),
              ),
            ],
          ),
          HoverTextButton(
            onPressed: () {},
            child: Text('进度查询'),
          ),
          HoverTextButton(
            onPressed: () {},
            child: Text('合作商'),
          ),
          HoverTextButton(
            onPressed: () {},
            child: Text('纳斯达克上市'),
          ),
        ].col(),
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

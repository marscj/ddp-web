import 'package:ddp_web/app/common/extensions/position.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';
import 'package:ddp_web/app/common/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        Expanded(child: HeaderMenu().align(alignment: Alignment.center)),
        RightWidget(),
      ].row().paddingSymmetric(vertical: 20, horizontal: 16),
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
      child: [
        LeftWidget(),
        Expanded(child: HeaderMenu().align(alignment: Alignment.centerRight)),
      ].row().paddingSymmetric(vertical: 20, horizontal: 16),
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
    ].warp();
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
  bool _hover = false;

  void onEntered(bool isHovered) {
    setState(() {
      _hover = isHovered;
      if (isHovered) showButtonMenu();
    });
  }

  void showButtonMenu() {
    final PopupMenuThemeData popupMenuTheme = PopupMenuTheme.of(context);
    final RenderBox button = context.findRenderObject()! as RenderBox;
    final RenderBox overlay =
        Navigator.of(context).overlay!.context.findRenderObject()! as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset(0, 32), ancestor: overlay),
        button.localToGlobal(
            button.size.bottomRight(Offset.zero) + Offset(0, 32),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    if (widget.items.isNotEmpty) {
      showMenu<T?>(
        context: context,
        elevation: widget.elevation ?? popupMenuTheme.elevation,
        items: widget.items,
        initialValue: widget.initialValue,
        position: position,
      ).then<void>((T? newValue) {
        if (!mounted) return null;
        if (newValue == null) {
          widget.onCanceled?.call();
          return null;
        }
        widget.onSelected?.call(newValue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: TextButton(
          onPressed: () {
            showButtonMenu();
          },
          child: Text(widget.title),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            foregroundColor: _hover
                ? MaterialStateProperty.all(Colors.blue)
                : MaterialStateProperty.all(Colors.black87),
          ),
          onHover: (value) => onEntered(value),
        ),
      ),
    );
  }
}

import 'package:ddp_web/app/common/extensions/position.dart';
import 'package:ddp_web/app/common/extensions/widget.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';
import 'package:ddp_web/app/common/pages/page_controller.dart';
import 'package:ddp_web/app/common/widgets/responsive.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mega extends ResponsiveWidget {
  Mega({Key? key}) : super(key: key);

  @override
  Widget builder() {
    BasePageController controller = Get.find<BasePageController>();

    return MouseRegion(
      onEnter: (event) {
        controller.showmenu.value = true;
      },
      onExit: (event) {
        controller.showmenu.value = false;
      },
      child: SizedBox.fromSize(
        size: Size.fromHeight(megaHeight),
        child: Card(
          elevation: 4,
          margin: EdgeInsets.zero,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(6),
            ),
          ),
          child: [
            MegaItem(
              icon: Image.asset(
                'assets/images/c9db2601b0265cecee08dbfd903ef0ab-passport-travel-icon.png',
                height: 100,
              ),
              title: Text('护照申请'),
            ),
            MegaItem(
              icon: Image.asset(
                  'assets/images/c9db2601b0265cecee08dbfd903ef0ab-passport-travel-icon.png',
                  height: 100),
              title: Text('营业执照申请'),
            ),
            MegaItem(
              icon: Image.asset(
                  'assets/images/c9db2601b0265cecee08dbfd903ef0ab-passport-travel-icon.png',
                  height: 100),
              title: Text('体检申请'),
            ),
            MegaItem(
              icon: Image.asset(
                  'assets/images/c9db2601b0265cecee08dbfd903ef0ab-passport-travel-icon.png',
                  height: 100),
              title: Text('公证认证'),
            ),
          ].row(mainAxisAlignment: MainAxisAlignment.spaceEvenly),
        ),
      ).responsive(),
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
    return SizedBox.shrink();
  }
}

class MegaItem extends StatelessWidget {
  final Widget title;
  final Widget icon;

  const MegaItem({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [icon, SizedBox(height: 14), title]
        .col(mainAxisAlignment: MainAxisAlignment.center);
  }
}

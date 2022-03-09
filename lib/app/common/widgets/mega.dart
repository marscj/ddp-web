import 'package:ddp_web/app/common/extensions/widget.dart';
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
          )).responsive(),
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

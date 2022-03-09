import 'package:ddp_web/app/common/pages/page_controller.dart';
import 'package:ddp_web/app/common/widgets/responsive.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:ddp_web/app/common/widgets/container.dart';
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
      child: MContainer(
        color: Colors.white,
        elevation: 2,
        size: Size.fromHeight(megaHeight),
        child: Container(
          color: Colors.red,
        ),
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
    return SizedBox.shrink();
  }
}

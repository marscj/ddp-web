import 'package:carousel_slider/carousel_slider.dart';
import 'package:ddp_web/app/common/extensions/widget.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';
import 'package:ddp_web/app/common/pages/page_controller.dart';
import 'package:ddp_web/app/common/sections/footer.dart';
import 'package:ddp_web/app/common/sections/header.dart';
import 'package:ddp_web/app/constans/constans.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BasePageView extends GetView<BasePageController> {
  final Widget? banner;
  final Widget? header;
  final Widget? footer;
  final Widget child;
  final ScrollController? scrollController;
  final CarouselControllerImpl? carouselController;

  BasePageView({
    Key? key,
    required this.child,
    this.banner,
    this.header,
    this.footer,
    this.scrollController,
    this.carouselController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasePageController>(
      init: BasePageController(),
      builder: (controller) {
        return Scaffold(
          drawer: SliderMenu(),
          body: [
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  SizedBox(height: headerHeight),
                  banner != null ? banner! : SizedBox.shrink(),
                  child,
                  footer ?? GlobaleFooter()
                ],
              ),
            ),

            header ?? GlobaleHeader(),
            // Obx(
            //   () => Positioned(
            //     left: Get.width > 1200 ? (Get.width - 1200) / 2 : 0,
            //     right: Get.width > 1200 ? (Get.width - 1200) / 2 : 0,
            //     top: headerHeight,
            //     child: Visibility(
            //       visible: controller.showmenu.value,
            //       child: Container(
            //         color: Colors.red,
            //         width: 100,
            //         height: 100,
            //       ),
            //     ),
            //   ),
            // )
          ].stack(),
        );
      },
    );
  }
}

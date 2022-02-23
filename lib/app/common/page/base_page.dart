import 'package:carousel_slider/carousel_slider.dart';
import 'package:ddp_web/app/common/blocks/banner.dart';
import 'package:ddp_web/app/common/blocks/footer.dart';
import 'package:ddp_web/app/common/blocks/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasePageView extends GetResponsiveWidget {
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
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            header ?? GlobaleHeader(),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    banner != null ? banner! : SizedBox.shrink(),
                    child,
                    footer ?? GlobaleFooter()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

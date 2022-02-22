import 'package:carousel_slider/carousel_slider.dart';
import 'package:ddp_web/app/common/blocks/banner_widget.dart';
import 'package:ddp_web/app/common/blocks/footer_widget.dart';
import 'package:ddp_web/app/common/blocks/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasePageView extends GetResponsiveWidget {
  final Widget? banners;
  final Widget? banner;
  final Widget child;
  final ScrollController? scrollController;
  final CarouselControllerImpl? carouselController;

  BasePageView({
    Key? key,
    required this.child,
    this.banners,
    this.banner,
    this.scrollController,
    this.carouselController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            HeaderWidget(),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    banner != null
                        ? banner!
                        : (banners != null ? banners! : SizedBox.shrink()),
                    child,
                    FooterWidget()
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

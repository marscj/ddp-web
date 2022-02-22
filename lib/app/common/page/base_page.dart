import 'package:ddp_web/app/common/blocks/footer_widget.dart';
import 'package:ddp_web/app/common/blocks/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasePageView extends GetResponsiveWidget {
  final List<Widget>? banners;
  final Widget? banner;
  final ScrollController? scrollController;
  BasePageView({
    Key? key,
    this.banners,
    this.banner,
    this.scrollController,
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
                  children: [banner ?? SizedBox.shrink(), this, FooterWidget()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

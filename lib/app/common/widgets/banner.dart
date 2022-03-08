import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ddp_web/app/common/blocks/indicator.dart';
import 'package:ddp_web/app/common/extensions/animator.dart';
import 'package:ddp_web/app/common/extensions/position.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';
import 'package:ddp_web/app/common/widgets/container.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:ddp_web/plugs/dots_indicator.dart';

class Banner extends GetResponsiveWidget {
  final String assets;
  final Widget? child;

  Banner({
    required this.assets,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget builder() {
    return MContainer(
        size: Size.fromHeight(bannerHeight),
        image: DecorationImage(image: AssetImage(assets), fit: BoxFit.cover),
        child: child ?? SizedBox.shrink());
  }
}

class MultiBanner extends StatefulWidget {
  final List<Widget> banners;
  final CarouselControllerImpl? controller;
  final Widget? bottom;

  MultiBanner({
    Key? key,
    required this.banners,
    this.bottom,
    this.controller,
  }) : super(key: key);

  @override
  State<MultiBanner> createState() => _MultiBannerState();
}

class _MultiBannerState extends State<MultiBanner> {
  double _curPage = 0.0;
  late CarouselControllerImpl _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = widget.controller ?? CarouselControllerImpl();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: widget.banners,
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: bannerHeight,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  autoPlayAnimationDuration: Duration(milliseconds: 200),
                  viewportFraction: 1,
                  aspectRatio: 1.0,
                  onPageChanged: (value, _) {
                    setState(() {
                      _curPage = value.toDouble();
                    });
                  },
                ),
              ),
              widget.bottom != null
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: widget.bottom!,
                    )
                  : SizedBox.shrink(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          DotsIndicator(
            dotsCount: widget.banners.length,
            position: _curPage,
            onTap: (value) {
              setState(() {
                _curPage = value;
                _carouselController.animateToPage(_curPage.toInt());
              });
            },
            decorator: DotsDecorator(
              size: Size(10.0, 10.0),
              activeSize: Size(12.0, 6.0),
              spacing: EdgeInsets.all(10.0),
              color: Colors.grey.shade400,
              activeColor: Colors.grey,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class MultiBannerExtra extends StatefulWidget {
  final List<Widget> banners;
  final CarouselControllerImpl? controller;
  final Widget? bottom;

  MultiBannerExtra({
    Key? key,
    required this.banners,
    this.bottom,
    this.controller,
  }) : super(key: key);

  @override
  State<MultiBannerExtra> createState() => _MultiBannerExtraState();
}

class _MultiBannerExtraState extends State<MultiBannerExtra> {
  double _curPage = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return [
      [
        widget.banners[_curPage.toInt()].fade(_curPage.toInt()),
        widget.banners.length > 1
            ? Indicator(
                count: widget.banners.length,
                position: _curPage,
                onTap: (value) {
                  setState(() {
                    _curPage = value;
                  });
                },
              ).positioned(left: 0.0, right: 0.0, bottom: 10.0)
            : SizedBox.shrink(),
      ].stack(),
      widget.bottom != null ? widget.bottom! : SizedBox.shrink()
    ].col();
  }
}

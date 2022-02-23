import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ddp_web/app/common/widgets/button.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:ddp_web/plugs/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ddp_web/app/common/widgets/extensions.dart';

class Banner extends GetResponsiveWidget {
  final String title;
  final String desc;
  final VoidCallback? onTap;
  final String assets;
  final Widget? bottom;

  Banner({
    required this.assets,
    this.title = '',
    this.desc = '',
    this.onTap,
    this.bottom,
    Key? key,
  }) : super(key: key);

  @override
  Widget builder() {
    return Stack(
      children: [
        BannerContent(
          assets,
          title: title,
          desc: desc,
          onTap: onTap,
        ),
        bottom != null
            ? Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: bottom!,
              )
            : SizedBox.shrink()
      ],
    );
  }
}

class BannerContent extends GetResponsiveWidget {
  final String title;
  final String desc;
  final VoidCallback? onTap;
  final String assets;

  BannerContent(
    this.assets, {
    Key? key,
    this.title = '',
    this.desc = '',
    this.onTap,
  }) : super(key: key);

  @override
  Widget builder() {
    return Container(
      height: bannerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(assets), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Text(
            title,
            style: Get.theme.textTheme.headline3?.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          AutoSizeText(
            desc,
            style:
                Get.theme.textTheme.titleSmall?.copyWith(color: Colors.white),
          ).responsive(),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: onTap, child: Text('申请入驻')),
          Spacer()
        ],
      ).responsive(),
    );
  }
}

class BannerBottom extends GetResponsiveWidget {
  final List<Widget> bottoms;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? height;

  BannerBottom({
    Key? key,
    required this.bottoms,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.height = bannerBottomHeight,
  }) : super(key: key);

  @override
  Widget? builder() {
    return Container(
      color: backgroundColor ?? Colors.black38,
      padding: padding,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottoms
            .divider(
                context: screen.context,
                color: foregroundColor ?? Colors.white38)
            .map<Widget>((e) => Expanded(child: e))
            .toList(),
      ),
    );
  }
}

class BannerMenu extends GetResponsiveWidget {
  final String title;
  final String desc;
  final VoidCallback? onTap;
  final Color? titleColor;
  final Color? subtitleColor;

  BannerMenu({
    Key? key,
    this.title = '',
    this.desc = '',
    this.onTap,
    this.titleColor,
    this.subtitleColor,
  }) : super(key: key);

  @override
  Widget builder() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: titleColor ?? Colors.white,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 4,
          ),
          HoverTextButton(
            onPressed: () => onTap,
            child: Text(desc),
          ),
        ],
      ),
    );
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
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animate) {
                  return FadeTransition(opacity: animate, child: child);
                },
                child: Container(
                    key: ValueKey(_curPage.toInt()),
                    child: widget.banners[_curPage.toInt()]),
              ),
              widget.banners.length > 1
                  ? Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: DotsIndicator(
                        dotsCount: widget.banners.length,
                        position: _curPage,
                        onTap: (value) {
                          setState(() {
                            _curPage = value;
                          });
                        },
                        decorator: DotsDecorator(
                          size: Size(10.0, 10.0),
                          activeSize: Size(12.0, 6.0),
                          spacing: EdgeInsets.all(10.0),
                          color: Colors.grey.shade200,
                          activeColor: Colors.grey.shade200,
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
          widget.bottom != null ? widget.bottom! : SizedBox.shrink()
        ],
      ),
    );
  }
}

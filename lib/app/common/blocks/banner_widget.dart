import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:ddp_web/plugs/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ddp_web/app/common/widgets/extensions.dart';

class BannerWidget extends GetResponsiveWidget {
  final String title;
  final String desc;
  final void Function()? onTap;
  final String assets;
  final Widget? bottom;

  BannerWidget({
    required this.assets,
    this.title = '',
    this.desc = '',
    this.onTap,
    this.bottom,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BannerContentWidget(
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

class BannerContentWidget extends GetResponsiveWidget {
  final String title;
  final String desc;
  final void Function()? onTap;
  final String assets;

  BannerContentWidget(
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
          ).constraints(screen.settings.desktopChangePoint / 2,
              align: Alignment.centerLeft),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: onTap, child: Text('申请入驻')),
          Spacer()
        ],
      ).constraints(screen.settings.desktopChangePoint),
    );
  }
}

class BannerBottomWidget extends GetResponsiveWidget {
  final List<Widget> bottoms;

  BannerBottomWidget({Key? key, required this.bottoms}) : super(key: key);

  @override
  Widget? builder() {
    return Container(
      color: Colors.black38,
      height: bannerFooterHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottoms
            .divider(context: screen.context, color: Colors.white38)
            .map<Widget>((e) => Expanded(child: e))
            .toList(),
      ),
    );
  }
}

class BannerMenuWidget extends StatelessWidget {
  final String title;
  final String desc;
  final void Function()? onTap;

  const BannerMenuWidget({
    Key? key,
    this.title = '',
    this.desc = '',
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              desc,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

class MultiBannerWidget extends StatefulWidget {
  final List<Widget> banners;
  final CarouselControllerImpl? controller;
  final Widget? bottom;

  MultiBannerWidget({
    Key? key,
    required this.banners,
    this.bottom,
    this.controller,
  }) : super(key: key);

  @override
  State<MultiBannerWidget> createState() => _MultiBannerWidgetState();
}

class _MultiBannerWidgetState extends State<MultiBannerWidget> {
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

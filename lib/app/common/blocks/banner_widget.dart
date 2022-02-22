import 'package:auto_size_text/auto_size_text.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ddp_web/app/common/widgets/extensions.dart';

class BannerWidget extends GetResponsiveWidget {
  final String title;
  final String desc;
  final void Function()? onTap;
  final String assets;

  BannerWidget({
    required this.assets,
    this.title = '',
    this.desc = '',
    this.onTap,
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
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: BannerFooterWidget(),
        )
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
  Widget? builder() {
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
            maxLines: 2,
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

class BannerFooterWidget extends GetResponsiveWidget {
  BannerFooterWidget({Key? key}) : super(key: key);

  @override
  Widget? builder() {
    // TODO: implement builder
    return Container(
      color: Colors.black38,
      height: bannerFooterHeight,
      child: Row(
        children: [
          Spacer(),
          VerticalDivider(
            color: Colors.white38,
          ),
          Expanded(
            child: BannerMenuWidget(
                title: '企业合伙人', desc: '超大折扣 申请加入', onTap: () {}),
          ),
          VerticalDivider(
            color: Colors.white38,
          ),
          Expanded(
            child: BannerMenuWidget(
              title: '企业合伙人',
              desc: '超大折扣 申请加入',
              onTap: () {},
            ),
          ),
          VerticalDivider(
            color: Colors.white38,
          ),
          Expanded(
            child: BannerMenuWidget(
                title: '企业合伙人', desc: '超大折扣 申请加入', onTap: () {}),
          ),
          VerticalDivider(
            color: Colors.white38,
          ),
          Spacer(),
        ],
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

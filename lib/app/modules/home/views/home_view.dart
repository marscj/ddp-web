import 'package:ddp_web/app/constans/constans.dart';
import 'package:ddp_web/app/common/widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetResponsiveView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            HeaderWidget(),
            Expanded(
                child: SingleChildScrollView(
              controller: controller.scroll,
              child: Column(
                children: [
                  BannerWidget(
                    assets: 'assets/images/banner1.jpg',
                    title: '中国中心',
                    desc:
                        '迪拜硅谷-中国中心聚焦吸引跨境电商，区块链金融，移动教育，电子商务，在线娱乐，物联网，新媒体运营等数字新型企业，旨在搭建中东地区最大的海外华人企业数字产业交流平台，凭借中阿两国政府的大力支持，中国中心致力于成为中国高科技企业落地中东地区的第一桥梁，凭借自身优势，为中国企业出海保驾护航。',
                  ),
                  ContentWidget(),
                  FooterWidget()
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends GetResponsiveWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: Divider.createBorderSide(context)),
      ),
      child: Row(
        children: [
          LeftWidget(),
          Expanded(flex: 1, child: MenuWidget()),
          RightWidget(),
        ],
      ).constraints(screen.settings.desktopChangePoint),
    );
  }
}

class LeftWidget extends StatelessWidget {
  const LeftWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      alignment: Alignment.centerLeft,
      child: Image.asset(
        'assets/images/LOGO-1-1.png',
        height: 40,
      ),
    );
  }
}

class RightWidget extends StatelessWidget {
  const RightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        ElevatedButton(onPressed: () {}, child: Text('登陆')),
        SizedBox(width: 6),
        ElevatedButton(onPressed: () {}, child: Text('注册'))
      ],
    ));
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 0, 20, 0),
      child: Row(
        children: [
          MenuTitle('业务类型', () {}),
          MenuTitle('增值服务', () {}),
          MenuTitle('进度查询', () {}),
          MenuTitle('合作商', () {}),
          MenuTitle('收费标准', () {}),
          MenuTitle('常见问题', () {}),
        ],
      ),
    );
  }
}

class MenuTitle extends StatelessWidget {
  final String title;
  final Function() onTap;

  const MenuTitle(this.title, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 40),
      child: TextButton(
        onPressed: () => onTap,
        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:
            [1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9]
                .map((index) => Container(
                      height: 120,
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100 * (index % 9)],
                      child: Text('List Item $index'),
                    ))
                .toList(),
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: footerHeight,
      color: Colors.indigo.shade900,
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: Text(
          'footer',
        ),
      ),
    );
  }
}

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
  });

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
  });

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

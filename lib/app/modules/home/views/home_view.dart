import 'package:ddp_web/app/constans/constans.dart';
import 'package:ddp_web/app/widgets/extensions.dart';
import 'package:flutter/material.dart';

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
                  BannerWidget('assets/images/banner1.jpg'),
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
  final String? title;
  final String? desc;
  final Function? onTap;
  final String assets;

  BannerWidget(this.assets, {Key? key, this.title, this.desc, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bannerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(assets), fit: BoxFit.cover),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                '中国中心',
                style: Get.theme.textTheme.headline3
                    ?.copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: constraints.maxWidth / 2,
                child: Text(
                  '''
迪拜硅谷数字产业园中国中心(China Center)位于迪拜硅谷(Dubai Silicon Oasis)，由迪拜硅谷管理局和中国中心(DDP China Center)管理处共同成立，支持机构北京国际文化贸易促进会。
中国中心聚焦吸引跨境电商，区块链金融，移动教育，电子商务，在线娱乐，物联网，新媒体运营等数字新型企业，旨在搭建中东地区最大的海外华人企业数字产业交流平台，凭借中阿两国政府的大力支持，中国中心致力于成为中国高科技企业落地中东地区的第一桥梁，凭借自身优势，为中国企业出海保驾护航。
中国中心旨在通过创新驱动，数字赋能，以期推动人才，资本，信息，企业多维融合，构建“一园多集群”产业布局，形成中国产业集聚，抢占智能产业和数字经济发展制高点，以期推动中国数字经济产业在中东地区的高质量发展，首次孵化2000家中国企业享受优惠政策落地迪拜，打造阿联酋数字经济平台标杆，亿级数字中国产业集群。''',
                  style: Get.theme.textTheme.titleSmall
                      ?.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () {}, child: Text('申请入驻')),
              Spacer()
            ],
          ).constraints(screen.settings.desktopChangePoint);
        },
      ),
    );
  }
}

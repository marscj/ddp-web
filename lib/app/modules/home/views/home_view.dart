import 'package:ddp_web/app/common/page/base_page.dart';
import 'package:ddp_web/app/common/widgets/widgets.dart';
import 'package:ddp_web/app/common/blocks/blocks.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart' hide Banner;
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetResponsiveView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return BasePageView(
      banner: MultiBannerExtra(
        banners: [
          Banner(
            assets: 'assets/images/banner1.jpg',
            child: [
              CallOfAction(
                title: '中国中心',
                desc:
                    '迪拜硅谷-中国中心聚焦吸引跨境电商，区块链金融，移动教育，电子商务，在线娱乐，物联网，新媒体运营等数字新型企业，旨在搭建中东地区最大的海外华人企业数字产业交流平台，凭借中阿两国政府的大力支持，中国中心致力于成为中国高科技企业落地中东地区的第一桥梁，凭借自身优势，为中国企业出海保驾护航。',
                action: ElevatedButton(
                  child: Text('申请加入'),
                  onPressed: () {},
                ),
              ).expanded(flex: 2),
              Spacer().visibility([
                ScreenType.Desktop,
              ])
            ].row().responsive(),
          ),
          Banner(
            assets: 'assets/images/banner2.png',
            child: [
              CallOfAction(
                title: '中国中心',
                desc:
                    '迪拜硅谷-中国中心聚焦吸引跨境电商，区块链金融，移动教育，电子商务，在线娱乐，物联网，新媒体运营等数字新型企业，旨在搭建中东地区最大的海外华人企业数字产业交流平台，凭借中阿两国政府的大力支持，中国中心致力于成为中国高科技企业落地中东地区的第一桥梁，凭借自身优势，为中国企业出海保驾护航。',
                action: ElevatedButton(
                  child: Text('申请加入'),
                  onPressed: () {},
                ),
              ).expanded(flex: 2),
              Spacer().visibility([
                ScreenType.Desktop,
              ])
            ].row().responsive(),
          ),
          Container(
            height: bannerHeight,
            color: Colors.red,
          ),
          Container(
            height: bannerHeight,
            color: Colors.blue,
          )
        ],
        bottom: TabBarMenu(
          menus: [
            // Container(),
            TabMenu(title: '企业合伙人', subtitle: '超大折扣 申请加入', onTap: () {}),
            TabMenu(title: '企业合伙人', subtitle: '超大折扣 申请加入', onTap: () {}),
            TabMenu(title: '企业合伙人', subtitle: '超大折扣 申请加入', onTap: () {}),
            // Container(),
          ],
        ),
      ),
      child: Content(),
    );
  }
}

class Content extends GetResponsiveWidget<HomeController> {
  Content({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return [About(), Odds()].col();
  }
}

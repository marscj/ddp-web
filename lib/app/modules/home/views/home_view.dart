import 'package:auto_size_text/auto_size_text.dart';
import 'package:ddp_web/app/common/blocks/banner_widget.dart';
import 'package:ddp_web/app/common/page/base_page.dart';
import 'package:ddp_web/app/common/widgets/extensions.dart';
import 'package:ddp_web/app/common/widgets/hover.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ddp_web/app/common/widgets/extensions.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetResponsiveView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return BasePageView(
      // banner: BannerWidget(
      //   assets: 'assets/images/banner1.jpg',
      //   title: '中国中心',
      //   desc:
      //       '迪拜硅谷-中国中心聚焦吸引跨境电商，区块链金融，移动教育，电子商务，在线娱乐，物联网，新媒体运营等数字新型企业，旨在搭建中东地区最大的海外华人企业数字产业交流平台，凭借中阿两国政府的大力支持，中国中心致力于成为中国高科技企业落地中东地区的第一桥梁，凭借自身优势，为中国企业出海保驾护航。',
      // ),
      banners: MultiBannerExtraWidget(
        banners: [
          BannerWidget(
            assets: 'assets/images/banner1.jpg',
            title: '中国中心',
            desc:
                '迪拜硅谷-中国中心聚焦吸引跨境电商，区块链金融，移动教育，电子商务，在线娱乐，物联网，新媒体运营等数字新型企业，旨在搭建中东地区最大的海外华人企业数字产业交流平台，凭借中阿两国政府的大力支持，中国中心致力于成为中国高科技企业落地中东地区的第一桥梁，凭借自身优势，为中国企业出海保驾护航。',
          ),
          BannerWidget(
            assets: 'assets/images/banner1.jpg',
            title: '中国中心',
            desc:
                '迪拜硅谷-中国中心聚焦吸引跨境电商，区块链金融，移动教育，电子商务，在线娱乐，物联网，新媒体运营等数字新型企业，旨在搭建中东地区最大的海外华人企业数字产业交流平台，凭借中阿两国政府的大力支持，中国中心致力于成为中国高科技企业落地中东地区的第一桥梁，凭借自身优势，为中国企业出海保驾护航。',
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
        bottom: BannerBottomWidget(
          padding: EdgeInsets.symmetric(vertical: 10),
          backgroundColor: Color.fromARGB(55, 205, 216, 245),
          foregroundColor: Colors.black12,
          bottoms: [
            Container(),
            BannerMenuWidget(
                title: '企业合伙人',
                desc: '超大折扣 申请加入',
                titleColor: Colors.black,
                subtitleColor: Colors.black54,
                onTap: () {}),
            BannerMenuWidget(
                title: '企业合伙人',
                desc: '超大折扣 申请加入',
                titleColor: Colors.black,
                subtitleColor: Colors.black54,
                onTap: () {}),
            BannerMenuWidget(
                title: '企业合伙人',
                desc: '超大折扣 申请加入',
                titleColor: Colors.black,
                subtitleColor: Colors.black54,
                onTap: () {}),
            Container(),
          ],
        ).card(),
      ),
      child: ContentWidget(),
    );
  }
}

class ContentWidget extends GetResponsiveWidget<HomeController> {
  ContentWidget({Key? key}) : super(key: key);

  @override
  Widget builder() {
    print(ScreenType.Desktop.index);
    print(ScreenType.Tablet.index);
    print(ScreenType.Phone.index);
    print(ScreenType.Watch.index);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/block_bg.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 140,
            child: Text(
              '我们的优势',
              style: Theme.of(screen.context).textTheme.headline4,
            ),
          ),
          Container(
            height: 400,
            child: Row(
              children: [
                Expanded(
                  child: OnHover(
                    builder: (isHovered) => Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Text(
                              '政府招商',
                              style: TextStyle(fontSize: 16),
                            ),
                            Image.asset('assets/images/资产类申请-150x150.png'),
                            AutoSizeText(
                                '政府招商，安全保障，迪拜硅谷管理局全力 保 障企业的权益。入园企业可获得商务、财 政等 有关部⻔的相应政策支持。不仅无政策 ⻛险， 部分高新项目入园企业可享受地方优 惠政策')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: OnHover(
                    builder: (isHovered) => Card(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Text('政府招商'),
                            AutoSizeText(
                                '政府招商，安全保障，迪拜硅谷管理局全力 保 障企业的权益。入园企业可获得商务、财 政等 有关部⻔的相应政策支持。不仅无政策 ⻛险， 部分高新项目入园企业可享受地方优 惠政策')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: OnHover(
                    builder: (isHovered) => Card(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Text('政府招商'),
                            AutoSizeText(
                                '政府招商，安全保障，迪拜硅谷管理局全力 保 障企业的权益。入园企业可获得商务、财 政等 有关部⻔的相应政策支持。不仅无政策 ⻛险， 部分高新项目入园企业可享受地方优 惠政策')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ).limitSize(screen.settings.desktopChangePoint)
        ],
      ),
    );
  }
}

import 'package:ddp_web/app/common/extensions/text.dart';
import 'package:ddp_web/app/common/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ddp_web/app/common/extensions/widget.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';

class About extends GetResponsiveWidget {
  About({
    Key? key,
  }) : super(key: key);

  @override
  Widget builder() {
    return [
      Text('迪拜硅谷数字产业园中国中心').s32().medium().paddingOnly(top: 40),
      Text('''迪拜硅谷数字产业园中国中心(China Center)位于迪拜硅谷(Dubai Silicon Oasis)，由迪拜硅谷管理局和中国中心(DDP China Center)管理处共同成立，支持机构北京国际文化贸易促进会。

中国中心聚焦吸引跨境电商，区块链金融，移动教育，电子商务，在线娱乐，物联网，新媒体运营等数字新型企业，旨在搭建中东地区最大的海外华人企业数字产业交流平台，凭借中阿两国政府的大力支持，中国中心致力于成为中国高科技企业落地中东地区的第一桥梁，凭借自身优势，为中国企业出海保驾护航。

中国中心旨在通过创新驱动，数字赋能，以期推动人才，资本，信息，企业多维融合，构建“一园多集群”产业布局，形成中国产业集聚，抢占智能产业和数字经济发展制高点，以期推动中国数字经济产业在中东地区的高质量发展，首次孵化2000家中国企业享受优惠政策落地迪拜，打造阿联酋数字经济平台标杆，亿级数字中国产业集群。''')
          .s16()
          .paddingOnly(top: 40),
      MContainer(
              size: Size.fromHeight(450),
              child: [
                Image.asset(
                  'assets/images/20210520152154.jpg',
                ).container().expanded(),
                [
                  Image.asset(
                    'assets/images/DSC02925.jpg',
                    fit: BoxFit.cover,
                  )
                      .container(size: Size(double.infinity, double.infinity))
                      .expanded(),
                  [
                    Image.asset(
                      'assets/images/DSC02942.jpg',
                      fit: BoxFit.cover,
                    )
                        .container(size: Size(double.infinity, double.infinity))
                        .expanded(),
                    Image.asset(
                      'assets/images/DSC02977.jpg',
                      fit: BoxFit.cover,
                    )
                        .container(size: Size(double.infinity, double.infinity))
                        .expanded()
                  ].row().expanded()
                ].col().expanded()
              ].row())
          .paddingOnly(top: 40)
    ].col().paddingOnly(bottom: 40).responsive();
  }
}

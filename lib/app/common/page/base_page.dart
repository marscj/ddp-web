import 'package:ddp_web/app/common/blocks/banner_widget.dart';
import 'package:ddp_web/app/common/blocks/footer_widget.dart';
import 'package:ddp_web/app/common/blocks/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension BasePageView on GetResponsiveView {
  root() => Scaffold(
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
                      this,
                      FooterWidget()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

import 'dart:convert';
import 'package:ddp_web/app/common/extensions/resource.dart';
import 'package:ddp_web/app/common/extensions/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:ddp_web/app/common/blocks/introduce.dart';
import 'package:ddp_web/app/common/extensions/widget.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';
import 'package:ddp_web/app/common/widgets/responsive.dart';

class Odds extends GetResponsiveWidget {
  Odds({
    Key? key,
  }) : super(key: key);

  @override
  Widget builder() {
    return [
      Text(
        '我们的优势',
      ).s32().medium().paddingSymmetric(vertical: 40),
      Container().loadJson<List<dynamic>>(
          assets: 'assets/data/odds.json',
          builder: (context, data) => data.data!
              .map<Widget>(
                (e) => Introduce(
                  title: e['title'],
                  desc: e['desc'],
                  logo: Image.asset(
                    e['assets'],
                    width: 96,
                    height: 96,
                  ),
                ),
              )
              .toList()
              .grid(
                  mainAxisSpacing: 32.0,
                  crossAxisSpacing: 32.0,
                  extent: ResponsiveValue<double>(
                      desktop: 430.0,
                      tablet: 350.0,
                      mobile: 350.0,
                      watch: 370.0)))
    ].col().paddingOnly(bottom: 32.0).responsive().container(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/block_bg.png',
            ),
            fit: BoxFit.cover,
          ),
        );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ddp_web/app/common/extensions/text.dart';
import 'package:ddp_web/app/common/extensions/widget.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';

class Introduce extends GetResponsiveWidget {
  final String? title;
  final String? desc;
  final Widget? logo;

  Introduce({Key? key, this.title, this.desc, this.logo}) : super(key: key);

  @override
  Widget builder() {
    return [
      Text(
        title ?? '',
      ).h2(),
      SizedBox(
        height: 16,
      ),
      logo ?? SizedBox.shrink(),
      SizedBox(
        height: 16,
      ),
      Expanded(
        child: Text(
          desc ?? '',
          // maxLines: 3,
        ).h4(),
      ),
    ].col().paddingAll(32).shadowHover();
  }
}

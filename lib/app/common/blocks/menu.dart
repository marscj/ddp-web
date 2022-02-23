import 'package:ddp_web/app/common/widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

import 'button.dart';

class TabMenu extends GetResponsiveWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;

  TabMenu({Key? key, this.title, this.subtitle, this.onTap}) : super(key: key);

  @override
  Widget builder() {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 0, 20, 0),
      child: [
        title != null
            ? Text(
                title!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            : SizedBox.shrink(),
        subtitle != null
            ? HoverTextButton(
                onPressed: () => onTap,
                child: Text(subtitle!),
              )
            : SizedBox.shrink()
      ].col(mainAxisAlignment: MainAxisAlignment.center),
    );
  }
}
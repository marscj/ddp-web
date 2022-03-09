import 'package:ddp_web/app/common/extensions/text.dart';
import 'package:ddp_web/app/common/extensions/widget.dart';
import 'package:ddp_web/app/common/extensions/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ddp_web/app/common/widgets/button.dart';

class TabMenu extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;

  TabMenu({Key? key, this.title, this.subtitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      title != null
          ? Text(
              title!,
              maxLines: 1,
            ).s18()
          : SizedBox.shrink(),
      Visibility(
          visible: subtitle != null,
          child: HoverTextButton(
            color: Colors.grey,
            onPressed: () => onTap,
            child: Text(
              subtitle!,
              style: TextStyle(overflow: TextOverflow.fade),
              maxLines: 1,
            ),
          ))
    ]
        .col(mainAxisAlignment: MainAxisAlignment.center)
        .container(margin: EdgeInsets.fromLTRB(50, 0, 20, 0));
  }
}

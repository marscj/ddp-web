import 'package:ddp_web/app/common/widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        style: Theme.of(screen.context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
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
        maxLines: 5,
        style: TextStyle(overflow: TextOverflow.ellipsis),
      )),
    ].col().paddingAll(32).cardHover();
  }
}

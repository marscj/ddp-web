import 'package:ddp_web/app/common/widgets/responsive.dart';
import 'package:flutter/material.dart';

import 'package:ddp_web/app/common/widgets/container.dart';
import 'package:ddp_web/app/constans/constans.dart';

class GlobaleFooter extends ResponsiveWidget {
  GlobaleFooter({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return MContainer(
      size: Size.fromHeight(footerHeight),
      child: Container(
        color: Colors.indigo.shade900,
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: Text(
            'footer',
          ),
        ),
      ),
    );
  }
}

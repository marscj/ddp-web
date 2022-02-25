import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ddp_web/app/common/widgets/senses.dart';
import 'package:ddp_web/app/constans/constans.dart';

class GlobaleFooter extends GetResponsiveWidget {
  GlobaleFooter({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Senses(
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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ddp_web/app/common/widgets/hover.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

class IntroduceWidget extends GetResponsiveWidget {
  IntroduceWidget({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return OnHover(
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
    );
  }
}

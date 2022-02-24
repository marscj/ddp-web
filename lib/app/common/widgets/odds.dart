import 'package:ddp_web/app/common/blocks/blocks.dart';
import 'package:ddp_web/app/common/widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Odds extends GetResponsiveWidget {
  Odds({
    Key? key,
  }) : super(key: key);

  @override
  Widget builder() {
    return [
      Text(
        '我们的优势',
        style: Theme.of(screen.context).textTheme.headline4,
      ).paddingSymmetric(vertical: 32),
      [
        Introduce(
          title: '政府招商',
          logo: Image.asset(
            'assets/images/资产类申请-150x150.png',
            width: 128,
          ),
          desc:
              '园区运营管理团队高效，专业，成熟。全方 位为企业保驾护航(提供物流、仓储，供应 链金融、电商、申报、企业孵化、人力资源 技术、法律、政策保护等。)',
        ),
        Introduce(
          title: '专业支持',
          logo: Image.asset(
            'assets/images/运维分析平台.png',
            width: 128,
          ),
          desc:
              '迪拜硅谷产业园总投入超过10亿美元， 全 力打造阿联酋 的数字化产业新地标。 数字 经济产业链，上下游配套，高新 数字企业 集聚地，项目包 括区块链技 术开发应用、 在线游戏、新媒体、呼 叫中心、金融、培 训，供应链等',
        ),
        Introduce(
          title: '高新科技集群',
          logo: Image.asset(
            'assets/images/业务运营类.png',
            width: 128,
          ),
          desc:
              '硅谷作为《迪拜2040城市总体规划》的五大发展中心之一，肩负着整个迪拜未来20年的数字产业发展重任，在迪拜政府的大力推动下，硅谷吸引了来自全世界的“高新尖”企业加入，包含电信、生物技术、区块链金融，在线教育，智慧医院，电动车等行业，旨在促进推广现代高科技企业并打造一园多集群的产业布局',
        ),
        Introduce(
          title: '安全担保',
          logo: Image.asset(
            'assets/images/分行堡垒机高权帐号申请.png',
            width: 128,
          ),
          desc:
              '迪拜实行自由和稳定的经济政策，硅谷自贸区作为迪拜数字产业的标杆，致力于大数据金融安全，且设立各类产业风险投资基金，同时政府推出多重优惠政策与保护，让更多企业安心落地，园区目前已有6000+高薪企业入驻',
        ),
        Introduce(
          title: '全面服务',
          logo: Image.asset(
            'assets/images/数据提取.png',
            width: 128,
          ),
          desc:
              '园区运营管理团队高效，专业，成熟。全方 位为企业保驾护航(提供物流、仓储，供应 链金融、电商、申报、企业孵化、人力资源 技术、法律、政策保护等)',
        ),
        Introduce(
          title: '地理位置卓越',
          logo: Image.asset(
            'assets/images/网络资源.png',
            width: 128,
          ),
          desc:
              '产业园位置卓越，距离市中心、国际机场及 大 型商业中心均在15分钟⻋程内，交通极 其便利。 园区内拥有餐厅，公寓，超市，医 院、学校、 政府机构、购物生活娱乐等设 施一应俱全',
        ),
      ].grid(
          mainAxisSpacing: 32.0,
          crossAxisSpacing: 32.0,
          extent: ResponsiveValue<double>(
              desktop: 400.0, tablet: 350.0, mobile: 350.0, watch: 370.0)),
    ].col().paddingOnly(bottom: 32.0).responsive().semantics(
            image: DecorationImage(
          image: AssetImage(
            'assets/images/block_bg.png',
          ),
          fit: BoxFit.cover,
        ));
  }
}
import 'package:ddp_web/app/common/page/base_page.dart';
import 'package:ddp_web/app/common/widgets/widgets.dart';
import 'package:ddp_web/app/common/blocks/blocks.dart';
import 'package:ddp_web/app/constans/constans.dart';
import 'package:flutter/material.dart' hide Banner;
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetResponsiveView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return BasePageView(
      banner: MultiBannerExtra(
        banners: [
          Banner(
            assets: 'assets/images/banner1.jpg',
            child: [
              CallOfAction(
                title: '中国中心',
                desc:
                    '迪拜硅谷-中国中心聚焦吸引跨境电商，区块链金融，移动教育，电子商务，在线娱乐，物联网，新媒体运营等数字新型企业，旨在搭建中东地区最大的海外华人企业数字产业交流平台，凭借中阿两国政府的大力支持，中国中心致力于成为中国高科技企业落地中东地区的第一桥梁，凭借自身优势，为中国企业出海保驾护航。',
                action: ElevatedButton(
                  child: Text('申请加入'),
                  onPressed: () {},
                ),
              ).expanded(flex: 2),
              Spacer().visibility([
                ScreenType.Desktop,
              ])
            ].row().responsive(),
          ),
          Banner(
            assets: 'assets/images/banner2.png',
            child: [
              CallOfAction(
                title: '中国中心',
                desc:
                    '迪拜硅谷-中国中心聚焦吸引跨境电商，区块链金融，移动教育，电子商务，在线娱乐，物联网，新媒体运营等数字新型企业，旨在搭建中东地区最大的海外华人企业数字产业交流平台，凭借中阿两国政府的大力支持，中国中心致力于成为中国高科技企业落地中东地区的第一桥梁，凭借自身优势，为中国企业出海保驾护航。',
              ).center().expanded(flex: 2),
              Spacer().visibility([ScreenType.Desktop]),
            ].stack(),
          ),
          Container(
            height: bannerHeight,
            color: Colors.red,
          ),
          Container(
            height: bannerHeight,
            color: Colors.blue,
          )
        ],
        bottom: TabBarMenu(
          menus: [
            // Container(),
            TabMenu(title: '企业合伙人', subtitle: '超大折扣 申请加入', onTap: () {}),
            TabMenu(title: '企业合伙人', subtitle: '超大折扣 申请加入', onTap: () {}),
            TabMenu(title: '企业合伙人', subtitle: '超大折扣 申请加入', onTap: () {}),
            // Container(),
          ],
        ),
      ),
      child: Content(),
    );
  }
}

class Content extends GetResponsiveWidget<HomeController> {
  Content({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Section(
      backgroundImage: DecorationImage(
        image: AssetImage(
          'assets/images/block_bg.png',
        ),
        fit: BoxFit.cover,
      ),
      child: [
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
            mainAxisSpacing: 32,
            crossAxisSpacing: 32,
            extent: ResponsiveValue(
                desktop: 400, tablet: 350, mobile: 350, watch: 370)),
      ].col().paddingOnly(bottom: 32).responsive(),
    );
  }
}

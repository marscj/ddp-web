import 'package:flutter/widgets.dart';
import 'package:ddp_web/app/common/widgets/text.dart';
import 'package:ddp_web/app/constans/theme.dart';

extension ExtensionText on Text {
  Widget h1({color, weight}) => TextBuilder(
      style: H1.copyWith(
          fontFamily: 'NotoSerifSC',
          color: color,
          fontWeight: weight,
          overflow: TextOverflow.clip),
      child: this);

  Widget h2({color, weight}) => TextBuilder(
      style: H2.copyWith(
          fontFamily: 'NotoSerifSC',
          color: color,
          fontWeight: weight,
          overflow: TextOverflow.clip),
      child: this);

  Widget h3({color, weight}) => TextBuilder(
      style: H3.copyWith(
          fontFamily: 'NotoSerifSC',
          color: color,
          fontWeight: weight,
          overflow: TextOverflow.clip),
      child: this);

  Widget h4({color, weight}) => TextBuilder(
      style: H4.copyWith(
          fontFamily: 'NotoSerifSC',
          color: color,
          fontWeight: weight,
          overflow: TextOverflow.clip),
      child: this);

  Widget h5({color, weight}) => TextBuilder(
      style: H5.copyWith(
          fontFamily: 'NotoSerifSC',
          color: color,
          fontWeight: weight,
          overflow: TextOverflow.clip),
      child: this);

  Widget h6({color, weight}) => TextBuilder(
      style: H6.copyWith(
          fontFamily: 'NotoSerifSC',
          color: color,
          fontWeight: weight,
          overflow: TextOverflow.clip),
      child: this);
}

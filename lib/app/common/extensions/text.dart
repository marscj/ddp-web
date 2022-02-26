import 'package:flutter/widgets.dart';
import 'package:ddp_web/app/common/widgets/text.dart';
import 'package:ddp_web/app/constans/theme.dart';

extension ExtensionText on Text {
  Widget w96({color, weight}) => TextBuilder(
      style: W96.copyWith(
          color: color, fontWeight: weight, overflow: TextOverflow.clip),
      child: this);

  Widget w64({color, weight}) => TextBuilder(
      style: W64.copyWith(
          color: color, fontWeight: weight, overflow: TextOverflow.clip),
      child: this);

  Widget w48({color, weight}) => TextBuilder(
      style: W48.copyWith(
          color: color, fontWeight: weight, overflow: TextOverflow.clip),
      child: this);

  Widget w32({color, weight}) => TextBuilder(
      style: W32.copyWith(
          color: color, fontWeight: weight, overflow: TextOverflow.clip),
      child: this);

  Widget w24({color, weight}) => TextBuilder(
      style: W24.copyWith(
          color: color, fontWeight: weight, overflow: TextOverflow.clip),
      child: this);

  Widget w18({color, weight}) => TextBuilder(
      style: W18.copyWith(
          color: color, fontWeight: weight, overflow: TextOverflow.clip),
      child: this);

  Widget w16({color, weight}) => TextBuilder(
      style: W16.copyWith(
          color: color, fontWeight: weight, overflow: TextOverflow.clip),
      child: this);

  Widget w14({color, weight}) => TextBuilder(
      style: W14.copyWith(
          color: color, fontWeight: weight, overflow: TextOverflow.clip),
      child: this);

  Widget w12({color, weight}) => TextBuilder(
      style: W12.copyWith(
          color: color, fontWeight: weight, overflow: TextOverflow.clip),
      child: this);
}

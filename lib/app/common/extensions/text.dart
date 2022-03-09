import 'package:flutter/material.dart';
import 'package:ddp_web/app/constans/theme.dart';

extension ExtensionText on Text {
  Text s96() => Text(data ?? '', style: W96);
  Text s60() => Text(data ?? '', style: W60);
  Text s48() => Text(data ?? '', style: W48);
  Text s40() => Text(data ?? '', style: W40);
  Text s34() => Text(data ?? '', style: W34);
  Text s24() => Text(data ?? '', style: W24);
  Text s18() => Text(data ?? '', style: W18);
  Text s16() => Text(data ?? '', style: W16);
  Text s14() => Text(data ?? '', style: W14);
  Text s12() => Text(data ?? '', style: W12);
  Text s10() => Text(data ?? '', style: W10);

  Text white() => Text(data ?? '', style: style?.copyWith(color: Colors.white));

  Text black() =>
      Text(data ?? '', style: style?.copyWith(color: Colors.black87));

  Text grey() => Text(data ?? '', style: style?.copyWith(color: Colors.grey));

  Text light() =>
      Text(data ?? '', style: style?.copyWith(fontWeight: FontWeight.w200));

  Text bold() =>
      Text(data ?? '', style: style?.copyWith(fontWeight: FontWeight.bold));

  Text medium() =>
      Text(data ?? '', style: style?.copyWith(fontWeight: FontWeight.w500));
}

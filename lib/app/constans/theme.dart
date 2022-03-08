import 'package:flutter/material.dart';

/// FontWeight.w100: 'Thin',
/// FontWeight.w200: 'ExtraLight',
/// FontWeight.w300: 'Light',
/// FontWeight.w400: 'Regular',
/// FontWeight.w500: 'Medium',
/// FontWeight.w600: 'SemiBold',
/// FontWeight.w700: 'Bold',
/// FontWeight.w800: 'ExtraBold',
/// FontWeight.w900: 'Black',

/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5

const TextStyle W96 = TextStyle(
  fontFamily: 'NotoSerifSC',
  fontSize: 96,
  color: Colors.black87,
  overflow: TextOverflow.clip,
  fontWeight: FontWeight.w300,
  letterSpacing: -1.5,
);

const TextStyle W64 = TextStyle(
  fontFamily: 'NotoSerifSC',
  fontSize: 64,
  color: Colors.black87,
  overflow: TextOverflow.clip,
  fontWeight: FontWeight.w300,
  letterSpacing: -0.5,
);

const TextStyle W48 = TextStyle(
  fontFamily: 'NotoSerifSC',
  fontSize: 48,
  color: Colors.black87,
  overflow: TextOverflow.clip,
  fontWeight: FontWeight.w400,
  letterSpacing: 0,
);

const TextStyle W32 = TextStyle(
  fontFamily: 'NotoSerifSC',
  fontSize: 32,
  color: Colors.black87,
  overflow: TextOverflow.clip,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

const TextStyle W24 = TextStyle(
  fontFamily: 'NotoSerifSC',
  fontSize: 24,
  color: Colors.black87,
  overflow: TextOverflow.clip,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

const TextStyle W18 = TextStyle(
  fontFamily: 'NotoSerifSC',
  fontSize: 18,
  color: Colors.black87,
  overflow: TextOverflow.clip,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.5,
);

const TextStyle W16 = TextStyle(
  fontFamily: 'NotoSerifSC',
  fontSize: 16,
  color: Colors.black87,
  overflow: TextOverflow.clip,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.5,
);

const TextStyle W14 = TextStyle(
  fontFamily: 'NotoSerifSC',
  fontSize: 14,
  color: Colors.black87,
  overflow: TextOverflow.clip,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.5,
);

const TextStyle W12 = TextStyle(
  fontFamily: 'NotoSerifSC',
  fontSize: 12,
  color: Colors.black87,
  overflow: TextOverflow.clip,
  fontWeight: FontWeight.w400,
  letterSpacing: 1.0,
);

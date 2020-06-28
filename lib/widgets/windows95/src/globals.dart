import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Flutter95 {
  static const grays = [
    Color(0xFFc6c6c6),
    Color(0xFFBDBDBD),
    Color(0xFF0b0b0b),
    Color(0xFF868a8e),
  ];
  static const primary = Color(0xFF000e7a);
  static const secondary = Color(0xFF55aaaa);
  static const headerDark = Color(0xFF000080);
  static const headerLight = Color(0xFF1034a6);
  static const white = Color(0xFFFFFFFF);
  static const black = Color.fromRGBO(5, 6, 8, 1);

  static Color get background => grays[1];

  static final elevatedDecoration = BoxDecoration(
    color: background,
    border: Border(
      top: BorderSide(color: Flutter95.grays[0], width: 1),
      left: BorderSide(color: Flutter95.grays[0], width: 1),
      bottom: BorderSide(color: Flutter95.grays[2], width: 1),
      right: BorderSide(color: Flutter95.grays[2], width: 1),
    ),
  );

  static final elevatedDecorationOutside = BoxDecoration(
    color: background,
    border: Border(
      top: BorderSide(color: Flutter95.white, width: 1),
      left: BorderSide(color: Flutter95.white, width: 1),
      bottom: BorderSide(color: Flutter95.grays[3], width: 1),
      right: BorderSide(color: Flutter95.grays[3], width: 1),
    ),
  );

  static final pressedDecoration = BoxDecoration(
    color: background,
    border: Border(
      top: BorderSide(color: Flutter95.grays[2], width: 1),
      left: BorderSide(color: Flutter95.grays[2], width: 1),
      bottom: BorderSide(color: Flutter95.grays[0], width: 1),
      right: BorderSide(color: Flutter95.grays[0], width: 1),
    ),
  );

  static final pressedDecorationOutside = BoxDecoration(
    color: background,
    border: Border(
      top: BorderSide(color: Flutter95.grays[3], width: 1),
      left: BorderSide(color: Flutter95.grays[3], width: 1),
      bottom: BorderSide(color: Flutter95.white, width: 1),
      right: BorderSide(color: Flutter95.white, width: 1),
    ),
  );

  static final invisibleBorder = BoxDecoration(
    color: background,
    border: Border.all(color: background),
  );

  static const headerTextStyle = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 16,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
    fontFamily: "MSSansSerif",
  );

  static const textStyle = TextStyle(
    color: Flutter95.black,
    fontSize: 14,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.normal,
    fontFamily: "MSSansSerif"
  );

  static final disabledTextStyle = TextStyle(
      color: Flutter95.grays[3],
      fontSize: 14,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.normal,
      fontFamily: "MSSansSerif",
      shadows: [
        Shadow(
          color: Flutter95.grays[0],
          offset: Offset(2, 2)
        )
      ]);
}

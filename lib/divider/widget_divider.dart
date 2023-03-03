import 'package:flutter/material.dart';

class WidgetDivider {
  static getDivider(
      {required Color color,
      double height = 1,
      double paddingLeft = 0,
      double paddingRight = 0}) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
      child: Divider(
        height: height,
        color: color,
      ),
    );
  }
}

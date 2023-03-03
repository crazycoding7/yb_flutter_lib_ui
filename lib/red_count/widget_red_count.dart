import 'package:flutter/material.dart';

class WidgetRedCount {
  static getRedCountWithWhiteCircle(
      {required double width,
      required double height,
      required Color color,
      required Color borderColor,
      required Text text}) {
    return Container(
      alignment: Alignment.center,
      height: width,
      width: height,
      decoration: _bgRadiusCircleWithBorder(
          radius: width / 2, color: color, borderColor: borderColor),
      child: text,
    );
  }

  /// 圆形背景(带边框)
  static _bgRadiusCircleWithBorder(
          {Color color = Colors.transparent,
          borderColor = Colors.blue,
          double radius = 0}) =>
      BoxDecoration(
        color: color,
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(radius),
      );
}

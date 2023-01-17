import 'package:flutter/material.dart';

class WidgetText {
  /// 单行
  static getTextNormal(
      {String text = '',
      Color color = Colors.white,
      double fontSize = 16,
      int maxLines = 1,
      double height = 1,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height),
    );
  }

  /// 多行
  static getTextNormalMaxLine(
      {String text = '',
      Color color = Colors.white,
      double fontSize = 16,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

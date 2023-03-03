import 'package:flutter/material.dart';

class WidgetBgDecorationTool {
  /// 圆角背景
  static bgRadius({Color color = Colors.transparent, double radius = 0}) =>
      BoxDecoration(
        color: color,
        border: Border.all(color: Colors.transparent, width: 0.0),
        borderRadius: BorderRadius.circular(radius),
      );

  /// 圆形背景
  static bgRadiusCircle({Color color = Colors.transparent}) => BoxDecoration(
        color: color,
        border: Border.all(color: Colors.transparent, width: 0.0),
        shape: BoxShape.circle,
      );

  /// 底部圆角背景Bottom
  static bgRadiusOnlyBottom(
          {Color color = Colors.transparent,
          double bottomLeft = 0,
          double bottomRight = 0}) =>
      BoxDecoration(
        color: color,
        border: Border.all(color: color, width: 0.0),
        borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(bottomLeft, bottomRight)),
      );

  /// 顶部圆角背景Top
  static bgRadiusOnlyTop(
          {Color color = Colors.transparent,
          double bottomLeft = 0,
          double bottomRight = 0}) =>
      BoxDecoration(
        color: color,
        border: Border.all(color: color, width: 0.0),
        borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(bottomLeft, bottomRight)),
      );

  /// 顶部圆角背景Top
  static bgRadiusOnlyTopWithShadow(
          {Color color = Colors.transparent,
          double bottomLeft = 0,
          double bottomRight = 0,
          List<BoxShadow>? boxShadow}) =>
      BoxDecoration(
        color: color,
        boxShadow: boxShadow,
        border: Border.all(color: color, width: 0.0),
        borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(bottomLeft, bottomRight)),
      );

  /// 底部圆角背景Left
  static bgRadiusOnlyLeft(
          {Color color = Colors.transparent,
          double bottomLeft = 0,
          double bottomRight = 0}) =>
      BoxDecoration(
        color: color,
        border: Border.all(color: color, width: 0.0),
        borderRadius: BorderRadius.horizontal(
            left: Radius.elliptical(bottomLeft, bottomRight)),
      );

  /// 底部圆角背景Right
  static bgRadiusOnlyRight(
          {Color color = Colors.transparent,
          double bottomLeft = 0,
          double bottomRight = 0}) =>
      BoxDecoration(
        color: color,
        border: Border.all(color: color, width: 0.0),
        borderRadius: BorderRadius.horizontal(
            right: Radius.elliptical(bottomLeft, bottomRight)),
      );
}

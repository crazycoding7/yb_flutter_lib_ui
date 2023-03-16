import 'package:flutter/material.dart';

import '../color/ui_common_color.dart';

class CommonDecoration {
  static BoxDecoration containerDecoration(
      {Color color = Colors.white,
      Color borderColor = Colors.white,
      double borderWidth = 0.5,
      double radius = 8.0,
      DecorationImage? image}) {
    return _commonDecoration(
        color: color,
        borderColor: borderColor,
        borderWidth: borderWidth,
        radius: radius,
        image: image);
  }

  static BoxDecoration commonDecoration() {
    return _commonDecoration();
  }

  static BoxDecoration buttonUnselectedBorder() {
    return _commonDecoration(
        borderColor: UICommonColors.grey_e5e5e5, radius: 22);
  }

  static BoxDecoration buttonSelectedBorder() {
    return _commonDecoration(borderColor: UICommonColors.appMain, radius: 22);
  }

  static BoxDecoration _commonDecoration(
      {Color color = Colors.white,
      Color borderColor = Colors.white,
      double borderWidth = 0.5,
      double radius = 8.0,
      DecorationImage? image}) {
    return BoxDecoration(
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
        image: image,
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}

class CommonTextStyle {
  static TextStyle titleTextStyle() {
    return commonStyle(fontSize: 16, color: UICommonColors.black_333333);
  }

  static TextStyle subTitleTextStyle() {
    return commonStyle(fontSize: 14, color: UICommonColors.grey_666666);
  }

  static TextStyle numberTextStyle() {
    return commonStyle(fontSize: 14, color: UICommonColors.blue_1890ff);
  }

  static TextStyle tipTextStyle() {
    return commonStyle(
        fontSize: 14,
        color: UICommonColors.black_333333,
        fontWeight: FontWeight.bold);
  }

  static TextStyle buttonTextStyle() {
    return commonStyle(fontSize: 16, color: UICommonColors.appMain);
  }

  static TextStyle cancelTextStyle() {
    return commonStyle(fontSize: 16, color: UICommonColors.grey_999999);
  }

  static TextStyle commonStyle(
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
  }
}

class CommonDivider {
  static commonDivider() {
    return Divider(
      height: 0.5,
      color: UICommonColors.grey_eeeeee,
    );
  }

  static commonVerticalDivider() {
    return VerticalDivider(
      width: 0.5,
      color: UICommonColors.grey_e5e5e5,
    );
  }
}

typedef SelectedCallback = void Function(int);

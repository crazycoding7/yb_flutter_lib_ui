import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../text/widget_text.dart';

class WidgetRowColumn {
  /// 左左右布局 Widget(中间为Expand)
  static layoutRowLeftLeftExpandRight({
    double height = 0,
    Widget? leftFirst,
    Widget? leftSecond,
    Widget? right,
  }) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (leftFirst == null) ? const SizedBox() : leftFirst,
          (leftSecond == null) ? const SizedBox() : Expanded(child: leftSecond),
          (right == null) ? const SizedBox() : right,
        ],
      ),
    );
  }

  /// row common 药品编辑
  static genCommonRow(
      {String name = "",
      String value = "",
      Decoration? decoration,
      Widget? numberWidget,
      Widget? numberUnitWidget,
      String tip = '',
      isRightExpand = false,
      required String imageStar,
      required String imageToRight}) {
    String targetValue = value;
    Color targetColor = Color(0xff333333);
    ;
    if (TextUtil.isEmpty(value)) {
      targetValue = tip;
      targetColor = Color(0xff999999);
      ;
    }

    return Container(
      height: 48.w,
      child: layoutRowLeftLeftRightRight(
        isRightExpand: isRightExpand,
        left1: Padding(
          padding: EdgeInsets.only(left: 12.w, right: 8.w),
          child: Image.asset(imageStar),
        ),
        left2: WidgetText.getTextNormal(
          text: '$name',
          color: Color(0xff333333),
          fontSize: 16.sp,
        ),
        right1: (numberWidget == null)
            ? WidgetText.getTextNormal(
                text: targetValue,
                color: targetColor,
                fontSize: 16.sp,
              )
            : numberWidget,
        right2: (numberUnitWidget == null)
            ? Padding(
                padding: EdgeInsets.only(left: 8.w, right: 12.w),
                child: Image.asset(imageToRight),
              )
            : numberUnitWidget,
      ),
    );
  }

  /// 用药建议相关
  static layoutRowLeftLeftRightRight(
      {double width = 0,
      double height = 0,
      Widget? left1,
      Widget? left2,
      Widget? right1,
      Widget? right2,
      isRightExpand = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            (left1 == null) ? const SizedBox() : left1,
            (left2 == null) ? const SizedBox() : left2,
          ],
        ),
        Expanded(child: SizedBox()),
        isRightExpand
            ? Expanded(
                child: Row(
                  children: [
                    (right1 == null) ? const SizedBox() : right1,
                    (right2 == null) ? const SizedBox() : right2,
                  ],
                ),
              )
            : Row(
                children: [
                  (right1 == null) ? const SizedBox() : right1,
                  (right2 == null) ? const SizedBox() : right2,
                ],
              ),
      ],
    );
  }
}

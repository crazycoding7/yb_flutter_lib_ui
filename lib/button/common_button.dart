import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/ui_common_color.dart';
import '../style/common_style.dart';

///
/// 项目中经常使用到的按钮
class CommonButton {
  /// 页面底部的按钮
  /// title：按钮的标题
  /// onTap：点击事件
  static bottomButton({String title = '确定', required VoidCallback onTap}) {
    return Container(
      padding:
          EdgeInsets.only(top: 10.h, bottom: 30.h, left: 25.5.w, right: 25.5.w),
      color: Colors.white,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 44.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: UiCommonColors.appMain,
              borderRadius: BorderRadius.circular(22)),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  /// 带有红色边框的按钮
  /// title：按钮的标题
  /// onTap：点击事件
  static Widget redBorderButton({required String title, VoidCallback? onTap}) {
    return Container(
      height: 44,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0.r),
          ),
          side: BorderSide(width: 1.w, color: UiCommonColors.red_ff4d4f),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(color: UiCommonColors.red_ff4d4f),
        ),
      ),
    );
  }

  /// 单个确认按钮
  /// text：按钮的标题
  /// onTap：点击事件
  static Widget singleConfirmButton(
      {String? text = '确定', double height = 44, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          decoration: CommonDecoration.containerDecoration(
              color: UiCommonColors.appMain, radius: height / 2),
          alignment: Alignment.center,
          child: Text(text!,
              style: CommonTextStyle.commonStyle(
                  color: Colors.white, fontSize: 16))),
    );
  }

  static confirmButton({
    required VoidCallback? onTap,
    String? text = '确定',
  }) {
    return commonButton(
        text: text,
        buttonTextStyle: CommonTextStyle.buttonTextStyle(),
        onTap: onTap);
  }

  static cancelButton({required VoidCallback? onTap}) {
    return commonButton(
        text: '取消',
        buttonTextStyle: CommonTextStyle.cancelTextStyle(),
        onTap: onTap);
  }

  /// 通用的按钮
  /// text：按钮的标题
  /// buttonTextStyle：自定义标题文字样式
  /// onTap：点击事件
  static Widget commonButton(
      {String? text = '确定',
      required TextStyle buttonTextStyle,
      double height = 44,
      VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          alignment: Alignment.center,
          child: Text(text!, style: buttonTextStyle)),
    );
  }
}

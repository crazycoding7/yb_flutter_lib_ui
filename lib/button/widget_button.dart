// import 'package:common_widgets/common_widgets.dart';
// import 'package:common_widgets/src/colors/rgb_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../images/widget_image.dart';
import '../text/widget_text.dart';

class WidgetButton {
  static const Color color_1AB370 = Color(0xff1AB370);
  static const Color color_333333 = Color(0xff333333);
  static const Color colorE5E5E5 = Color(0xffE5E5E5);
  static const Color colorF5F5F5 = Color(0xffF5F5F5);

  /// 默认btn
  static getBtnNormal({
    bgColor = Colors.black,
    VoidCallback? onPressed,
    double radius = 0,
    Size? size,
    borderColor = Colors.transparent,
    required Widget child,
  }) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          //边框
          side: BorderSide(
              width: 1, style: BorderStyle.solid, color: borderColor),
          minimumSize: size,
        ),
        child: child);
  }

  /// 默认btn
  static getBtnOldNormal({
    String text = "",
    VoidCallback? onPressed,
    bgColor = color_1AB370,
    textColor = Colors.white,
    double fontSize = 18,
  }) {
    return getBtnNormal(
        bgColor: bgColor,
        onPressed: onPressed,
        size: Size(double.infinity, 44.w),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: fontSize),
        ),
        radius: 22);
  }

  static getBtnNormalForAll(
      {String text = "",
      VoidCallback? onPressed,
      Color bgColor = color_1AB370,
      Color textColor = Colors.white,
      double borderRadius = 22}) {
    return getBtnNormal(
        bgColor: bgColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 14.sp),
        ),
        radius: borderRadius);
  }

  static getBtnNormalForAllNew(
      {String text = "",
      VoidCallback? onPressed,
      Color bgColor = color_1AB370,
      Color textColor = Colors.white,
      double borderRadius = 22,
      double fontSize = 14}) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: BorderSide(
              width: 0.5,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ))),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize.sp,
        ),
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
    );
  }

  // 白底黑子带边框
  static getBtnNormalWhiteBlack(
      {String text = "", required VoidCallback? onPressed, double? width}) {
    return InkWell(
      onTap: () {
        onPressed!();
      },
      child: Container(
        width: width,
        height: 44.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(22)),
          border: Border.all(width: 1, color: colorE5E5E5),
        ),
        child: Text(
          text,
          style: TextStyle(color: color_333333, fontSize: 18.sp),
        ),
      ),
    );
  }

  // 药品租户边框
  static getBtnNormalWhiteBlackMedicine(
      {String text = "", required VoidCallback? onPressed, double? width}) {
    return InkWell(
      onTap: () {
        onPressed!();
      },
      child: Container(
        padding: const EdgeInsets.only(left: 4, right: 4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          border: Border.all(width: 1, color: color_1AB370),
        ),
        child: Text(
          text,
          style: TextStyle(color: color_1AB370, fontSize: 12.sp),
        ),
      ),
    );
  }

  /// 病情诊断btn
  static getBtnIllnessName({String text = "", VoidCallback? onPressed}) {
    // if (text.length > 8) {
    //   text = '${text.substring(0, 8)}...';
    // }
    return getBtnNormal(
        bgColor: colorF5F5F5,
        onPressed: onPressed,
        child: Padding(
          child: WidgetText.getTextNormal(
            text: text,
            color: color_333333,
            fontSize: 14.sp,
          ),
          padding:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 6.w, bottom: 6.w),
        ),
        radius: 22);
  }

  static bottomButton(
      {String text = '确定', double fontSize = 18, VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      child: Container(
        height: 44,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 8, bottom: 8),
        decoration: BoxDecoration(
            color: color_1AB370, borderRadius: BorderRadius.circular(22)),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ),
    );
  }

  static buttonWithIcon(String iconPath,
      {String text = '添加', double fontSize = 16, VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: color_1AB370, borderRadius: BorderRadius.circular(22)),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetImage.asset(iconPath),
            SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: fontSize),
            ),
          ],
        ),
      ),
    );
  }
}

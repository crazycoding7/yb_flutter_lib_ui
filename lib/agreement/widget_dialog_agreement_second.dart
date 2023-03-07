import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yb_flutter_lib_ui/agreement/widget_dialog_agreement_app.dart';

import '../button/widget_button.dart';
import '../color/ui_common_color.dart';
import '../text/widget_text.dart';
import '../widget_small.dart';

/// 隐私协议弹窗(Second)
class WidgetDialogAgreementSecond extends Dialog {
  ///点击背景是否能够退出
  final bool canceledOnTouchOutside;
  final YbCallback restartDialogCallBack;

  const WidgetDialogAgreementSecond(
      {Key? key,
      required this.canceledOnTouchOutside,
      required this.restartDialogCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(

        ///背景透明
        color: Colors.transparent,

        ///保证控件居中效果
        child: Stack(
          children: <Widget>[
            GestureDetector(
              ///点击事件
              onTap: () {
                if (canceledOnTouchOutside) {
                  Navigator.pop(context);
                }
              },
            ),
            Center(
              child: _getBody(context),
            ),
          ],
        ));
  }

  _getBody(BuildContext context) {
    return Container(
      decoration: WidgetSmall.bgRadius(color: Colors.white, radius: 8),
      width: 280.w,
      height: 250.h,
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h, top: 13.h),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  WidgetText.getTextNormal(
                    text: '温馨提示',
                    color: UiCommonColors.color_333333,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          "1.您需要同意本隐私权政策和用户协议才能继续使用医联\n\n 2.若您不同意本隐私权政策和用户协议，很遗憾我们将无法为您提供服务",
                      style: TextStyle(
                          color: UiCommonColors.color_666666, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 44.h,
            child: Row(
              children: [
                Expanded(
                  child: WidgetButton.getBtnNormalWhiteBlack(
                      text: '退出应用',
                      onPressed: () {
                        if (Platform.isIOS) {
                          exit(0);
                        } else {
                          SystemNavigator.pop();
                        }
                      }),
                ),
                SizedBox(
                    height: 44.h,
                    child: const VerticalDivider(
                      color: UiCommonColors.colorF5F5F5,
                    )),
                Expanded(
                  child: WidgetButton.getBtnOldNormal(
                      text: '查看协议',
                      onPressed: () {
                        Navigator.pop(context);
                        restartDialogCallBack();
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

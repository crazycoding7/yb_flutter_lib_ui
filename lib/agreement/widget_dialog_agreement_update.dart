import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:yb_flutter_lib_ui/agreement/widget_dialog_agreement_app.dart';
import 'package:yb_flutter_lib_ui/agreement/widget_dialog_agreement_second.dart';

import '../button/widget_button.dart';
import '../color/ui_common_color.dart';
import '../text/widget_text.dart';
import '../widget_small.dart';
import 'agreement_richview.dart';

/// 隐私协议弹窗(First)
class UIWidgetDialogAgreementUpdate extends Dialog {
  ///点击背景是否能够退出
  final bool canceledOnTouchOutside;
  final UIYbCallback rightCallBack;
  final UIYbCallback restartDialogCallBack;

  final UIContractController _controller = UIContractController();

  UIWidgetDialogAgreementUpdate(
      {Key? key,
      required this.canceledOnTouchOutside,
      required this.rightCallBack,
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
      alignment: Alignment.center,
      width: 280.w,
      height: 230.h,
      decoration: WidgetSmall.bgRadius(color: Colors.white, radius: 8),
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h, top: 20.h),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  WidgetText.getTextNormal(
                    text: '隐私政策条款和条件已有更新',
                    color: UICommonColors.color_333333,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "感谢您信任并使用易赋诊！\n\n",
                        style: TextStyle(
                            color: UICommonColors.color_666666,
                            fontSize: 12.sp),
                        children: [
                          TextSpan(
                              text: "《隐私政策》",
                              style: const TextStyle(
                                  color: UICommonColors.appMain),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  SmartDialog.dismiss();
                                  _controller.getData(
                                      UIAgreementConfig.doctor_privacy);
                                }),
                          const TextSpan(text: '已更新,您必须阅读并接受新的条款与条件，才能继续进行。\n'),
                        ]),
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
                      text: '不同意',
                      onPressed: () {
                        Navigator.pop(context);
                        _clickNoAgree(context);
                      }),
                ),
                SizedBox(
                    height: 44.h,
                    child: const VerticalDivider(
                      color: UICommonColors.colorF5F5F5,
                    )),
                Expanded(
                  child: WidgetButton.getBtnOldNormal(
                      text: '同意',
                      onPressed: () {
                        Navigator.pop(context);
                        rightCallBack();
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _clickNoAgree(BuildContext context) async {
    var alertDialogs = await showDialog(
        context: context,
        builder: (context) {
          return WillPopScope(
              child: WidgetDialogAgreementSecond(
                canceledOnTouchOutside: false,
                restartDialogCallBack: restartDialogCallBack,
              ),
              onWillPop: () async => false);
        });

    return alertDialogs;
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:yb_flutter_lib_ui/agreement/widget_dialog_agreement_second.dart';

import '../button/widget_button.dart';
import '../color/common_color.dart';
import '../text/widget_text.dart';
import '../widget_small.dart';
import 'agreement_richview.dart';

typedef YbCallback = void Function();


/// 隐私协议弹窗(First)
class WidgetDialogAgreementApp extends Dialog {
  ///点击背景是否能够退出
  final bool canceledOnTouchOutside;
  final YbCallback rightCallBack;
  final YbCallback restartDialogCallBack;

  final ContractController _controller = ContractController();

  WidgetDialogAgreementApp(
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
      height: 405.h,
      decoration: WidgetSmall.bgRadius(color: Colors.white, radius: 8),
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h, top: 13.h),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  WidgetText.getTextNormal(
                    text: '隐私政策',
                    color: CommonColors.color_333333,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "感谢您信任并使用易赋诊！\n\n"
                            "我们甚至个人信息对您的重要性，并尊重您对个人隐私的各种权利。"
                            "我们将严格在国家法律法规允许范围内，且只以为您提供服务为目的的收集必要相关信息。"
                            "\n\n"
                            "为了便于您更详细了解您的权利和义务，请您仔细阅读",
                        style: TextStyle(
                            color: CommonColors.color_666666, fontSize: 12.sp),
                        children: [
                          TextSpan(
                              text: "《用户协议》",
                              style:
                                  const TextStyle(color: CommonColors.appMain),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  SmartDialog.dismiss();
                                  _controller
                                      .getData(AgreementConfig.doctor_user);
                                }),
                          const TextSpan(text: '及'),
                          TextSpan(
                              text: "《隐私政策》",
                              style:
                                  const TextStyle(color: CommonColors.appMain),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  SmartDialog.dismiss();
                                  _controller
                                      .getData(AgreementConfig.doctor_privacy);
                                }),
                          const TextSpan(text: ',并郑重做出授权与否的决定。\n'),
                          const TextSpan(
                              text: '1. 为保障您的账户安全，识别账户异常状态，保障交易安全，我们将收集您所使用的'),
                          new TextSpan(
                              text:
                                  '设备相关信息(包括但不限于IMEI、IMSI、设备MAC地址、软件列表、设备序列号、androidID)',
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                          const TextSpan(
                              text: '；\n2. 为提升您的浏览体验，我们将缓存部分首页图片，为此需读取你的'),
                          new TextSpan(
                              text: 'SD卡权限',
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                          const TextSpan(text: '，如您需要更换头像需要调用'),
                          new TextSpan(
                              text: '相册权限',
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                          const TextSpan(
                              text: '，如您需要更换头像需要调用，但我们不主动读取你的SD卡数据；\n'),
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
                      color: CommonColors.colorF5F5F5,
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

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../color/ui_common_color.dart';
import '../style/common_style.dart';
import '../text/widget_text.dart';
import '../widget_small.dart';

class WidgetDialog {
  /// 底部选择窗
  ///
  /// [data] 列表数据
  /// [selected] 默认选择
  /// [onChanged] 回调
  /// [indexCallback] 根据索引回调
  static genBottomSelectDialog(
      {required List<String> data,
      String selected = '',
      String title = '请选择',
      SelectedCallback? indexCallback,
      ValueChanged<String>? onChanged}) {
    data.insert(0, title);
    List<Widget> list = [];

    Color color;
    for (int i = 0; i < data.length; i++) {
      if (i == 0) {
        color = UICommonColors.color_999999;
        list.add(Container(
          decoration: WidgetSmall.bgRadiusTop(
              color: Colors.white, bottomLeft: 18, bottomRight: 18),
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          child: WidgetText.getTextNormal(
            text: data[i],
            color: color,
            fontSize: 16.sp,
          ),
        ));
        continue;
      } else if (data[i] == selected) {
        color = UICommonColors.color_1AB370;
      } else {
        color = UICommonColors.color_323232;
      }

      list.add(InkWell(
        onTap: () {
          if (i == 0) {
            return;
          }
          if (onChanged != null) {
            onChanged(data[i]);
          }
          if (indexCallback != null) {
            indexCallback(i - 1);
          }
          SmartDialog.dismiss();
        },
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          child: WidgetText.getTextNormal(
            text: data[i],
            color: color,
            fontSize: 16.sp,
          ),
        ),
      ));
    }

    SmartDialog.show(
        alignment: Alignment.bottomCenter,
        clickMaskDismiss: true,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(bottom: 20),
            color: Colors.white,
            constraints:
                BoxConstraints(maxHeight: (50 * data.length).toDouble() + 20),
            child: Column(
              children: list,
            ),
          );
        });
  }

  /// 弹窗(标题+提示+单个按钮)
  static showOKAlert({
    required String title,
    String? message,
    String okText = '确定',
    bool isHtml = false,
    required Function callBackOK,
  }) {
    if (TextUtil.isEmpty(message) || message == 'null') {
      return;
    }
    SmartDialog.show(
        alignment: Alignment.center,
        clickMaskDismiss: true,
        builder: (context) {
          return Container(
            decoration: WidgetSmall.bgRadius(color: Colors.white, radius: 8),
            width: 280.w,
            height: 160.h,
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: WidgetText.getTextNormal(
                      text: title,
                      color: UICommonColors.color_333333,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 16.w),
                      child: isHtml
                          ? (Html(
                              data: message ?? '',
                              style: {
                                'body': Style(
                                    margin: EdgeInsets.zero,
                                    padding: EdgeInsets.zero),
                              },
                            ))
                          : WidgetText.getTextNormal(
                              text: message ?? '',
                              color: UICommonColors.color_333333,
                              fontSize: 14.sp,
                            ),
                    ),
                  ),
                ),
                const Divider(
                  color: UICommonColors.colorF5F5F5,
                  height: 1,
                ),
                SizedBox(
                  height: 44.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            callBackOK();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: WidgetText.getTextNormal(
                              text: okText,
                              color: UICommonColors.color_1AB370,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  /// 弹窗(标题+两个按钮)
  static showConfirmNormal(
      {required String title,
      String? desc,
      String leftText = '取消',
      String rightText = '确定',
      required Function callBackLeft,
      required Function callBackRight}) {
    SmartDialog.show(
        alignment: Alignment.center,
        clickMaskDismiss: true,
        builder: (context) {
          return Container(
            decoration: WidgetSmall.bgRadius(color: Colors.white, radius: 8),
            width: 280.w,
            height: 160.h,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetText.getTextNormal(
                          text: title,
                          color: UICommonColors.color_333333,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        TextUtil.isEmpty(desc)
                            ? SizedBox()
                            : SizedBox(
                                height: 8.h,
                              ),
                        TextUtil.isEmpty(desc)
                            ? SizedBox()
                            : WidgetText.getTextNormal(
                                text: desc ?? '',
                                color: UICommonColors.color_999999,
                                fontSize: 14.sp,
                              ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: UICommonColors.colorF5F5F5,
                  height: 1,
                ),
                SizedBox(
                  height: 44.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            callBackLeft();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: WidgetText.getTextNormal(
                              text: leftText,
                              color: UICommonColors.color_999999,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 44.h,
                          child: const VerticalDivider(
                            color: UICommonColors.colorF5F5F5,
                          )),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            callBackRight();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: WidgetText.getTextNormal(
                              text: rightText,
                              color: UICommonColors.color_1AB370,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  // /// 升级弹窗(标题+两个按钮)
  // static showUpdateVersion({required VersionBody versionBody}) {
  //   SmartDialog.show(
  //       alignment: Alignment.center,
  //       clickMaskDismiss: true,
  //       builder: (context) {
  //         return DialogUpdateVersion(
  //           versionBody: versionBody,
  //         );
  //       });
  // }
}

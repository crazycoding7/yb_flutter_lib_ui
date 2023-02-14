import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../border/common_border.dart';
import '../color/common_color.dart';
import '../style/common_style.dart';

class CommonDialog {
  static Widget confirmDialog(
      {required BuildContext context,
      String title = '提示',
      String tip = '请确认您的操作！',
      String leftTip = '取消',
      String rightTip = '确认',
      int height = 160,
      VoidCallback? confirmCallback,
      VoidCallback? leftConfirmCallback}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(60.w, 0, 60.w, 0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          // width: 400,
          height: height.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Text(
                title,
                style: TextStyle(
                    color: CommonColors.black_333333,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Text(
                  tip,
                  style: TextStyle(
                      fontSize: 14.sp, color: CommonColors.grey_999999),
                ),
              ),
              Expanded(child: SizedBox()),
              CommonDivider.commonDivider(),
              Container(
                height: 48.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          if (leftConfirmCallback != null) {
                            leftConfirmCallback();
                          }
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            leftTip,
                            style: TextStyle(
                                color: CommonColors.grey_999999, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    CommonDivider.commonVerticalDivider(),
                    Expanded(
                      child: GestureDetector(
                        onTap: confirmCallback,
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            rightTip,
                            style: TextStyle(
                                color: CommonColors.appMain, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                  ],
                ),
              ),
              SizedBox(height: 8.h)
            ],
          ),
        ),
      ),
    );
  }

  static Widget commonInputTipDialog(
      {required BuildContext context,
      required TextEditingController textEditingController,
      String title = '提示',
      String hint = '请输入',
      String tipText = '例如',
      bool showTip = false,
      int maxLength = 100,
      VoidCallback? confirmCallback}) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 47.5.w, right: 47.5.w),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 48,
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: CommonColors.black_333333,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 24.w, right: 24.w),
                    height: 80.h,
                    child: TextField(
                      maxLines: 100,
                      maxLength: maxLength,
                      cursorColor: CommonColors.appMain,
                      controller: textEditingController,
                      keyboardAppearance: Brightness.light,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CommonColors.grey_f5f5f5,
                        hintText: hint,
                        counterText: '',
                        //去掉最大字符显示
                        hintStyle: TextStyle(
                            fontSize: 14, color: CommonColors.grey_999999),
                        contentPadding: EdgeInsets.only(left: 12, top: 12),

                        border: CommonBorder.outLineBorder(),
                        //keyboardType: TextInputType.number, //键盘类型
                        //obscureText: true,//密码模式
                        focusedBorder: CommonBorder.outLineBorder(),
                        enabledBorder: CommonBorder.outLineBorder(),
                        disabledBorder: CommonBorder.outLineBorder(),
                        focusedErrorBorder: CommonBorder.outLineBorder(),
                        errorBorder: CommonBorder.outLineBorder(),

                        // border: InputBorder
                      ),
                    ),
                  ),
                  Visibility(
                      visible: showTip,
                      child: SizedBox(
                        height: 8.h,
                      )),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 24.w, right: 24.w),
                    child: Text(
                      tipText,
                      style: CommonTextStyle.commonStyle(
                          fontSize: 10.sp, color: CommonColors.grey_999999),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CommonDivider.commonDivider(),
                  Container(
                    height: 44.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                '取消',
                                style: TextStyle(
                                    color: CommonColors.grey_999999,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        CommonDivider.commonVerticalDivider(),
                        Expanded(
                          child: GestureDetector(
                            onTap: confirmCallback,
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                '确认',
                                style: TextStyle(
                                    color: CommonColors.appMain, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget commonInputDialog(
      {required BuildContext context,
      required TextEditingController textEditingController,
      String title = '提示',
      String hint = '请输入',
      int maxLength = 100,
      VoidCallback? confirmCallback}) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(60.w, 0, 60.w, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.only(top: 8, bottom: 4),
            // width: 400,
            height: 230.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 48,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: CommonColors.black_333333,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                  height: 80,
                  child: TextField(
                    maxLines: 100,
                    maxLength: maxLength,
                    cursorColor: CommonColors.appMain,
                    controller: textEditingController,
                    keyboardAppearance: Brightness.light,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: CommonColors.grey_f5f5f5,
                      hintText: hint,
                      counterText: '',
                      //去掉最大字符显示
                      hintStyle: TextStyle(
                          fontSize: 14, color: CommonColors.grey_999999),
                      contentPadding: EdgeInsets.only(left: 12, top: 12),

                      border: CommonBorder.outLineBorder(),
                      //keyboardType: TextInputType.number, //键盘类型
                      //obscureText: true,//密码模式
                      focusedBorder: CommonBorder.outLineBorder(),
                      enabledBorder: CommonBorder.outLineBorder(),
                      disabledBorder: CommonBorder.outLineBorder(),
                      focusedErrorBorder: CommonBorder.outLineBorder(),
                      errorBorder: CommonBorder.outLineBorder(),

                      // border: InputBorder
                    ),
                  ),
                ),
                SizedBox(height: 24),
                CommonDivider.commonDivider(),
                Container(
                  height: 44.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '取消',
                              style: TextStyle(
                                  color: CommonColors.grey_999999,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      CommonDivider.commonVerticalDivider(),
                      Expanded(
                        child: GestureDetector(
                          onTap: confirmCallback,
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '确认',
                              style: TextStyle(
                                  color: CommonColors.appMain, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget commonDialog(
      {required BuildContext context,
      required TextEditingController textEditingController,
      String title = '提示',
      VoidCallback? confirmCallback}) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(60.w, 0, 60.w, 0),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              height: 300.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 48.h,
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: CommonColors.black_333333, fontSize: 16.sp),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: TextField(
                        maxLines: 100,
                        maxLength: 100,
                        cursorColor: CommonColors.appMain,
                        controller: textEditingController,
                        keyboardAppearance: Brightness.light,
                        decoration: InputDecoration(
                          hintText: '请输入',
                          hintStyle: TextStyle(
                              fontSize: 14, color: CommonColors.grey_999999),
                          contentPadding: EdgeInsets.only(left: 12, top: 12),

                          border: CommonBorder.outLineBorder(),
                          //keyboardType: TextInputType.number, //键盘类型
                          //obscureText: true,//密码模式
                          focusedBorder: CommonBorder.outLineBorder(),
                          enabledBorder: CommonBorder.outLineBorder(),
                          disabledBorder: CommonBorder.outLineBorder(),
                          focusedErrorBorder: CommonBorder.outLineBorder(),
                          errorBorder: CommonBorder.outLineBorder(),

                          // border: InputBorder
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    // height: 48.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 16.w),
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.r),
                              ),
                              side: BorderSide(
                                  width: 0.5.w,
                                  color: CommonColors.grey_e5e5e5),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              '取消',
                              style:
                                  TextStyle(color: CommonColors.black_333333),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: CommonColors.appMain,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22.r),
                                ),
                                side: BorderSide(
                                    width: 1.w, color: CommonColors.appMain),
                              ),
                              onPressed: confirmCallback,
                              child: Text(
                                '确认',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        SizedBox(width: 16.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

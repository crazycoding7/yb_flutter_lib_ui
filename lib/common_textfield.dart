import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yb_flutter_lib_ui/border/common_border.dart';

import 'color/ui_common_color.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {Key? key,
      this.maxLength = 100,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.hint = '请输入',
      this.maxLines = 1,
      required this.height,
      required this.width})
      : super(key: key);

  final double height;
  final double width;
  final int maxLength;
  final int maxLines;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextField(
        maxLines: maxLines,
        maxLength: maxLength,
        cursorColor: UICommonColors.appMain,
        cursorWidth: 1.w,
        // cursorHeight: height / 2,
        controller: controller,
        keyboardAppearance: Brightness.light,
        keyboardType: keyboardType,
        style: TextStyle(
            color: UICommonColors.black_333333,
            fontSize: 12.sp,
            textBaseline: TextBaseline.ideographic),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          counterText: '',
          //去掉最大字符显示
          // hintStyle:
          //     TextStyle(fontSize: 14.sp, color: UICommonColors.grey_999999),
          // contentPadding: EdgeInsets.only(left: 12, top: 12),
          contentPadding: EdgeInsets.only(left: 4.w, top: 4.w),
          border: CommonBorder.outLineBorder(),
          focusedBorder: CommonBorder.outLineBorder(),
          enabledBorder: CommonBorder.outLineBorder(),
          disabledBorder: CommonBorder.outLineBorder(),
          focusedErrorBorder: CommonBorder.outLineBorder(),
          errorBorder: CommonBorder.outLineBorder(),
        ),
      ),
    );
  }
}

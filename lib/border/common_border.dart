import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/common_color.dart';

class CommonBorder {
  static OutlineInputBorder outLineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(width: 0.5.w, color: CommonColors.grey_e5e5e5),
    );
  }
}

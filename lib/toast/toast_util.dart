import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../color/common_color.dart';

class ToastUtil {
  static show(
    String message, {
    alignment = Alignment.center,
  }) {
    SmartDialog.showToast(message, alignment: alignment);
  }

  static flutterShow(
    String message, {
    alignment = Alignment.center,
    backgroundColor = Colors.white,
    textColor = CommonColors.black_333333,
  }) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: 14.0);
  }
}

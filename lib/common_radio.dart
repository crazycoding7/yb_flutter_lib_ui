import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color/ui_common_color.dart';


class CommonRadio extends StatelessWidget {
  const CommonRadio(
      {Key? key,
      required this.groupValue,
      required this.value,
      this.onChange,
      required this.title})
      : super(key: key);
  final int groupValue;
  final int value;
  final String title;
  final ValueChanged? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Row(
        children: [
          Radio(
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                //获取焦点时的颜色
                return UICommonColors.appMain;
              }
              //默认状态使用灰色
              return UICommonColors.grey_c0c0c0;
            }),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            value: value,
            groupValue: groupValue,
            onChanged: onChange,
          ),
          SizedBox(
            width: 8,
          ),
          Container(
              child: Text(
            title,
            style: TextStyle(
                fontSize: 14.sp,
                color: groupValue == value
                    ? UICommonColors.black_333333
                    : UICommonColors.grey_999999),
          ))
          // Switch(value: value, onChanged: onChanged)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yb_flutter_lib_ui/text/widget_text.dart';

import 'color/ui_common_color.dart';

class CommonTags extends StatelessWidget {
  const CommonTags({Key? key, required this.tags}) : super(key: key);
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    tags.forEach((element) {
      Widget item = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding:
                  EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h, bottom: 2.h),
              decoration: BoxDecoration(
                  color: UICommonColors.grey_f5f5f5,
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: UICommonColors.grey_eeeeee)),
              alignment: Alignment.center,
              child: WidgetText.getTextNormal(
                text: element.length < 10
                    ? element
                    : '${element.substring(0, 10)}...',
                color: UICommonColors.grey_999999,
                fontSize: 10,
              )),
          SizedBox(width: 4)
        ],
      );
      widgetList.add(item);
    });
    return Wrap(runSpacing: 2.w, spacing: 2, children: widgetList);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image/common_images.dart';
import 'images/widget_image.dart';

typedef OnClickCallback = void Function(int clickIndex);

/// 单选widget封装(行对齐方式)
class RadioBtnWidget extends StatefulWidget {
  final List<Widget> widgets;
  final int defaultSelectedIndex;
  final OnClickCallback onClickCallback;
  final double padding;

  const RadioBtnWidget(
      {Key? key,
      required this.widgets,
      required this.onClickCallback,
      required this.defaultSelectedIndex,
      required this.padding})
      : super(key: key);

  @override
  _RadioBtnWidgetState createState() => _RadioBtnWidgetState();
}

class _RadioBtnWidgetState extends State<RadioBtnWidget> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.defaultSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _genRowContent(),
    );
  }

  /// 选项生成
  _genRowContent() {
    List<Widget> list = [];
    for (int i = 0; i < widget.widgets.length; i++) {
      Widget item = InkWell(
        onTap: () {
          if (selectedIndex == i) {
            return;
          }
          selectedIndex = i;
          setState(() {});
          widget.onClickCallback(selectedIndex);
        },
        child: Row(
          children: [
            (i == selectedIndex)
                ? WidgetImage.asset(UICommonImages.commonRadioSelected)
                : WidgetImage.asset(UICommonImages.commonRadioNull),
            SizedBox(
              width: 8.w,
            ),
            widget.widgets[i],
          ],
        ),
      );
      list.add(item);
      if (widget.widgets.length != 1 && i != widget.widgets.length - 1) {
        list.add(SizedBox(
          width: widget.padding,
        ));
      }
    }

    return list;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color/ui_common_color.dart';

typedef OnClickCallback = void Function(int clickIndex);

/// 商品尺寸选择组件(每行显示3个按钮)
class ShoppingSelectSizeWidget extends StatefulWidget {
  final int defaultSelectedIndex;
  final List<String> shopSizeList;
  final OnClickCallback onClickCallback;

  const ShoppingSelectSizeWidget(
      {Key? key,
      required this.shopSizeList,
      required this.onClickCallback,
      this.defaultSelectedIndex = -1})
      : super(key: key);

  @override
  _ShoppingSelectSizeWidget createState() => _ShoppingSelectSizeWidget();
}

class _ShoppingSelectSizeWidget extends State<ShoppingSelectSizeWidget> {
  int selectedIndex = -1;

  _getSize() {
    if (selectedIndex == -1 && widget.defaultSelectedIndex != -1) {
      selectedIndex = widget.defaultSelectedIndex;
    }

    List<Widget> list = [];
    for (int i = 0; i < widget.shopSizeList.length; i++) {
      Color selectColor;
      if (selectedIndex == i) {
        selectColor = UICommonColors.color_2874F0;
      } else {
        selectColor = UICommonColors.colorD9D9D9;
      }

      list.add(GestureDetector(
        onTap: () {
          selectedIndex = i;
          setState(() {});
          widget.onClickCallback(selectedIndex);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
          decoration: BoxDecoration(
              border: Border.all(color: selectColor, width: 0.5),
              borderRadius: BorderRadius.circular((2))),
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(7), right: ScreenUtil().setWidth(7)),
          height: ScreenUtil().setWidth(33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.shopSizeList[i],
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(14), color: selectColor),
              )
            ],
          ),
        ),
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = Wrap(
      spacing: 10.0, // 主轴(水平)方向间距
      runSpacing: 0.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.start, //沿主轴方向居中
      children: _getSize(),
    );

    return Container(
      color: Colors.transparent,
      width: ScreenUtil().screenWidth,
      child: widget,
    );
  }
}

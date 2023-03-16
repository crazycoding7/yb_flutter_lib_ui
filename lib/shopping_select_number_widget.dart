import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color/ui_common_color.dart';

typedef OnClickCallback = void Function(int clickIndex);

/// 商品数量选择组件
class ShoppingSelectNumberWidget extends StatefulWidget {
  final int defaultNumber;
  final int maxNumber;
  final bool isReset;
  final OnClickCallback onClickCallback;

  const ShoppingSelectNumberWidget(
      {Key? key,
      required this.onClickCallback,
      this.defaultNumber = 1,
      this.maxNumber = 99,
      this.isReset = false})
      : super(key: key);

  @override
  _ShoppingSelectNumberWidget createState() => _ShoppingSelectNumberWidget();
}

class _ShoppingSelectNumberWidget extends State<ShoppingSelectNumberWidget> {
  int selectedNumber = -1;

  _genWidget() {
    List<Widget> buttonList = [const Text(''), const Text(''), const Text('')];

    Color numCutBgColor;
    Color numCutTextColor;
    if (selectedNumber == 1 ||
        (selectedNumber == -1 && widget.defaultNumber == 1)) {
      numCutBgColor = UICommonColors.colorF4F4F4;
      numCutTextColor = UICommonColors.colorDDDDDD;
    } else {
      numCutBgColor = UICommonColors.colorEAEAEA;
      numCutTextColor = UICommonColors.color_333333;
    }

    Widget numCut = GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(30),
        height: ScreenUtil().setWidth(21),
        color: numCutBgColor,
        child: Text(
          '-',
          style: TextStyle(color: numCutTextColor, fontSize: 12),
        ),
      ),
      onTap: () {
        if (selectedNumber == -1) {
          selectedNumber = widget.defaultNumber;
        }

        if (selectedNumber != 1) {
          selectedNumber--;
          setState(() {});
          widget.onClickCallback(selectedNumber);
        }
      },
    );
    Widget numAdd = GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(30),
        height: ScreenUtil().setWidth(21),
        color: numCutBgColor,
        child: const Text(
          '+',
          style: TextStyle(color: UICommonColors.color_333333, fontSize: 12),
        ),
      ),
      onTap: () {
        if (selectedNumber == -1) {
          selectedNumber = widget.defaultNumber;
        }
        if (selectedNumber < widget.maxNumber) {
          selectedNumber++;
          setState(() {});
          widget.onClickCallback(selectedNumber);
        }
      },
    );
    Widget numText = Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(30),
      height: ScreenUtil().setWidth(21),
      color: numCutBgColor,
      child: Text(
        '${selectedNumber == -1 ? widget.defaultNumber : selectedNumber}',
        style: const TextStyle(color: UICommonColors.color_333333, fontSize: 12),
      ),
    );
    buttonList[0] = numCut;
    buttonList[1] = Padding(
      padding: const EdgeInsets.only(left: 1, right: 1),
      child: numText,
    );
    buttonList[2] = numAdd;

    return buttonList;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isReset) {
      selectedNumber = widget.defaultNumber;
    }

    return Row(
      children: _genWidget(),
    );
  }
}

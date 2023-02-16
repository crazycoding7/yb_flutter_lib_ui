import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/common_color.dart';
import '../image/common_images.dart';
import '../text/widget_text.dart';

typedef OnBackClickCallback = void Function();

/// common title
class TitleWidget extends StatefulWidget {
  final String title;
  final String titleIconPath;
  final String titleRightIconPath;
  final String titleRightTextPath;
  final Color color;
  final bool isBlackBackIcon;
  final bool isHiddenLeftIcon; // 返回图标是否隐藏
  final OnBackClickCallback? onBackClickCallback;
  final OnBackClickCallback? onRightClickCallback;
  final bool isWhiteTheme;
  final String titleRightSecondIconPath;
  final OnBackClickCallback? onRightSecondClickCallback;

  const TitleWidget(
      {Key? key,
      this.titleRightTextPath = '',
      this.title = "",
      this.titleIconPath = "",
      this.titleRightIconPath = "",
      this.color = CommonColors.color_1AB370,
      this.isBlackBackIcon = false,
      this.isHiddenLeftIcon = false,
      this.onBackClickCallback,
      this.onRightClickCallback,
      this.isWhiteTheme = false,
      this.titleRightSecondIconPath = '',
      this.onRightSecondClickCallback})
      : super(key: key);

  @override
  _TitleWidget createState() => _TitleWidget();
}

class _TitleWidget extends State<TitleWidget> {
  /// gen left and right icon&event.
  _genTitleLeftAndRightWidget() {
    // 存放左中右三个组件
    List<Widget> resultList = <Widget>[];
    String backImagePath = widget.isWhiteTheme
        ? CommonImages.commonTitleBackBlackIcon
        : CommonImages.commonTitleBackIcon;

    if (!widget.isHiddenLeftIcon) {
      Widget backWidget = GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          alignment: Alignment.centerLeft,
          height: double.infinity,
          width: 48.w,
          child: Image.asset(backImagePath),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          if (widget.onBackClickCallback != null) {
            widget.onBackClickCallback!();
          } else {
            Navigator.of(context).pop();
          }
        },
      );
      resultList.add(backWidget);
    } else {
      resultList.add(const Text(""));
    }

    /// add right icon
    if (widget.titleRightIconPath.isNotEmpty ||
        widget.titleRightTextPath.isNotEmpty) {
      Widget rightWidget = GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          alignment: Alignment.centerRight,
          child: widget.titleRightIconPath.isNotEmpty
              ? Image.asset(widget.titleRightIconPath)
              : WidgetText.getTextNormal(
                  text: widget.titleRightTextPath, fontSize: 14.sp),
        ),
        onTap: () {
          if (widget.onRightClickCallback != null) {
            widget.onRightClickCallback!();
          }
        },
      );

      ///add right second(执业指南)
      if (widget.titleRightSecondIconPath.isNotEmpty) {
        var rightRow = Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (widget.onRightSecondClickCallback != null) {
                  widget.onRightSecondClickCallback!();
                }
              },
              child: Image.asset(widget.titleRightSecondIconPath),
            ),
            SizedBox(
              width: 12.w,
            ),
            rightWidget,
          ],
        );
        resultList.add(rightRow);
      } else {
        resultList.add(rightWidget);
      }
    }

    return resultList;
  }

  /// gen title widget
  _getTitleWidget() {
    if (widget.titleIconPath.isEmpty) {
      return Text(
        widget.title,
        maxLines: 1,
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: ScreenUtil().setWidth(18),
            fontWeight: FontWeight.normal,
            color: widget.isWhiteTheme ? Colors.black : Colors.white),
      );
    } else {
      return Image.asset(widget.titleIconPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.isWhiteTheme ? Colors.white : widget.color,
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().statusBarHeight + 48.w,
      child: Column(
        children: [
          SizedBox(
            height: ScreenUtil().statusBarHeight,
          ),
          Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(14),
                  right: ScreenUtil().setWidth(14)),
              height: 48.w,
              width: ScreenUtil().screenWidth,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40.w, right: 30.w),
                    child: _getTitleWidget(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _genTitleLeftAndRightWidget(),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
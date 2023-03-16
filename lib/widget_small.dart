import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yb_flutter_lib_ui/text/widget_text.dart';
import '../color/ui_common_color.dart';
import 'image/common_images.dart';
import 'images/widget_image.dart';

class WidgetSmall {
  /// 圆角背景
  static bgRadius({Color color = Colors.transparent, double radius = 0}) =>
      BoxDecoration(
        color: color,
        border: Border.all(color: Colors.transparent, width: 0.0),
        borderRadius: BorderRadius.circular(radius),
      );

  /// 圆形背景
  static bgRadiusCircle(
          {Color color = Colors.transparent, double radius = 0}) =>
      BoxDecoration(
        color: color,
        border: Border.all(color: Colors.transparent, width: 0.0),
        shape: BoxShape.circle,
      );

  /// 圆形背景(带边框)
  static bgRadiusCircleWithBorder(
          {Color color = Colors.transparent,
          borderColor = UICommonColors.colorE5E5E5,
          double radius = 0,
          double width = 1.0}) =>
      BoxDecoration(
        color: color,
        border: Border.all(color: borderColor, width: width),
        borderRadius: BorderRadius.circular(radius),
      );

  /// 底部圆角背景
  static bgRadiusBottom(
          {Color color = Colors.transparent,
          double bottomLeft = 0,
          double bottomRight = 0}) =>
      BoxDecoration(
        color: color,
        border: Border.all(color: color, width: 0.0),
        borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(bottomLeft, bottomRight)),
      );

  /// 顶部圆角背景
  static bgRadiusTop(
          {Color color = Colors.transparent,
          double bottomLeft = 0,
          double bottomRight = 0}) =>
      BoxDecoration(
        color: color,
        border: Border.all(color: color, width: 0.0),
        borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(bottomLeft, bottomRight)),
      );

  /// 圆角渐变,垂直方向
  static bgRadiusGradientVer(
      {Color begin = Colors.transparent,
      Color end = Colors.transparent,
      double radius = 0}) {
    return BoxDecoration(
      border: Border.all(color: Colors.transparent, width: 0.0),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        tileMode: TileMode.clamp,
        colors: [
          begin,
          end,
        ],
      ),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static btnNextStep() {}

  /// 背景+左边图标+右边文字(居中) widget设计
  static btnLeftIconRightText({
    double width = 0,
    double height = 0,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
    BoxDecoration? boxDecoration,
    String iconPath = "",
    Text? text,
    double paddingLeft = 0,
    double paddingRight = 0,
  }) {
    return Container(
      alignment: Alignment.center,
      width: (width > 0) ? width : null,
      height: height,
      decoration:
          (boxDecoration == null) ? const BoxDecoration() : boxDecoration,
      child: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            WidgetImage.asset(iconPath),
            SizedBox(
              width: 1.5.w,
            ),
            (text == null) ? const Text("") : text,
          ],
        ),
      ),
    );
  }

  /// 图标小红点Widget
  ///
  /*
  static iconRedDotWidget(
      {double iconWidth = 0,
      double iconHeight = 0,
      double redDotRadius = 0,
      String iconPath = "",
      Text? text}) {
    late Widget pic;
    if (!RegExpUtil.isUrl(iconPath)) {
      pic = WidgetImage.asset(iconPath);
    } else {
      pic = CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: iconPath,
        width: iconWidth,
        height: iconHeight,
        errorWidget: (context, url, error) =>
            WidgetImage.asset(CommonImages.pageHomeMenuOnlineCounsel),
      );
    }

    return SizedBox(
      width: iconWidth + redDotRadius + 5,
      height: iconWidth + redDotRadius + 11,
      child: Stack(
        alignment: Alignment.center,
        children: [
          pic,
          Positioned(
            left: iconWidth - redDotRadius + 5,
            top: 0,
            child: (text == null)
                ? const Text('')
                : Container(
                    alignment: Alignment.center,
                    width: redDotRadius * 2,
                    height: redDotRadius * 2,
                    decoration: bgRadiusCircle(color: Colors.red),
                    child: text,
                  ),
          )
        ],
      ),
    );
  }
*/
  /// 图标小红点Widget
  static iconRedDotWidgetText(
      {double iconWidth = 0,
      double iconHeight = 0,
      double redDotRadius = 0,
      Widget? widget,
      Widget? text,
      Function? redCallback,
      bool isHideRedDot = false}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        (widget != null) ? widget : const SizedBox(),
        Positioned(
          top: 5.w,
          right: 0,
          child: (text == null)
              ? const Text('')
              : InkWell(
                  onTap: () {
                    if (redCallback != null) {
                      redCallback();
                    }
                  },
                  child: isHideRedDot
                      ? SizedBox()
                      : WidgetImage.asset(UICommonImages.commonRedDotDelete),
                ),
        )
      ],
    );
  }

  /// 左左右布局 Widget
  static layoutRowLeftLeftRight(
      {double height = 0,
      Widget? leftFirst,
      Widget? leftSecond,
      Widget? right,
      double leftSpace = 0}) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              (leftFirst == null) ? const SizedBox() : leftFirst,
              SizedBox(
                width: leftSpace,
              ),
              (leftSecond == null) ? const SizedBox() : leftSecond,
            ],
          ),
          (right == null) ? const SizedBox() : right,
        ],
      ),
    );
  }

  /// 左右布局Text Widget
  static layoutRowLeftRightText({
    String leftText = "",
    Color leftColor = Colors.white,
    String rightText = "",
    Color rightColor = Colors.white,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WidgetText.getTextNormal(
          text: leftText,
          color: leftColor,
          fontSize: 14.sp,
        ),
        WidgetText.getTextNormal(
          text: rightText,
          color: rightColor,
          fontSize: 14.sp,
        ),
      ],
    );
  }

  /// 左右布局Text Widget
  static layoutRowLeftLeftText(
      {String leftText = "",
      Color leftColor = Colors.white,
      String rightText = "",
      Color rightColor = Colors.white,
      double leftWidth = 0,
      double spacingWidth = 0}) {
    Widget left = WidgetText.getTextNormal(
      text: leftText,
      color: leftColor,
      fontSize: 14.sp,
    );
    if (leftWidth > 0) {
      left = SizedBox(
        width: leftWidth,
        child: WidgetText.getTextNormal(
          text: leftText,
          color: leftColor,
          fontSize: 14.sp,
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        left,
        SizedBox(
          width: spacingWidth == 0 ? 31.w : spacingWidth.w,
        ),
        Expanded(
          child: WidgetText.getTextNormal(
            maxLines: 99,
            text: rightText,
            color: rightColor,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  /// 左右布局Text Widget(左边固定长度)
  static layoutRowLeftLeftTextLeftSize(
      {String leftText = "",
      Color leftColor = Colors.white,
      String rightText = "",
      Color rightColor = Colors.white,
      double leftWidth = 0,
      double spacingWidth = 20}) {
    Widget left = WidgetText.getTextNormal(
      text: leftText,
      color: leftColor,
      fontSize: 14.sp,
    );
    if (leftWidth > 0) {
      left = SizedBox(
        width: leftWidth,
        child: WidgetText.getTextNormal(
          text: leftText,
          color: leftColor,
          fontSize: 14.sp,
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 60.w,
          child: left,
        ),
        SizedBox(
          width: spacingWidth.w,
        ),
        Expanded(
          child: WidgetText.getTextNormal(
            text: rightText,
            color: rightColor,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  /// 左右布局Widget Widget
  static layoutRowLeftRightWidget({
    Widget? left,
    Widget? right,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        left ?? const SizedBox(),
        right ?? const SizedBox(),
      ],
    );
  }

  /// 四个方块，四个名称，上下布局(我的患者统计) Widget
  static layoutFourStat({
    double width = 0,
    double height = 0,
    int stat1 = 0,
    String name1 = "",
    int stat2 = 0,
    String name2 = "",
    int stat3 = 0,
    String name3 = "",
    int stat4 = 0,
    String name4 = "",
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          _layoutFourStatContent(
              stat: stat1,
              statColor: UICommonColors.color_1AB370,
              bgColor: UICommonColors.color_051AB270,
              name: name1),
          const Expanded(child: SizedBox()),
          _layoutFourStatContent(
              stat: stat2,
              statColor: UICommonColors.colorFF8200,
              bgColor: UICommonColors.color_0CFF8200,
              name: name2),
          const Expanded(child: SizedBox()),
          _layoutFourStatContent(
              stat: stat4,
              statColor: UICommonColors.color_1890FF,
              bgColor: UICommonColors.color_0C1890FF,
              name: name4),
        ],
      ),
    );
  }

  static _layoutFourStatContent(
      {int stat = 0,
      Color bgColor = Colors.transparent,
      Color statColor = Colors.transparent,
      String name = ""}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          width: 60.w,
          height: 60.w,
          color: bgColor,
          child: Text(
            '$stat',
            style: TextStyle(
                color: statColor, fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          name,
          style: TextStyle(color: UICommonColors.color_666666, fontSize: 14.sp),
        ),
      ],
    );
  }

  /// 用药建议相关
  static layoutRowLeftLeftRightRight(
      {double width = 0,
      double height = 0,
      Widget? left1,
      Widget? left2,
      Widget? right1,
      Widget? right2,
      isRightExpand = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            (left1 == null) ? const SizedBox() : left1,
            (left2 == null) ? const SizedBox() : left2,
          ],
        ),
        Expanded(child: SizedBox()),
        isRightExpand
            ? Expanded(
                child: Row(
                  children: [
                    (right1 == null) ? const SizedBox() : right1,
                    (right2 == null) ? const SizedBox() : right2,
                  ],
                ),
              )
            : Row(
                children: [
                  (right1 == null) ? const SizedBox() : right1,
                  (right2 == null) ? const SizedBox() : right2,
                ],
              ),
      ],
    );
  }

  /// 三个左对齐，最后一个Expand
  static layoutRowThreeLeftAndExpand(
      {double width = 0,
      double height = 0,
      Widget? left1,
      Widget? left2,
      Widget? left3,
      Widget? right1}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (left1 == null) ? const SizedBox() : left1,
        (left2 == null) ? const SizedBox() : left2,
        Expanded(child: (left3 == null) ? const SizedBox() : left3),
        (right1 == null) ? const SizedBox() : right1,
      ],
    );
  }

  /// 搜索widget
  static genSearchWidget(
      {String hintText = "", Function? onChange, Function? onDelete}) {
    TextField textField = TextField(
      maxLines: 1,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              TextStyle(color: UICommonColors.color_999999, fontSize: 14.w),
          border: InputBorder.none),
      style: TextStyle(
        color: UICommonColors.color_333333,
        fontSize: 14.sp,
      ),
    );

    Widget deleteIcon = Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: WidgetImage.asset(UICommonImages.commonEditDelete),
    );

    return Container(
      padding: EdgeInsets.only(left: 12.w, right: 12.w),
      color: Colors.white,
      width: double.infinity,
      height: 60.w,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            height: 36.w,
            decoration: WidgetSmall.bgRadius(
                color: UICommonColors.colorF5F5F5, radius: 22),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 14.w, right: 12.w),
                  child: WidgetImage.asset(UICommonImages.commonSearchIcon),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.centerLeft,
                  child: textField,
                )),
                deleteIcon,
              ],
            ),
          )),
          SizedBox(
            width: 12.w,
          ),
          WidgetText.getTextNormal(
            text: '搜索',
            color: UICommonColors.color_1AB370,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  /// 分割线
  static genDivider() {
    return const Divider(
      color: UICommonColors.colorE5E5E5,
      height: 1,
    );
  }

  /// 分割线-中间是点
  static genDividerDot() {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          color: UICommonColors.colorE5E5E5,
          height: 1,
        )),
        SizedBox(
          width: 12.5.w,
        ),
        ClipOval(
          child: Container(
            width: 4.w,
            height: 4.w,
            color: UICommonColors.colorEEEEEE,
          ),
        ),
        SizedBox(
          width: 12.5.w,
        ),
        const Expanded(
            child: Divider(
          color: UICommonColors.colorE5E5E5,
          height: 1,
        )),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../color/ui_common_color.dart';
import '../const.dart';
import '../image/common_images.dart';
import '../images/widget_image.dart';
import '../style/common_style.dart';
import '../text/widget_text.dart';

typedef BoolCallback = void Function(bool?);
typedef DoubleCallback = void Function(double);

class CommonListItem {
  static double defaultPadding = 14;

  static Widget simpleListItem({
    String text = '',
    String hint = '',
    bool showRedDot = true,
  }) {
    return Container(
      // height: 48,
      padding: EdgeInsets.fromLTRB(12, defaultPadding, 16, defaultPadding),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
              visible: showRedDot,
              child:
                  WidgetImage.asset(UICommonImages.pageCertifyRequireWarning)),
          Container(
            width: 60,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: UiCommonColors.black_333333,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              hint,
              style:
                  TextStyle(fontSize: 14, color: UiCommonColors.black_333333),
            ),
          )
        ],
      ),
    );
  }

  static Widget simpleListItem2({
    String text = '',
    String hint = '',
  }) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: UiCommonColors.black_333333,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              hint,
              style:
                  TextStyle(fontSize: 14, color: UiCommonColors.black_333333),
            ),
          ),
          WidgetImage.asset(UICommonImages.commonToRight),
        ],
      ),
    );
  }

  static Widget listItemValidateCode({
    required TextEditingController controller,
    required CountdownController countdownController,
    required int countSecond,
    required VoidCallback validateCallBack,
    required VoidCallback onFinish,
    required DoubleCallback buildCallBack,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        listItemOnlyTextFiled(
          hint: '??????????????????',
          keyboardType: TextInputType.number,
          maxLength: 6,
          controller: controller,
        ),
        Positioned(
          right: 0,
          child: countDownWidget(
            countdownController: countdownController,
            validateCallBack: validateCallBack,
            buildCallBack: buildCallBack,
            onFinish: onFinish,
          ),
        ),
      ],
    );
  }

  static Widget countDownWidget({
    required VoidCallback validateCallBack,
    required CountdownController countdownController,
    required VoidCallback onFinish,
    required DoubleCallback buildCallBack,
  }) {
    return GestureDetector(
      onTap: validateCallBack,
      child: Countdown(
        controller: countdownController,
        seconds: 60,
        interval: Duration(seconds: 1),
        onFinished: onFinish,
        build: (_, double time) {
          buildCallBack(time);
          int down = time.toInt();
          return WidgetText.getTextNormal(
            text: ' ${down == 0 || down == 60 ? '???????????????' : '?????????(${down})'}',
            color: down == 0 || down == 60
                ? UiCommonColors.orange_ff8200
                : UiCommonColors.orange_ff8200.withOpacity(0.5),
            fontSize: 14.sp,
          );
        },
      ),
    );
  }

  static Widget listItemOnlyTextFiled(
      {String text = '',
      String hint = '',
      int maxLine = 1,
      required TextEditingController controller,
      int maxLength = 200,
      TextInputType keyboardType = TextInputType.text}) {
    return Container(
      // height: 48,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              style:
                  TextStyle(fontSize: 18, color: UiCommonColors.black_333333),
              controller: controller,
              keyboardAppearance: Brightness.light,
              cursorColor: UiCommonColors.appMain,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                    color: UiCommonColors.color_999999, fontSize: 14.sp),
                focusColor: UiCommonColors.appMain,
                hoverColor: UiCommonColors.appMain,
                border: UnderlineInputBorder(
                  //????????????????????????
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: UnderlineInputBorder(
                  //????????????????????????
                  borderSide: BorderSide(color: UiCommonColors.grey_f5f5f5),
                ),
                focusedBorder: UnderlineInputBorder(
                  //????????????????????????
                  borderSide: BorderSide(color: UiCommonColors.appMain),
                ),
              ),
              textAlign: TextAlign.start,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(maxLength) //????????????
              ],
              maxLines: maxLine > 1 ? null : 1,
              keyboardType:
                  maxLine > 1 ? TextInputType.multiline : keyboardType,
            ),
          )
        ],
      ),
    );
  }

  static Widget listItem(
      {String text = '',
      String hint = '',
      int maxLine = 1,
      required TextEditingController controller,
      int maxLength = 200,
      TextInputType keyboardType = TextInputType.text}) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 0),
      child: Container(
        // height: 48,
        padding: EdgeInsets.fromLTRB(12, defaultPadding, 16, defaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            WidgetImage.asset(UICommonImages.pageCertifyRequireWarning),
            Container(
              width: 60,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: UiCommonColors.black_333333,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextField(
                style:
                    TextStyle(fontSize: 14, color: UiCommonColors.black_333333),
                controller: controller,
                keyboardAppearance: Brightness.light,
                scrollPadding: EdgeInsets.zero,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isCollapsed: true,
                    hintText: hint,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: UiCommonColors.grey_999999,
                    ),
                    border: InputBorder.none),
                textAlign: TextAlign.start,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(maxLength) //????????????
                ],
                maxLines: maxLine > 1 ? null : 1,
                keyboardType:
                    maxLine > 1 ? TextInputType.multiline : keyboardType,
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget listItemWithImage({
    String text = '',
    String hint = '',
    String? avatar,
    VoidCallback? onTap,
  }) {
    return Container(
      height: 80,
      padding: EdgeInsets.fromLTRB(12, 8, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          WidgetImage.asset(UICommonImages.pageCertifyRequireWarning),
          Container(
            width: 60,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: UiCommonColors.black_333333,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: Row(children: [
                avatar != null && avatar.length > 0
                    ? Image.network(avatar)
                    : WidgetImage.asset(UICommonImages.commonDefaultAvatar),
                Expanded(child: SizedBox()),
                SizedBox(width: 4),
                WidgetImage.asset(UICommonImages.commonToRight),
                SizedBox(width: 8)
              ]),
            ),
          ),
        ],
      ),
    );
  }

  static Widget listItemWithSelect({
    bool showRedDot = true,
    Alignment textAlignment = Alignment.centerLeft,
    String text = '',
    String hint = '',
    double rightPadding = 16,
  }) {
    return Container(
      // height: 48,
      padding:
          EdgeInsets.fromLTRB(12, defaultPadding, rightPadding, defaultPadding),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
              visible: showRedDot,
              child: WidgetImage.asset(
                UICommonImages.pageCertifyRequireWarning,
                package: packageName,
              )),
          Visibility(
              visible: !showRedDot,
              child: SizedBox(
                width: 12,
              )),
          Container(
            width: 60,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: UiCommonColors.black_333333,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              alignment: textAlignment,
              child: Text(
                hint,
                style: TextStyle(
                  fontSize: 14,
                  color: hint.contains('?????????') ||
                          hint.contains('?????????') ||
                          hint.contains('??????')
                      ? UiCommonColors.grey_999999
                      : UiCommonColors.black_333333,
                ),
              ),
            ),
          ),
          SizedBox(width: 4),
          WidgetImage.asset(UICommonImages.commonToRight),
          SizedBox(width: 8)
        ],
      ),
    );
  }

  static Widget listItemWithTitleAndSub(
      {String text = '',
      String hint = '',
      Color hintColor = UiCommonColors.black_333333,
      VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        padding: EdgeInsets.fromLTRB(16, defaultPadding, 12, defaultPadding),
        decoration: CommonDecoration.commonDecoration(),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 60.w,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: UiCommonColors.black_333333,
                ),
              ),
            ),
            SizedBox(
              width: 24.w,
            ),
            Expanded(
              child: Text(
                hint,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: hintColor,
                ),
              ),
            ),
            SizedBox(width: 4.w),
            WidgetImage.asset(UICommonImages.commonToRight),
            SizedBox(width: 8.w)
          ],
        ),
      ),
    );
  }

  static Widget listItemWithRadio(int groupValue) {
    return Container(
      height: 48,
      padding: EdgeInsets.fromLTRB(12, defaultPadding, 16, defaultPadding),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          WidgetImage.asset(UICommonImages.pageCertifyRequireWarning),
          Container(
            width: 60,
            child: Text(
              '??????',
              style: TextStyle(
                fontSize: 14,
                color: UiCommonColors.black_333333,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
                child: Row(
              children: [
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: UiCommonColors.grey_eeeeee,
                  ),
                  child: Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    activeColor: UiCommonColors.appMain,
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(width: 2),
                Text('???'),
                SizedBox(width: 45),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: UiCommonColors.grey_eeeeee,
                  ),
                  child: Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    activeColor: UiCommonColors.appMain,
                    value: 2,
                    groupValue: groupValue,
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(width: 2),
                Text('???')
              ],
            )),
          )
        ],
      ),
    );
  }

  static Widget listItemWithCheckBox(
      {required bool first,
      required bool second,
      required BoolCallback firstCallBack,
      required BoolCallback secondCallBack}) {
    return Container(
      height: 48,
      padding: EdgeInsets.fromLTRB(12, 4, 16, 4),
      decoration: CommonDecoration.commonDecoration(),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          WidgetImage.asset(UICommonImages.pageCertifyRequireWarning),
          Container(
            width: 60,
            child: Text(
              '????????????',
              style: TextStyle(
                fontSize: 14,
                color: UiCommonColors.black_333333,
              ),
            ),
          ),
          // SizedBox(
          //   width: 20,
          // ),
          Expanded(
            child: Container(
                child: Row(
              children: [
                Checkbox(
                    value: first,
                    activeColor: UiCommonColors.appMain,
                    onChanged: firstCallBack),
                Text('????????????'),
                Checkbox(
                    value: second,
                    activeColor: UiCommonColors.appMain,
                    onChanged: secondCallBack),
                Text('?????????????????????')
              ],
            )),
          )
        ],
      ),
    );
  }

  static Widget listItemWithIcon(
      {required String leftIcon,
      required String title,
      String rightImagePath = UICommonImages.commonToRight}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          WidgetImage.asset(
            leftIcon,
            package: packageName,
          ),
          SizedBox(
            width: 12.w,
          ),
          Text(
            title,
            style:
                TextStyle(fontSize: 16.sp, color: UiCommonColors.black_333333),
          ),
          Expanded(child: SizedBox()),
          WidgetImage.asset(
            rightImagePath,
            package: packageName,
          ),
        ],
      ),
    );
  }

  static Widget listItemWithSubTitleInBottom(
      {required String title,
      String subTitle = '',
      String rightImagePath = UICommonImages.commonToRight}) {
    return Container(
      // padding: EdgeInsets.fromLTRB(16, 12, 12, 12),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 16.sp, color: UiCommonColors.black_333333),
              ),
              SizedBox(height: 4),
              Text(
                subTitle,
                style: TextStyle(
                    fontSize: 12.sp, color: UiCommonColors.grey_999999),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          WidgetImage.asset(
            rightImagePath,
            package: packageName,
          ),
        ],
      ),
    );
  }
}

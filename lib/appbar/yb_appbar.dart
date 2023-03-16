import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yb_flutter_lib_ui/appbar/title_widget.dart';
import 'package:yb_pull_to_refresh/yb_pull_to_refresh.dart';

import '../color/ui_common_color.dart';
import '../const.dart';
import '../image/common_images.dart';
import '../images/widget_image.dart';
import '../style/common_style.dart';
import '../text/widget_text.dart';

typedef YbCallbackInt = void Function(int num);

class YBAppBar {

  static Size screenSize(BuildContext context) => MediaQuery.of(context).size;

  static Size getTitleHeightSize() =>
      Size.fromHeight(ScreenUtil().statusBarHeight + 50.w);

  /// 标准title(左,中布局) widget
  static PreferredSizeWidget getTitleAppBarNormal(
      {String title = '',
        bool isHiddenLeftIcon = false,
        VoidCallback? onBackClickCallback,
        bool isWhiteTheme = false}) {
    return PreferredSize(
        child: TitleWidget(
          title: title,
          isHiddenLeftIcon: isHiddenLeftIcon,
          onBackClickCallback: onBackClickCallback,
          isWhiteTheme: isWhiteTheme,
        ),
        preferredSize: getTitleHeightSize());
  }

  // 标准title(中、右布局) widget
  static PreferredSizeWidget getTitleAppBarNormalRight(
      {String title = '',
        bool isHiddenLeftIcon = true,
        VoidCallback? onBackClickCallback,
        String? rightText,
        VoidCallback? onRightClickCallback,
        bool isWhiteTheme = false}) {
    return PreferredSize(
        child: TitleWidget(
          title: title,
          isHiddenLeftIcon: isHiddenLeftIcon,
          onBackClickCallback: onBackClickCallback,
          onRightClickCallback: onRightClickCallback,
          titleRightTextPath: rightText ?? '',
          isWhiteTheme: isWhiteTheme,
        ),
        preferredSize: getTitleHeightSize());
  }

  // 标准title(左、中、右布局) widget
  static PreferredSizeWidget getTitleAppBarNormalAll(
      {String title = '',
        bool isHiddenLeftIcon = false,
        VoidCallback? onBackClickCallback,
        String? rightText,
        VoidCallback? onRightClickCallback,
        bool isWhiteTheme = false}) {
    return PreferredSize(
        child: TitleWidget(
          title: title,
          isHiddenLeftIcon: isHiddenLeftIcon,
          onBackClickCallback: onBackClickCallback,
          onRightClickCallback: onRightClickCallback,
          titleRightTextPath: rightText ?? '',
          isWhiteTheme: isWhiteTheme,
        ),
        preferredSize: getTitleHeightSize());
  }

  /// 定制首页Title
  static PreferredSizeWidget getTitleAppBarHomeWidget({
    required VoidCallback onRightClickCallback,
    required VoidCallback onRightSecondClickCallback,
    required int redCount,
  }) {
    late Widget messageContent;

    if (redCount == 0) {
      messageContent = WidgetImage.asset('images/home_message_bg.png');
    } else if (redCount < 10) {
      messageContent = Badge(
        padding: EdgeInsets.all(3),
        toAnimate: false,
        position: BadgePosition.topEnd(top: -3, end: -3),
        badgeContent: WidgetText.getTextNormal(
            text: '$redCount', fontSize: 10.sp, color: Colors.white),
        child: WidgetImage.asset('images/home_message_bg.png'),
      );
    } else {
      String realCount = redCount > 99 ? '99' : '$redCount';
      messageContent = Badge(
        padding: EdgeInsets.all(3),
        toAnimate: false,
        position: BadgePosition.topEnd(top: -6, end: -6),
        badgeContent: WidgetText.getTextNormal(
            text: realCount, fontSize: 10.sp, color: Colors.white),
        child: WidgetImage.asset('images/home_message_bg.png'),
      );
    }

    return PreferredSize(
      child: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().statusBarHeight + 48.w,
        padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: 48.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      onRightSecondClickCallback();
                    },
                    child: messageContent,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  InkWell(
                    onTap: () {
                      onRightClickCallback();
                    },
                    child: WidgetImage.asset(UICommonImages.pageHomeCareerGuide),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                ],
              ),
            ),
            WidgetImage.asset(UICommonImages.pageHomeTitleIcon)
          ],
        ),
      ),
      preferredSize: getTitleHeightSize(),
    );
  }

  /// 下拉刷新-二楼
  static getSmartRefreshHeader() {
    return TwoLevelHeader(
      decoration: BoxDecoration(color: Colors.transparent),
      textStyle: TextStyle(color: Colors.transparent),
      completeIcon: Icon(
        Icons.more_horiz,
        color: UICommonColors.color_33333333,
      ),
      refreshingIcon: Icon(
        Icons.more_horiz,
        color: UICommonColors.color_33333333,
      ),
      releaseIcon: Icon(
        Icons.more_horiz,
        color: UICommonColors.color_33333333,
      ),
      idleIcon: null,
      releaseText: '',
      refreshingText: '',
      completeText: '',
    );
  }

  /// 下拉刷新-二楼
  static getSmartRefreshFooter() {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Text("");
        } else if (mode == LoadStatus.loading) {
          body = CupertinoActivityIndicator();
        } else if (mode == LoadStatus.failed) {
          body = Text("");
        } else if (mode == LoadStatus.canLoading) {
          body = Text("");
        } else {
          body = Text("");
        }
        return Container(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }

  static titleAppbar({
    required String title,
    String? rightTitle,
    VoidCallback? rightCallback,
    required BuildContext context,
  }) {
    return AppBar(
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: WidgetImage.asset(
            UICommonImages.commonTitleBackIcon,
            package: packageName,
          )),
      actions: [
        TextButton(
            onPressed: rightCallback,
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith((states) {
              return Colors.transparent;
            })),
            child: Text(
              rightTitle ?? '',
              style: CommonTextStyle.commonStyle(color: Colors.white),
            ))
      ],
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      centerTitle: true,
      backgroundColor: UICommonColors.appMain,
      shadowColor: Colors.transparent,
    );
  }

  static titleAppbarWithRightImage(
      {required String title,
      required BuildContext context,
      String rightImagePath = UICommonImages.bankCardAdd,
      VoidCallback? rightCallback}) {
    return AppBar(
      actions: [
        GestureDetector(
            onTap: rightCallback,
            child: WidgetImage.asset(
              rightImagePath,
              package: packageName,
            ))
      ],
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      centerTitle: true,
      backgroundColor: UICommonColors.appMain,
      shadowColor: Colors.transparent,
    );
  }

  static titleAppbarWithRightImageAndPop(
      {required String title,
      required BuildContext context,
      String rightImagePath = UICommonImages.bankCardAdd,
      YbCallbackInt? rightListCallBack,
      VoidCallback? rightCallback}) {
    return AppBar(
      actions: [
        PopupMenuButton(
            offset: Offset(0, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            icon: WidgetImage.asset(
              rightImagePath,
              package: packageName,
            ),
            itemBuilder: (context) {
              List<PopupMenuEntry<int>> list = [];
              list.add(
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    "邀请患者",
                    style: CommonTextStyle.commonStyle(
                        color: UICommonColors.black_333333, fontSize: 14),
                  ),
                ),
              );
              list.add(
                PopupMenuDivider(
                  height: 2,
                ),
              );
              list.add(
                PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    "新建分组",
                    style: CommonTextStyle.commonStyle(
                        color: UICommonColors.black_333333, fontSize: 14),
                  ),
                ),
              );
              return list;
            },
            onSelected: rightListCallBack),
      ],
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      centerTitle: true,
      backgroundColor: UICommonColors.appMain,
      shadowColor: Colors.transparent,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yb_flutter_lib_ui/appbar/title_widget.dart';

import '../color/ui_common_color.dart';
import '../const.dart';
import '../image/common_images.dart';
import '../style/common_style.dart';

typedef YbCallbackInt = void Function(int num);

class YBAppBar {
  static Size getTitleHeightSize() =>
      Size.fromHeight(ScreenUtil().statusBarHeight + 50.w);

  /// 标准title(左,中布局) widget
  static PreferredSizeWidget getTitleAppBarNormal(
      {String title = '',
      bool isHiddenLeftIcon = false,
      OnBackClickCallback? onBackClickCallback,
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
          child: Image.asset(
            CommonImages.commonTitleBackIcon,
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
      backgroundColor: UiCommonColors.appMain,
      shadowColor: Colors.transparent,
    );
  }

  static titleAppbarWithRightImage(
      {required String title,
      required BuildContext context,
      String rightImagePath = CommonImages.bankCardAdd,
      VoidCallback? rightCallback}) {
    return AppBar(
      actions: [
        GestureDetector(
            onTap: rightCallback,
            child: Image.asset(
              rightImagePath,
              package: packageName,
            ))
      ],
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      centerTitle: true,
      backgroundColor: UiCommonColors.appMain,
      shadowColor: Colors.transparent,
    );
  }

  static titleAppbarWithRightImageAndPop(
      {required String title,
      required BuildContext context,
      String rightImagePath = CommonImages.bankCardAdd,
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
            icon: Image.asset(
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
                        color: UiCommonColors.black_333333, fontSize: 14),
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
                        color: UiCommonColors.black_333333, fontSize: 14),
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
      backgroundColor: UiCommonColors.appMain,
      shadowColor: Colors.transparent,
    );
  }
}

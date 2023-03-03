import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../images/widget_image.dart';

typedef BannerCallbackInt = void Function(int num);

class WidgetFlowBanner extends StatefulWidget {
  const WidgetFlowBanner(
      {Key? key,
      required this.callbackSelectedTab,
      required this.images,
      required this.height})
      : super(key: key);

  final List<String> images;
  final BannerCallbackInt? callbackSelectedTab;
  final double height;

  @override
  _WidgetFlowBannerState createState() => _WidgetFlowBannerState();
}

class _WidgetFlowBannerState extends State<WidgetFlowBanner> {
  late int pageIndex = 0;

  static const timeout = const Duration(seconds: 3);
  Timer? _timer;
  bool isTicker = true;
  bool isFastLoad = true;
  late LiquidController liquidController;

  @override
  void initState() {
    super.initState();
    liquidController = LiquidController();
    if (widget.images.length > 1) {
      _startTimer();
    }
  }

  _startTimer() {
    _timer?.cancel();
    Timer.periodic(timeout, (timer) {
      _timer = timer;
      if (!isTicker) {
        return;
      }
      try {
        if ((pageIndex + 1) == _genPages().length) {
          www?.liquidController?.jumpToPage(page: 0);
        } else {
          www?.liquidController?.jumpToPage(page: pageIndex + 1);
        }
      } catch (ex) {
        print('-----------------  ${ex.toString()} ');
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPics();
  }

  LiquidSwipe? www;

  _buildPics() {
    www = LiquidSwipe.builder(
      itemBuilder: (c, index) {
        return _genPages()[index];
      },
      itemCount: widget.images.length,
      enableLoop: true,
      disableUserGesture: false,
      initialPage: pageIndex,
      liquidController: liquidController,
      waveType: WaveType.circularReveal,
      ignoreUserGestureWhileAnimating: true,
      onPageChangeCallback: _pageChangeCallback,
      currentUpdateTypeCallback: (updateType) {
        if (updateType == UpdateType.dragging) {
          if (isFastLoad) {
            isFastLoad = false;
            isTicker = true;
            return;
          }
          isTicker = false;
        } else if (updateType == UpdateType.doneDragging) {
          Future.delayed(Duration(seconds: 3)).then((e) {
            isTicker = true;
          });
        }
      },
    );
    return Container(
      width: double.infinity,
      height: widget.height,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            child: Container(
              width: double.infinity,
              height: widget.height,
              child: www,
            ),
          ),
          Positioned(
            bottom: 14.h,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List<Widget>.generate(_genPages().length, _buildDot),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// gen pages
  List<Widget> _genPages() {
    List<Widget> list = [];
    if (widget.images.length == 0) {
      return list;
    }
    List<String> picList = widget.images;

    for (var i = 0; i < picList.length; i++) {
      list.add(GestureDetector(
        onTap: () {
          widget.callbackSelectedTab!(i);
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          child: WidgetImage.getImageRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              url: picList[i],
              width: double.infinity,
              height: double.infinity),
        ),
      ));
    }
    return list;
  }

  /// 指示器(圆形)
  Widget _buildDot(int index) {
    if (widget.images.length == 1) {
      return SizedBox();
    }
    return Material(
      color: (index == pageIndex) ? Color(0xCC111111) : Color(0x33111111),
      type: MaterialType.circle,
      child: Container(
        margin: EdgeInsets.only(left: 3.w, right: 3.w),
        width: 8.w,
        height: 8.w,
      ),
    );
  }

  _pageChangeCallback(int lpage) {
    setState(() {
      pageIndex = lpage;
    });
  }
}

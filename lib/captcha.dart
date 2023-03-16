import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/ui_common_color.dart';
import 'image/common_images.dart';
import 'images/widget_image.dart';

///图片验证码
class Captcha extends StatefulWidget {
  final String imageUrl;
  final TextEditingController imgCodeController;

  Captcha(this.imageUrl, this.imgCodeController);

  @override
  State<StatefulWidget> createState() {
    return _CaptchaState();
  }
}

class _CaptchaState extends State<Captcha> {
  late int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            height: 44,
            child: TextField(
              style: TextStyle(
                  color: UICommonColors.color_333333, fontSize: 18.sp),
              cursorColor: Colors.grey,
              keyboardType: TextInputType.number,
              keyboardAppearance: Brightness.light,
              onChanged: (text) {
                // _phoneController.text = text;
              },
              controller: widget.imgCodeController,
              decoration: InputDecoration(
                  hintText: "请输入图形验证码",
                  hintStyle: TextStyle(
                      color: UICommonColors.color_999999, fontSize: 14.sp),
                  focusColor: Colors.grey,
                  hoverColor: Colors.grey,
                  border: UnderlineInputBorder(
                    //选中时下边框颜色
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    //选中时下边框颜色
                    borderSide: BorderSide(color: UICommonColors.grey_f5f5f5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    //选中时下边框颜色
                    borderSide: BorderSide(color: UICommonColors.appMain),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      widget.imgCodeController.text = "";
                    },
                    icon: WidgetImage.asset(UICommonImages.pageLoginClear),
                  )),
            ),
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            index++;
            setState(() {});
          },
          child: Container(
              alignment: Alignment.bottomCenter,
              width: 100,
              child: CachedNetworkImage(
                cacheKey: 'Cache${currentTimeMillis()} + ${index.toString()}',
                imageUrl: widget.imageUrl,
              )),
        )
      ],
    );
  }
}

int currentTimeMillis() {
  return DateTime.now().millisecondsSinceEpoch;
}

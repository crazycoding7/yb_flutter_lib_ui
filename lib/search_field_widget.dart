import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yb_flutter_lib_ui/text/widget_text.dart';
import 'package:yb_flutter_lib_ui/widget_small.dart';

import 'color/common_color.dart';
import 'compose_text_edit_controller.dart';
import 'image/common_images.dart';

/// 搜索框
class SearchFieldWidget extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final bool isShowSearchWidget;
  final bool closeOnChange; //关闭实时搜索
  final bool isWithe;

  const SearchFieldWidget(
      {Key? key,
      this.hintText = '',
      required this.onChanged,
      bool this.closeOnChange = false,
      bool this.isShowSearchWidget = true,
      this.isWithe = false})
      : super(key: key);

  @override
  _SearchFieldWidgetState createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  late ComposeTextEditController _controller;

  String? _oldText;

  @override
  void initState() {
    super.initState();
    _genTextEditController('');
  }

  _genTextEditController(String? value) {
    _controller = ComposeTextEditController();
    if (widget.closeOnChange) {
      return _controller;
    }
    _controller.value = TextEditingValue(
        text: '$value',
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream, offset: '$value'.length)));
    _controller.addListener(() {
      if (_oldText != _controller.completeText) {
        if (_controller.text.isNotEmpty) {
          _oldText = _controller.completeText;
          widget.onChanged!(_controller.completeText);
        } else {
          widget.onChanged!('');
        }
      }
    });

    return _controller;
  }

  @override
  Widget build(BuildContext context) {
    TextField textField = TextField(
      controller: _controller,
      maxLines: 1,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: EdgeInsets.only(bottom: 11),
          hintStyle:
              TextStyle(color: CommonColors.color_999999, fontSize: 14.w),
          border: InputBorder.none),
      style: TextStyle(
        color: CommonColors.color_333333,
        fontSize: 14.sp,
      ),
    );

    Widget deleteIcon = InkWell(
      child: Padding(
        padding: EdgeInsets.only(right: 8.w),
        child: Image.asset(
          CommonImages.commonEditDelete,
          package: packageName,
        ),
      ),
      onTap: () {
        _controller.clear();
        setState(() {
          widget.onChanged!('');
        });
      },
    );

    return Container(
      padding: EdgeInsets.only(left: 12.w, right: 12.w),
      color: widget.isWithe ? Colors.transparent : Colors.white,
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
                color: widget.isWithe ? Colors.white : CommonColors.colorF5F5F5,
                radius: 22),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 14.w, right: 12.w),
                  child: Image.asset(
                    CommonImages.commonSearchIcon,
                    package: packageName,
                  ),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.centerLeft,
                  child: textField,
                )),
                (_controller.text.isEmpty) ? const SizedBox() : deleteIcon,
              ],
            ),
          )),
          !widget.isShowSearchWidget
              ? SizedBox()
              : SizedBox(
                  width: 12.w,
                ), //widget.onChanged!(value);
          !widget.isShowSearchWidget
              ? SizedBox()
              : InkWell(
                  onTap: () {
                    if (_controller.text.isNotEmpty) {
                      widget.onChanged!(_controller.text);
                    }
                  },
                  child: WidgetText.getTextNormal(
                    text: '搜索',
                    color: CommonColors.color_1AB370,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    );
  }
}

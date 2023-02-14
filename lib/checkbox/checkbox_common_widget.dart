import 'package:flutter/material.dart';

import '../image/common_images.dart';

typedef OnClickCallback = void Function(bool isSelected);

/// 单个复选框
class CheckBoxCommonWidget extends StatefulWidget {
  final bool defaultSelected;
  final Function onClickCallback;

  const CheckBoxCommonWidget({
    Key? key,
    required this.onClickCallback,
    this.defaultSelected = false,
  }) : super(key: key);

  @override
  _CheckBoxCommonWidget createState() => _CheckBoxCommonWidget();
}

class _CheckBoxCommonWidget extends State<CheckBoxCommonWidget> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.defaultSelected;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          widget.onClickCallback(_isSelected);
        });
      },
      child: _isSelected
          ? Image.asset(CommonImages.commonCheckboxSelectedIcon,
              package: 'lib_ui')
          : Image.asset(CommonImages.commonCheckboxNullIcon, package: 'lib_ui'),
    );
  }
}

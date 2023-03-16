import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'color/ui_common_color.dart';


class KeyboardConfig {
  static FocusNode focusNode = FocusNode();

  ///键盘设置，添加完成按钮
  static KeyboardActionsConfig buildDoneForIOSConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      nextFocus: false,
      actions: [
        KeyboardActionsItem(focusNode: focusNode, toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "完成",
                  style: TextStyle(color: UICommonColors.appMain),
                ),
              ),
            );
          }
        ]),
      ],
    );
  }
}

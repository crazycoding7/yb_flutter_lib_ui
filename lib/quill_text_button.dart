import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yb_flutter_lib_ui/toast/toast_util.dart';
import 'package:yb_flutter_quill/yb_flutter_quill.dart';

class QuillTextButton extends StatelessWidget {
  const QuillTextButton({
    required this.child,
    required this.controller,
    this.iconSize = kDefaultIconSize,
    this.onImagePickCallback,
    this.fillColor,
    this.filePickImpl,
    this.webImagePickImpl,
    this.mediaPickSettingSelector,
    this.iconTheme,
    this.dialogTheme,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final double iconSize;

  final Color? fillColor;

  final QuillController controller;

  final OnImagePickCallback? onImagePickCallback;

  final WebImagePickImpl? webImagePickImpl;

  final FilePickImpl? filePickImpl;

  final MediaPickSettingSelector? mediaPickSettingSelector;

  final QuillIconTheme? iconTheme;

  final QuillDialogTheme? dialogTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: child,
      onTap: () {
        int number = 0;
        for (int i = 0; i < controller.document.toDelta().length; i++) {
          var element = controller.document.toDelta().elementAt(i).value;
          if (element is Map<String, dynamic>) {
            number++;
          }
        }
        if (number >= 5) {
          ToastUtil.show('最多选择5张图片');
        } else {
          _onPressedHandler(context);
        }
      },
    );
  }

  Future<void> _onPressedHandler(BuildContext context) async {
    // if (onImagePickCallback != null) {
    //   final selector =
    //       mediaPickSettingSelector ?? ImageVideoUtils.selectMediaPickSetting;
    //   final source = await selector(context);
    //   if (source != null) {
    //     if (source == MediaPickSetting.Gallery) {
    //       _pickImage(context);
    //     } else {
    //       _typeLink(context);
    //     }
    //   }
    // } else {
    //   _typeLink(context);
    // }

    _pickImage(context);
  }

  void _pickImage(BuildContext context) => ImageVideoUtils.handleImageButtonTap(
        context,
        controller,
        ImageSource.gallery,
        onImagePickCallback!,
        filePickImpl: filePickImpl,
        webImagePickImpl: webImagePickImpl,
      );

// void _typeLink(BuildContext context) {
//   showDialog<String>(
//     context: context,
//     builder: (_) => LinkDialog(dialogTheme: dialogTheme),
//   ).then(_linkSubmitted);
// }

// void _linkSubmitted(String? value) {
//   if (value != null && value.isNotEmpty) {
//     final index = controller.selection.baseOffset;
//     final length = controller.selection.extentOffset - index;
//
//     controller.replaceText(index, length, BlockEmbed.image(value), null);
//   }
// }
}

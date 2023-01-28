### 一个灵活的FlutterUI组件库

- 包含常用组件如：按钮、文本、下拉框、装饰背景等。
- 包含跨端插件如：图片选择器、语音视频等。

### Example

```dart
import 'package:yb_flutter_lib_ui/button/widget_button.dart';
import 'package:yb_flutter_lib_ui/text/widget_text.dart';

 // 文本组件
 WidgetText.getTextNormal(
                text: '组件：yb_flutter_lib_ui', color: Colors.red),
 // 按钮组件
 WidgetButton.getBtnNormal(
   						// 文本组件
              child: WidgetText.getTextNormal(text: '按钮'),
   						// 背景色
              bgColor: Colors.green,
   						// 圆角
              radius: 10,
            ),
```


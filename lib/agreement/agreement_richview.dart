import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../checkbox/checkbox_common_widget.dart';
import '../color/ui_common_color.dart';

class AgreementRichView extends StatelessWidget {
  final Function onClickCallback;

  AgreementRichView({
    Key? key,
    required this.onClickCallback,
  }) : super(key: key);

  final UIContractController _controller = UIContractController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CheckBoxCommonWidget(onClickCallback: onClickCallback),
        SizedBox(
          width: 4,
        ),
        RichText(
          text: TextSpan(
              text: "我已阅读并同意",
              style: TextStyle(
                  color: UICommonColors.black_333333, fontSize: 12.sp),
              children: [
                TextSpan(
                    text: "《用户协议》",
                    style: const TextStyle(color: UICommonColors.appMain),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _controller.getData(UIAgreementConfig.doctor_user);
                      }),
                TextSpan(
                    text: "《隐私政策》",
                    style: const TextStyle(color: UICommonColors.appMain),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _controller.getData(UIAgreementConfig.doctor_privacy);
                      }),
              ]),
        ),
      ],
    );
  }
}

class UIAgreementConfig {
  static int doctor_user = 400001; //用户协议
  static int doctor_privacy = 400002; //隐私协议
  static int doctor_financial_account = 400003; //金融账户信息获取授权书
  static int doctor_close_account = 400004; //易赋诊注销账户须知
  static int doctor_task_rule = 400005; //任务规则
}

class UIContractController extends GetxController {
  var title = ''.obs;
  var content = ''.obs;

  void getData(int type) {
    SmartDialog.showLoading();

    /*apiClient.contract(type).then((data) {
      SmartDialog.dismiss(status: SmartStatus.loading);
      if (ErrorCode.isGlobalError(data.code)) {
        return;
      }
      if (data.code != 0) {
        SmartDialog.showToast('${data.msg}');
        return;
      }

      // Get.to(() => PageContract(
      //       title: data.data?.title ?? '',
      //       content: data.data?.content ?? '',
      //     ));

    }).catchError((error, object) {
      SmartDialog.dismiss(status: SmartStatus.loading);
      print(object);
      SmartDialog.showToast('${CommonStrings.tipNetError}');
    });*/
  }

  /*
  Future<int> getAgreementDate(int type) async {
    return await apiClient.contract(type).then((data) {
      if (ErrorCode.isGlobalError(data.code)) {
        return 0;
      }
      if (data.code != 0) {
        SmartDialog.showToast('${data.msg}');
        return 0;
      }
      return data.data?.updateTime ?? 0;
    }).catchError((error, object) {
      SmartDialog.showToast('${CommonStrings.tipNetError}');
      return 0;
    });
  }
  */
}

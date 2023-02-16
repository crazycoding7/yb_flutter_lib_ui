import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yb_flutter_lib_ui/agreement/agreement_richview.dart';
import 'package:yb_flutter_lib_ui/appbar/yb_appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _homePage();
  }

  Widget _homePage() {
    return Scaffold(
      appBar: YBAppBar.titleAppbar(title: '首页', context: context),
      body: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            // CommonListItem.listItemWithRadio(1),
            // CommonListItem.listItemWithSelect(text: '请选择'),
            AgreementRichView(onClickCallback: (value) {
              if (kDebugMode) {
                print('点击');
              }
            })
          ],
        ),
      ),
    );
  }
}

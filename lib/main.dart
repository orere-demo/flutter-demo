import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:demo1/routes/routes.dart';
import 'package:demo1/routes/application.dart';
import 'package:provider/provider.dart';

import 'package:demo1/model/counter_model.dart';

void main() {
  final textSize = 48;
  final counter = CounterModel();

  // Provider, 暴露数据供子孙组件使用
  runApp(Provider<int>.value(
      value: textSize,
      child: ChangeNotifierProvider.value(
        value: counter,
        child: MyApp(),
      )
      // child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    // router 初始化
    Routes.defineRoutes(router);
    // 静态化，便于引用全局注入
    Application.router = router;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: YColor.primaryColor,
          primarySwatch: Colors.blue,
          backgroundColor: YColor.backgroundColor,
          scaffoldBackgroundColor: Colors.white),
      onGenerateRoute: Application.router.generator,
    );
  }
}

class YColor {
  static const Color primaryColor = Color(0xFF1A7CD7);
  static const Color backgroundColor =
      Color(0xFFB3B3B3); // 与主色形成对比的颜色，例如用作进度条的剩余部分。

  /* 主题切换 */
  static const Map themeColor = {
    0: {
      //green
      "primaryColor": Color(0xff4caf50),
      "primaryColorDark": Color(0xff388E3C),
      "colorAccent": Color(0xff8BC34A),
      "colorPrimaryLight": Color(0xffC8E6C9),
    },
    1: {
      //red
      "primaryColor": Color(0xffF44336),
      "primaryColorDark": Color(0xffD32F2F),
      "colorAccent": Color(0xffFF5252),
      "colorPrimaryLight": Color(0xffFFCDD2),
    },
    2: {
      //blue
      "primaryColor": Color(0xff2196F3),
      "primaryColorDark": Color(0xff1976D2),
      "colorAccent": Color(0xff448AFF),
      "colorPrimaryLight": Color(0xffBBDEFB),
    },
    3: {
      //pink
      "primaryColor": Color(0xffE91E63),
      "primaryColorDark": Color(0xffC2185B),
      "colorAccent": Color(0xffFF4081),
      "colorPrimaryLight": Color(0xffF8BBD0),
    },
    4: {
      //purple
      "primaryColor": Color(0xff673AB7),
      "primaryColorDark": Color(0xff512DA8),
      "colorAccent": Color(0xff7C4DFF),
      "colorPrimaryLight": Color(0xffD1C4E9),
    },
    5: {
      //grey
      "primaryColor": Color(0xff9E9E9E),
      "primaryColorDark": Color(0xff616161),
      "colorAccent": Color(0xff9E9E9E),
      "colorPrimaryLight": Color(0xffF5F5F5),
    },
    6: {
      //black
      "primaryColor": Color(0xff333333),
      "primaryColorDark": Color(0xff000000),
      "colorAccent": Color(0xff666666),
      "colorPrimaryLight": Color(0xff999999),
    },
  };
}

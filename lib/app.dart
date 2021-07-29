/*
 * @Author: your name
 * @Date: 2021-07-21 14:12:29
 * @LastEditTime: 2021-07-29 15:26:38
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \demo1\lib\app.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:demo1/page/welcome_page.dart';
import 'package:demo1/page/photoview_page.dart';
import 'package:demo1/redux/gsy_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:demo1/model/User.dart';

class FlutterReduxApp extends StatefulWidget {
  FlutterReduxApp({Key? key}) : super(key: key);

  @override
  _FlutterReduxAppState createState() => _FlutterReduxAppState();
}

// 多语言 状态处理 请求状态处理 路由管理
class _FlutterReduxAppState extends State<FlutterReduxApp> {
  // 创建Store
  final store = new Store<GSYState>(

      // 引用 GSYState 中的 appReducer 实现 Reducer 方法
      appReducer,

      // 拦截器
      middleware: middleware,

      // 初始化数据：initialState 初始化 State
      initialState: new GSYState(
        userInfo: User.empty(),
        locale: Locale('zh', 'CH'),
        login: false,
      ));

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        // StoreBuilder: 把从StoreProvider获取到的store直接通过build方法返回
        child: new StoreBuilder<GSYState>(builder: (context, store) {
          //       print(WidgetsBinding.instance?.window.locale);
          // print(typedef WidgetsBinding);
          return new MaterialApp(
            // GlobalMaterialLocalizations.delegate 为Material Components库提供了本地化的字符串和其他值。
            // GlobalWidgetsLocalizations.delegate定义widget默认的文本方向，从左到右或从右到左
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('en', 'US'), // English
              const Locale('zh', 'CH'), // Hebrew
            ],
            // locale: 当前区域，如果为null则使用系统区域 一般用于语言切换
            locale: store.state.locale,
            // navigatorObservers: [this],
            routes: {
              WelcomePage.sName: (context) {
                // _context = context;
                // DebugLabel.showDebugLabel(context);
                return WelcomePage();
              },
              // PhotoViewPage.sName: (context) {
              //   return PhotoViewPage();
              // },
            },
          );
        }));
  }
}

// mixin HttpErrorListener on State<FlutterReduxApp> {
// // StreamSubscription
//   StreamSubscription? stream;

//   // @override
//   // void initState() {
//   //   super.initState();

//   //   stream = eventBus.on
//   // }

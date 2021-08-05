import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo1/page/home/home_page.dart';
import 'package:demo1/page/login/login_page.dart';
import 'package:demo1/page/login/login_webview.dart';

class NavigatorUtils{
//  公开打开方式 - iOS风格的路由切换组件
  static navigatorRouter(BuildContext context, Widget widget){
    return Navigator.push(context,
        // route
        CupertinoPageRoute(builder: (context) =>
            pageContainer(widget, context)
        )
    );
  }
  // Page页面的容器，通用自定义
  static Widget pageContainer(widget, BuildContext context){
    return MediaQuery(
      // 使不受系统字体缩放影响
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: widget);
  }
  /// 登录页
  static goLogin(BuildContext context){
    Navigator.pushReplacementNamed(context, LoginPage.sName);
  }

  /// 主页
  static goHome(BuildContext context){
    Navigator.pushReplacementNamed(context, HomePage.sName);
  }

//  登录Web页面
  static Future goLoginWebView(BuildContext context, String url, String title){
    return navigatorRouter(context, new LoginWebView(url, title));
  }

}

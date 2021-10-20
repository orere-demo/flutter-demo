/*
 * @Author: your name
 * @Date: 2021-07-27 19:19:37
 * @LastEditTime: 2021-09-05 14:14:01
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: \demo1\lib\redux\gsy_state.dart
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:demo1/model/User.dart';

class GSYState {
  User? userInfo;
  bool? login;
  Locale? locale; // 语言
  Locale? platformLocale; // 当前手机平台默认语言
  ThemeData? themeData;

  // GSYState({this.userInfo});
  GSYState({this.userInfo, this.login, this.locale, this.themeData});
}

// reducer 接收State和Action，返回新的State
GSYState appReducer(GSYState state, action) {
  return GSYState();
}

// middleware
final List<Middleware<GSYState>> middleware = [];

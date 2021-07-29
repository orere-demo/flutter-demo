import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:demo1/model/User.dart';

class GSYState {
  User? userInfo;
  bool? login;
  Locale? locale;

  // GSYState({this.userInfo});
  GSYState({this.userInfo, this.login, this.locale});
}

// reducer 接收State和Action，返回新的State
GSYState appReducer(GSYState state, action) {
  return GSYState();
}

// middleware
final List<Middleware<GSYState>> middleware = [];

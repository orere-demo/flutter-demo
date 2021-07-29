/*
 * @Author: Demo
 * @Date: 2021-07-27 16:27:57
 * @LastEditTime: 2021-07-29 17:18:16
 * @LastEditors: Please set LastEditors
 * @Description: 欢迎页 - WelcomePage
 * @FilePath: \demo1\lib\page\welcome_page.dart
 */

import 'package:demo1/redux/gsy_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:demo1/widget/diff_scale_text.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);
  static final String sName = '/';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String text = "";
  double fontSize = 76;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    print('welcome_page ------ didChangeDependencies');
    Store<GSYState> store = StoreProvider.of(context);
    new Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        text = 'Welcome';
        fontSize = 60;
      });
    });
    new Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      setState(() {
        text = "GSYGithubApp";
        fontSize = 60;
      });
    });
    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      // 进入首页或登录页
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GSYState>(builder: (context, store) {
      return Material(
        child: new Container(
          // color: ,
          child: Stack(
            children: <Widget>[
              Center(
                child: new Image(
                  image: new AssetImage('static/images/welcome.png'),
                ),
              ),
              Align(
                alignment: Alignment(0.0, 0.3),
                child: DiffScaleText(),
              )
            ],
          ),
        ),
      );
    });
  }
}

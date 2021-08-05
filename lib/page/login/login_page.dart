import 'dart:async';
import 'package:demo1/common/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo1/common/style/gsy_style.dart';
import 'package:demo1/common/config/config.dart';
import 'package:demo1/common/local/local_storage.dart';

import 'package:demo1/widget/gsy_input_widget.dart';

class LoginPage extends StatefulWidget {
  static final String sName = "login";
  // LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> with LoginBLoc {
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
    // TODO: implement build
    // 触摸收起键盘
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        // FocusScope 用来切换焦点隐藏软键盘(传入空的焦点，隐藏软键盘)
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: new Container(
          child: Stack(children: <Widget>[
            // 背景色 背景动画

            Center(
              child: SafeArea(child: SingleChildScrollView(
                child: Card(
                  elevation: 4.0,
                  color: Colors.blue,
                  margin: EdgeInsets.all(30),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Image(image: new AssetImage(GSYIcons.DEFAULT_USER_ICON),
                        width: 90,
                        height: 90,),
                        Padding(padding: EdgeInsets.all(10)),
                        GSYInputWidget(
                          hintText: 'name',
                          iconData: GSYIcons.LOGIN_USER,
                          // onChanged: (String value){
                          //   _username = value
                          // },
                          controller: userController,
                        )
                      ],
                    ),
                  ),
                ),
              )),
            )
          ],),
        ),
      ),
    );
  }
}

// mixin 为类添加功能， 可以用on来指定可以使用Mixin的父类类型
mixin LoginBLoc on State<LoginPage>{
  // controller
  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwController = new TextEditingController();

  String? _username = '';
  String? _password = "";

  @override
  void initState(){
    super.initState();
    initParams();
  }

  @override
  void dispose(){
    super.dispose();
    userController.removeListener(_usernameChange);
    pwController.removeListener(_passwordChange);
  }

  _usernameChange(){
    _username = userController.text;
  }
  _passwordChange(){
    _password = pwController.text;
  }

  initParams() async{
    _username = await LocalStorage.get(Config.USER_NAME_KEY);
    _password = await LocalStorage.get(Config.PW_KEY);
    userController.value = TextEditingValue(text: _username ?? "");
    pwController.value = TextEditingValue(text: _password ?? "");
  }

  // 账号登录
  loginIn() async{
    Fluttertoast.showToast(msg: 'msg');
  }

  oauthLogin() async{
    String? code = await NavigatorUtils.goLoginWebView(context,
      'urlurl',
      'title'
    );
  }
}
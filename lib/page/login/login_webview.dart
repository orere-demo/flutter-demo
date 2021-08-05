import 'dart:io';
import 'package:flutter/material.dart';

class LoginWebView extends StatefulWidget {
  final String url;
  final String title;
  // LoginWebView({Key key}) : super(key: key);
  LoginWebView(this.url, this.title);

  @override
  _LoginWebViewState createState() {
    return _LoginWebViewState();
  }
}

class _LoginWebViewState extends State<LoginWebView> {
  @override
  void initState() {
    super.initState();
    if(Platform.isAndroid){}
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('_LoginWebViewState');
  }
}
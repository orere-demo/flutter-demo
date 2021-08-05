import 'package:flutter/material.dart';

// 带图标的输入框
// 样式：状态：正常 聚焦；
// 值：value，hintText(placeholder); 图标 IconData;
// 事件：valueChanges，TextEditController
class GSYInputWidget extends StatefulWidget {
  // 是否隐藏文本 密码框等
  final bool obscureText;
  final String? hintText;
  final IconData? iconData;
  final TextStyle? textStyle;
  final ValueChanged? onChanged;
  final TextEditingController? controller;

  GSYInputWidget({Key? key,
    this.obscureText = false,
    this.hintText,
    this.iconData,
    this.textStyle,
    this.onChanged,
    this.controller}) : super(key: key);

  @override
  _GSYInputWidgetState createState() {
    return _GSYInputWidgetState();
  }
}

class _GSYInputWidgetState extends State<GSYInputWidget> {
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
    return TextField(
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        icon: widget.iconData == null ? null : Icon(widget.iconData)
      ),
    );
  }
}
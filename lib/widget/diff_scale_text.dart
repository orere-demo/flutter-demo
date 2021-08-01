import 'package:flutter/material.dart';

class DiffScaleText extends StatefulWidget {
  final String? text;
  final TextStyle? textStyle;
  DiffScaleText({Key? key, required this.text, this.textStyle}) : super(key: key);
  // : assert(text != null),

  @override
  _DiffScaleTextState createState() => _DiffScaleTextState();
}

class _DiffScaleTextState extends State<DiffScaleText> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
  }

  @override
  void didUpdateWidget(covariant DiffScaleText oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.text != widget.text){
      print('${oldWidget.text} , ${widget.text}');
      // _animationController
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = widget.textStyle == null?TextStyle(
      fontSize: 20,
      color: Colors.white
    ):widget.textStyle;
    return AnimatedBuilder(animation: animation, builder: (BuildContext context, Widget child){})
  }
}

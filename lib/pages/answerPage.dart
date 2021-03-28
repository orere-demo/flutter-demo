import '../index.dart';

class AnswerPage extends StatefulWidget {
  final String id;
  AnswerPage({Key key, this.id}) : super(key: key);

  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  // int id = widget.id;
  String barTitle;

  @override
  void initState() {
    String str = (widget.id).substring(0, 2);
    switch (str) {
      case '00':
        barTitle = '初级模拟题';
        break;
      case '01':
        barTitle = '中级模拟题';
        break;
      case '02':
        barTitle = '高级模拟题';
        break;
      default:
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$barTitle'),
      ),
    );
  }
}

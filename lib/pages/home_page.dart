import '../index.dart';

class HomeRoute extends StatelessWidget {
  final String txtparams;
  const HomeRoute({Key key, this.txtparams}) : super(key: key);
  // HomeRoute(this.txtparams);
  @override
  // _HomeRouteState createState() => _HomeRouteState();
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      // child: Text('222$txtparams'),
      child: Text('222$txtparams'),
    );
  }
}

class HomeRoute2 extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('模拟题'),
      ),
      body: BuildBody(),
      // drawer: MyDrawer, // 抽屉菜单
    );
  }
}

class BuildBody extends StatefulWidget {
  final List<String> rangeList = ['初级模拟题', '中级模拟题', '高级模拟题'];

  _BuildBody createState() => _BuildBody();
}

class _BuildBody extends State<BuildBody> {
  Future<String> getDatas() async {
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<String>(
      future: getDatas(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // 请求已结束
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            // 请求失败，显示错误
            return Text("Error: ${snapshot.error}");
          } else {
            // 请求成功，显示数据
            return Text("Contents: ${snapshot.data}");
          }
        } else {
          // 请求未结束，显示loading
          return CircularProgressIndicator();
          // return Text('${widget.txtparams}');
        }
      },
    );
  }
}

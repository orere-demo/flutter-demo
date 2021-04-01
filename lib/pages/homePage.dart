import '../index.dart';

class HomePage extends StatefulWidget {
  final String txtparams;

  const HomePage({Key key, this.txtparams}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
  _BuildBody createState() => _BuildBody();
}

class RandomData {
  final String name;
  final String from;

  RandomData(this.name, this.from);

  RandomData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        from = json['from'];

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'name': name, 'from': from};
}

class _BuildBody extends State<BuildBody> {
  RandomData randomData;
  Future<String> getDatas() async {
    var data = {'count': 5, 'page': 1};
    var res = await getPoetryFull(data: data);
    randomData = RandomData.fromJson(res);
    print('====response$res');
    print('====response${randomData.name}');
    // print('====response${response.result}');
    // return response;
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }

  Future future;

  List rangeList = [
    {
      'label': "初级模拟题",
      'id': 00,
      '_isExpanded': false,
      'children': [
        {'label': '试卷一', 'id': '0001', 'status': 1},
        {'label': '试卷二', 'id': '0002', 'status': 1},
        {'label': '试卷三', 'id': '0003', 'status': 0},
      ]
    },
    {
      'label': "中级模拟题",
      'id': 01,
      '_isExpanded': false,
      'children': [
        {'label': '试卷一', 'id': '0101', 'status': 1},
        {'label': '试卷二', 'id': '0102', 'status': 0},
        {'label': '试卷三', 'id': '0103', 'status': 0},
      ]
    },
    {
      'label': "高级模拟题",
      'id': 02,
      '_isExpanded': false,
      'children': [
        {'label': '试卷一', 'id': '0201', 'status': 0},
        {'label': '试卷二', 'id': '0202', 'status': 0},
        {'label': '试卷三', 'id': '0203', 'status': 0},
      ]
    }
  ];

  onPressToAnswer(item) {
    print('item$item');
    Application.router.navigateTo(context, '/answer?id=${item["id"]}');
  }

  @override
  void initState() {
    future = getDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // 请求已结束
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            // 请求失败，显示错误
            return Text("Error: ${snapshot.error}");
          } else {
            // 请求成功，显示数据
            // return Text("Contents: ${snapshot.data}");
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${randomData.name}${randomData.name}',
                        textAlign: TextAlign.start,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text('${randomData.from}',
                                textAlign: TextAlign.end),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                _buildQuestionList()
              ],
            );
          }
        } else {
          // 请求未结束，显示loading
          return Center(
            child: CircularProgressIndicator(),
          );
          // return Text('${widget.txtparams}');
        }
      },
    );
  }

  Widget _buildQuestionList() {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: ExpansionPanelList(
        expandedHeaderPadding: EdgeInsets.all(0),
        dividerColor: Colors.transparent,
        elevation: 0,
        children: rangeList.map<ExpansionPanel>((item) {
          return ExpansionPanel(
              backgroundColor: Color(0xFFF5F7FA),
              // headerBuilder 标题
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text("${item['label']}"),
                );
              },
              // body 内容
              body: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Container(
                      padding: EdgeInsets.only(bottom: 0, top: 10),
                      child: ListBody(
                          children: item['children'].map<Widget>((item2) {
                        return Column(
                          children: [
                            Offstage(
                              offstage: !!(item2['status'] == 0), // 题目已做
                              child: _buildRowFinish(item2, 'status0'),
                            ),
                            Offstage(
                              offstage: item2['status'] == 1, // false显示 题目还没做
                              child: _buildRowFinish(item2, 'status1'),
                            ),
                          ],
                        );
                      }).toList()))),
              isExpanded: item['_isExpanded'],
              canTapOnHeader: true);
        }).toList(),
        expansionCallback: (index, isExpanded) {
          setState(() {
            rangeList[index]['_isExpanded'] = !isExpanded;
          });
        },
        animationDuration: kThemeAnimationDuration,
      ),
    ));
  }

  Widget _buildRowFinish(item2, status) {
    final rowColor = {
      'colorBtn': status == 'status0'
          ? Theme.of(context).primaryColor
          : Theme.of(context).backgroundColor,
      'colorText': status == 'status0'
          ? Color(0xFF333333)
          : Theme.of(context).backgroundColor
    };
    return IntrinsicHeight(
        child: Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 16, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(right: 12),
              child: Image.asset(
                status == 'status0'
                    ? 'assets/images/select1.png'
                    : 'assets/images/select0.png',
                fit: BoxFit.fill,
                width: 16,
                height: 16,
              )),
          Expanded(
            child: Text(
              "${item2['label']}",
              style: TextStyle(fontSize: 16, color: rowColor['colorText']),
            ),
          ),
          DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: rowColor['colorBtn'],
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Container(
                width: 80,
                height: 24,
                child: TextButton(
                  onPressed: () {
                    onPressToAnswer(item2);
                  },
                  style: ButtonStyle(
                    padding: ButtonStyleButton.allOrNull(EdgeInsets.zero),
                  ),
                  child: Center(
                    child: Text(
                      "开始答题",
                      style: TextStyle(color: rowColor['colorBtn']),
                    ),
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}

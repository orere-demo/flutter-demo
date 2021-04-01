import 'package:demo1/index.dart';
import 'package:provider/provider.dart';
import 'package:demo1/model/counter_model.dart';

class LoginRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    final textSize = Provider.of<int>(context).toDouble();
    return Scaffold(
        appBar: AppBar(
          title: Text('答题APP'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('${_counter.value}'),
            Consumer2<CounterModel, int>(
                builder: (context, CounterModel counter1, int textSize1, _) =>
                    Text('${counter1.value}    $textSize1')),
            Consumer<CounterModel>(
              builder: (context, CounterModel counter, child) => TextButton(
                  onPressed: () {
                    counter.increment();
                  },
                  child: child),
              child: Text(
                '+1',
                style: TextStyle(fontSize: textSize),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Application.router.navigateTo(context, '/home?txt=a321');
                  },
                  child: Text(
                    '登录',
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Application.router.navigateTo(context, '/home?txt=a321');
                  },
                  child: Text('注册'),
                )
              ],
            )
          ],
        ));
  }
}

// class LoginData {
//   String name;
//   String passwd;
//   String apikey;
// }

// class GoodsListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GoodListProvider(

//     );
//   }
// }

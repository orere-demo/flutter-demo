import 'package:demo1/routes/application.dart';

import '../index.dart';

class LoginRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    // throw UnimplementedError();
    // return Center(
    //   child: Text('123'),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text('答题APP'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Application.router.navigateTo(context, '/home?txt=a321');
            },
            child: Text('点击进入')),
      ),
    );
  }
}

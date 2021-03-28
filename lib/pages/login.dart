import 'package:demo1/index.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset('assets/images/logo_title.png'),
                Text('点击进入')
              ],
            ),
          ),
        ));
  }
}

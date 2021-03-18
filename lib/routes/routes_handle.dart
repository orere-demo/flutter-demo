import 'package:fluro/fluro.dart';
import 'package:demo1/routes/exportPackages.dart';

// 有固定写法 Map<String, List<String>> params,   Map<String, dynamic> params，
// 获取参数 params['id'].first            params['id']

Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  // String userId = params['userId']
  // return HomeRoute(userId)
  String txtparams = params['txt'].first;
  print('123$txtparams');
  return HomeRoute(txtparams: txtparams);
});

Handler loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginRoute();
});

import 'package:fluro/fluro.dart';
import 'package:demo1/routes/exportPackages.dart';

// 有固定写法 Map<String, List<String>> params,   Map<String, dynamic> params，
// 获取参数 params['id'].first            params['id']

Handler loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginRoute();
});

Handler homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  // String userId = params['userId']
  // return HomePage(userId)
  String txtparams = params['txt'].first;
  return HomePage(txtparams: txtparams);
});

Handler answerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print(params);
  return AnswerPage(id: params['id'].first);
});

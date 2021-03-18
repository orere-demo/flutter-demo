import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:demo1/routes/routes.dart';
import 'package:demo1/routes/application.dart';

// import 'package:fluro/fluro.dart';
// import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    // router 初始化
    Routes.defineRoutes(router);
    // 静态化，便于引用全局注入
    Application.router = router;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}

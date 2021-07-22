import 'package:flutter/material.dart';
import 'package:demo1/env/env_config.dart';
import 'package:demo1/env/config_wrapper.dart';
import 'package:demo1/app.dart';

void main() {
  // runApp(ConfigWrapper(
  //   child: FlutterReduxApp(),
  //   config: EnvConfig.fromJson(config),
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class User {
  // final String name;
  // final String email;

  // User(this.name, this.email);

  // User.fromJson(Map<String, dynamic> json)
  //     : name = json['name'],
  //       email = json['email'];
  // User() {
  //   print('In User\'s constructor.');
  // }
}

class Child extends User {
  Child() {
    print('In Child\'s constructor.');
  }
}

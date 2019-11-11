import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContextRoute(),
//        home:Text("Hello world",
//          style: TextStyle(
//              color: Colors.red,
//              fontSize: 18.0,
//              height: 1.2,
//              fontFamily: "Courier",
//              background: new Paint()..color=Colors.yellow,
//              decoration:TextDecoration.underline,
//              decorationStyle: TextDecorationStyle.wavy
//          ),
//        ),
    );
  }
}

class ContextRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: Text("Hello world",
          style: TextStyle(
              color: Colors.red,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: new Paint()..color=Colors.yellow,
              decoration:TextDecoration.underline,
              decorationStyle: TextDecorationStyle.wavy,
          ),
        )),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContextRoute(),
    );
  }
}

class ContextRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试Scaffold"),
      ),
      body: Builder(builder: (BuildContext context) {
        Scaffold scaffold = context.ancestorWidgetOfExactType(Scaffold);
        return (scaffold.appBar as AppBar).title;
      },),
    );
  }
}

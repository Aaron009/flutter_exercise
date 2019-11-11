import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Title",
      home: ContextRoute(),
    );
  }
}

class ContextRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold测试"),
      ),
      body: Container(
        child: Builder(builder: (BuildContext context) {
          Scaffold scaffold = context.ancestorWidgetOfExactType(Scaffold);
          return (scaffold.appBar as AppBar).title;
        },),
      ),
    );
  }
}

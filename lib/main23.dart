import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColumnExample(),
    );
  }
}

class ColumnExample extends StatefulWidget {
  @override
  _ColumnExampleState createState() => _ColumnExampleState();
}

class _ColumnExampleState extends State<ColumnExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试Column"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.up,
        children: <Widget>[
          Text("hi"),
          Text("world"),
        ],
      ),
    );
  }
}


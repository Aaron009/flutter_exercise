import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListExample(),
    );
  }
}

class ListExample extends StatefulWidget {
  @override
  _ListExampleState createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动视图之list'),
      ),
      // 只适用于子组件较少的情况
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          const Text('I\'m dedicating every day to you'),
          const Text('Domestic life was never quite my style'),
          const Text('When you smile, you knock me out, I fall apart'),
          const Text('And I thought I was so smart'),
        ],
      ),
    );
  }
}


import 'package:first_app/main50.dart';
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
        title: Text('滚动视图list 添加固定列表头'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          ListTile(
            title: Text("商品列表"),
            subtitle: Text('A strong animal'),
            dense: true,
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            }),
          ),
        ]),
      ),
    );
  }
}

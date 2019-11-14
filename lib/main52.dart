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
  Widget divider1 = Divider(
    color: Colors.blue,
  );

  Widget divider2 = Divider(color: Colors.green);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动视图之list'),
      ),
      // 只适用于子组件较少的情况
      body: ListView.separated(
        itemCount: 100,
        //列表项构造器
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        },
        //分割器构造器
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? divider1 : divider2;
        },
      ),
    );
  }
}

import 'package:first_app/main55.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GridExample(),
    );
  }
}

class GridExample extends StatefulWidget {
  @override
  _GridExampleState createState() => _GridExampleState();
}

class _GridExampleState extends State<GridExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('纵轴子元素为固定长度的GridView'),
      ),
      // SliverGridDelegateWithMaxCrossAxisExtent 实现了一个横轴子元素为固定最大长度
//      body: GridView(
//        padding: EdgeInsets.zero,
//        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//            maxCrossAxisExtent: 120.0, childAspectRatio: 2.0 //宽高比为2
//            ),
//        children: <Widget>[
//          Icon(Icons.ac_unit),
//          Icon(Icons.airport_shuttle),
//          Icon(Icons.all_inclusive),
//          Icon(Icons.beach_access),
//          Icon(Icons.cake),
//          Icon(Icons.free_breakfast),
//        ],
//      ),

      // 等价上方

      body: GridView.extent(
        maxCrossAxisExtent: 120.0,
        childAspectRatio: 2.0,
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast),
        ],
      ),
    );
  }
}

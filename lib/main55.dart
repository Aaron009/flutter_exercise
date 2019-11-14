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
        title: Text('GridExample'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
            child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 0,
                    crossAxisCount: 3, //横轴三个子widget
                    childAspectRatio: 1.0 //宽高比为1时，子widget
                    ),
                children: <Widget>[
                  Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),
                  Icon(Icons.free_breakfast)
                ]),
          ),

          // 等价上方
          SizedBox(
            height: 200,
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

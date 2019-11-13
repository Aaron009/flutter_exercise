import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlignExample(),
    );
  }
}

class AlignExample extends StatefulWidget {
  @override
  _AlignExampleState createState() => _AlignExampleState();
}

class _AlignExampleState extends State<AlignExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('对齐与相对定位（Align）'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue[50],
            child: Align(
              alignment: Alignment.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              color: Colors.blue[50],
              child: Align(
                widthFactor: 2,
                heightFactor: 2,
                alignment: Alignment.topRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
          ),

          // FractionalOffset 便宜坐标
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue[50],
              child: Align(
                alignment: FractionalOffset(1, 1),
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            )
          ),

        ],
      ),
    );
  }
}

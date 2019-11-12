import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StackFitExample(),
    );
  }
}

class StackFitExample extends StatefulWidget {
  @override
  _StackFitExampleState createState() => _StackFitExampleState();
}

class _StackFitExampleState extends State<StackFitExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Fit属性'),
      ),
      // 相关教程
      // https://book.flutterchina.club/chapter4/stack.html
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: <Widget>[
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Container(
              child: Text("Hello world", style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}

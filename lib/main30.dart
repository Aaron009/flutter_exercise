import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StackExample(),
    );
  }
}

class StackExample extends StatefulWidget {
  @override
  _StackExampleState createState() => _StackExampleState();
}

class _StackExampleState extends State<StackExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('层叠布局 Stack、Positioned'),
      ),
      body: //通过ConstrainedBox来确保Stack占满屏幕
      ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Container(
              child: Text("Hello world",style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColumnMaxWidth(),
    );
  }
}

class ColumnMaxWidth extends StatefulWidget {
  @override
  _ColumnMaxWidthState createState() => _ColumnMaxWidthState();
}

class _ColumnMaxWidthState extends State<ColumnMaxWidth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clumn测试最大宽带"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Text("Hi"),
            Text("World"),
          ],
        ),
      ),
    );
  }
}


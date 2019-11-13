import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CenterExample(),
    );
  }
}

class CenterExample extends StatefulWidget {
  @override
  _CenterExampleState createState() => _CenterExampleState();
}

class _CenterExampleState extends State<CenterExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Center注意事项"),
      ),
      // 当widthFactor或heightFactor为null时组件的宽高将会占用尽可能多的空间
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Center(
                child: Text("xxx"),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Center(
                widthFactor: 1,
                heightFactor: 1,
                child: Text("xxx"),
              ),
            ),
          ],
        ),
      )
    );
  }
}


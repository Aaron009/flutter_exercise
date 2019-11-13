import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConstrainedBoxExample(),
    );
  }
}

class ConstrainedBoxExample extends StatefulWidget {
  @override
  _ConstrainedBoxExampleState createState() => _ConstrainedBoxExampleState();
}

class _ConstrainedBoxExampleState extends State<ConstrainedBoxExample> {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('尺寸限制修复'),
        actions: <Widget>[
          // 改造请看这里
          // 教程： https://book.flutterchina.club/chapter5/constrainedbox_and_sizebox.html
          // 其他限制
          // AspectRatio，它可以指定子组件的长宽比、
          // LimitedBox 用于指定最大宽高、
          // FractionallySizedBox 可以根据父容器宽高的百分比来设置子组件宽高等
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          )
        ],
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}


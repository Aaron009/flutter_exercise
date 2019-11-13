import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RotatedBoxExample(),
    );
  }
}

class RotatedBoxExample extends StatefulWidget {
  @override
  _RotatedBoxExampleState createState() => _RotatedBoxExampleState();
}

class _RotatedBoxExampleState extends State<RotatedBoxExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('旋转组件RotatedBox'),
      ),
      // 重点
      // RotatedBox 和 Transform.rotate功能相似，它们都可以对子组件进行旋转变换，但是有一点不同：
      // RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小。
      // RotatedBox 只能旋转 90度、180度、270度、360度....
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  //将Transform.rotate换成RotatedBox
                  child: RotatedBox(
                    quarterTurns: 1, //旋转90度(1/4圈)
                    // 角度转quarterTurns公式
                    // 角度/360*4 = quarterTurns
                    child: Text("Hello world"),
                  ),
                ),
                Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
              ],
            ),

            // 示例二
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: RotatedBox(
                    quarterTurns: (30/360*4).toInt(), //旋转30度(1/4圈)
                    child: Text("Hello world"),
                  ),
                ),
                Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}


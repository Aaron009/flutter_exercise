import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransformExample(),
    );
  }
}

class TransformExample extends StatefulWidget {
  @override
  _TransformExampleState createState() => _TransformExampleState();
}

class _TransformExampleState extends State<TransformExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('变换（Transform）'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // 矩阵变换的相关内容属于线性代数范畴, 示例
            // 教程
            // https://zhuanlan.zhihu.com/p/40903279
            Container(
              color: Colors.black,
              child: new Transform(
                alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                child: new Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),

            //平移
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                //默认原点为左上角，左移20像素，向上平移5像素
                child: Transform.translate(
                  offset: Offset(10, 0),
                  child: Text("Hello world"),
                ),
              ),
            ),

            //旋转
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.rotate(
                    //旋转90度
                    angle: pi / 2, // 这里指弧度
                    child: Text("Hello"),
                  ),
                )),

            //旋转2
            // https://github.com/dart-lang/sdk/issues/4211
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.rotate(
                    //旋转90度
                    angle: 90 * (pi / 180.0), // 角度转弧度
                    child: Text("Hello"),
                  ),
                )),

            // 缩放
            // 其中注意事项看 main41
            Padding(
              padding: EdgeInsets.only(top:30),
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                      scale: 1.5, //放大到1.5倍 注意是文本放大了。
                      child: Text("Hello world"))
              ),
            ),
          ],
        ),
      ),
    );
  }
}

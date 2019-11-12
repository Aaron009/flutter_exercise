import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProgressExample(),
    );
  }
}

class ProgressExample extends StatefulWidget {
  @override
  _ProgressExampleState createState() => _ProgressExampleState();
}

class _ProgressExampleState extends State<ProgressExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: LinearProgressIndicator(
              //进度条显示50%
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10),
            child: // 模糊进度条(会执行一个旋转动画)
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10),
            child: //进度条显示50%，会显示一个半圆
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
              strokeWidth: 10,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10),
            child: // 线性进度条高度指定为10
            SizedBox(
              height: 10,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10),
            child: // 圆形进度条直径指定为100
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .7,
                strokeWidth: 10,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10),
            child: // 宽高不等，显示椭圆
            SizedBox(
              height: 100,
              width: 130,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .7,
              ),
            ),
          ),

        ],
      ),
    ));
  }
}

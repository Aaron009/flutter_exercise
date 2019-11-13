import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DecoratedBoxExample(),
    );
  }
}

class DecoratedBoxExample extends StatefulWidget {
  @override
  _DecoratedBoxExampleState createState() => _DecoratedBoxExampleState();
}

class _DecoratedBoxExampleState extends State<DecoratedBoxExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('装饰容器DecoratedBox,其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等。', maxLines: 10,),
      ),
      // 教程 https://book.flutterchina.club/chapter5/decoratedbox.html
      body: Center(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                    borderRadius: BorderRadius.circular(3.0), //3像素圆角
                    boxShadow: [ //阴影
                      BoxShadow(
                          color:Colors.black54,
                          offset: Offset(2.0,2.0),
                          blurRadius: 4.0
                      )
                    ]
                ),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                  child: Text("Login", style: TextStyle(color: Colors.white),),
                )
            ),
          ],
        ),
      ),
    );
  }
}

